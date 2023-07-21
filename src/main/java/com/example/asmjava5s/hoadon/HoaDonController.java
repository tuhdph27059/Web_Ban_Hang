package com.example.asmjava5s.hoadon;

import com.example.asmjava5s.dienthoai.DienThoai;
import com.example.asmjava5s.dienthoai.IDienThoaiRepository;
import com.example.asmjava5s.giohang.GioHangService;
import com.example.asmjava5s.giohang.SanPhamTrongGioViewModel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/asm/hoa-don")
@Slf4j
public class HoaDonController {

    @Autowired
    private IHoaDonRepository hoaDonRepository;

    @Autowired
    private IDienThoaiRepository dienThoaiRepository;
    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private IHoaDonChiTietRepository hoaDonChiTietRepository;

    @GetMapping("/view")
    public String viewHoaDon(Model model, @RequestParam(defaultValue = "1") int page) {
        Page<HoaDon> pageHoaDon;
        Pageable pageable = PageRequest.of(page - 1, 10);
        pageHoaDon=hoaDonRepository.danhSachHoaDonGiamDanTheoMa(pageable);
        model.addAttribute("pageHoaDon", pageHoaDon);
        return "/hoadon/hoa-don";
    }

    @PostMapping("/add")
    public String addGioHang() {
//        tạo hóa đơn
        log.info("tao hoa don");
        List<SanPhamTrongGioViewModel> sanPhamTrongGio = gioHangService.xemGioHang().getListSanPham();
        float tongTienTatCaSanPhamTrongGio = 0;
        for (SanPhamTrongGioViewModel sp : sanPhamTrongGio) {
            tongTienTatCaSanPhamTrongGio += sp.getTongTien();
        }
        Date date = new Date();
        HoaDon hoaDon = new HoaDon();
        hoaDon.setTongTienHoaDon(tongTienTatCaSanPhamTrongGio);
        hoaDon.setNgayTao(date);
        hoaDon = hoaDonRepository.save(hoaDon);
        log.info("Ma hoa don:{}", hoaDon.getMa());
//        Tạo hóa đơn chi tiết
        List<HoaDonChiTiet> hoaDonChiTietList = new ArrayList<>();
        for (SanPhamTrongGioViewModel sp : sanPhamTrongGio) {
            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
            hoaDonChiTiet.setMaHD(hoaDon.getMa());
            hoaDonChiTiet.setMaSP(sp.getMaSanPham());
            hoaDonChiTiet.setGiaTienSP(sp.getGiaTien());
            hoaDonChiTiet.setSoLuongMua(sp.getSoLuong());
            hoaDonChiTietList.add(hoaDonChiTiet);
//            Cập nhật lại số lượng sản sau khi mua
            DienThoai dienThoai = dienThoaiRepository.findDienThoaiByMa(sp.getMaSanPham());
            dienThoai.setSoLuongTon(dienThoai.getSoLuongTon() - sp.getSoLuong());
            dienThoaiRepository.save(dienThoai);
        }
        hoaDonChiTietRepository.saveAll(hoaDonChiTietList);
        gioHangService.xoaTatCaSanPhamSauKhiMua();
        return "redirect:/asm/hoa-don/view";
    }
}
