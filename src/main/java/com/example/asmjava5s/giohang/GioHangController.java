package com.example.asmjava5s.giohang;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/asm/gio-hang")
public class GioHangController {
    @Autowired
    private GioHangService gioHangService;


    //    @GetMapping("/add/{maSanPham}")
//    public String themSPVaoGio(@PathVariable(name = "maSanPham") Integer maSanPham) {
//        service.themSanPhamVaoGio(maSanPham, 1);
//        return "redirect:/gio-hang/view";
////      tuong duong voi sendRedirect
//    }
    @GetMapping("/add")
    public String addGioHang(@RequestParam(name = "maSanPham") Integer maSanPham) {
        gioHangService.themSanPhamVaoGio(maSanPham, 1);
        return "redirect:/asm/gio-hang/view";
    }

    @GetMapping("/adds")
    public String addsGioHang(@RequestParam(name = "maSanPham") Integer maSanPham, @RequestParam(name = "soLuongSanPham") Integer soLuongSanPham) {
        if (soLuongSanPham <= 0) {
            gioHangService.xoaSanPhamKhoiGio(maSanPham);
        } else {
            gioHangService.nhapSoLuongVaoGio(maSanPham, soLuongSanPham);
        }


        return "redirect:/asm/gio-hang/view";
    }

    @GetMapping("/view")
    public String viewGioHang(Model model) {
        List<SanPhamTrongGioViewModel> sanPhamTrongGio = gioHangService.xemGioHang().getListSanPham();
        float tongTienTatCaSanPhamTrongGio = 0;
        for (SanPhamTrongGioViewModel sp : sanPhamTrongGio) {
            tongTienTatCaSanPhamTrongGio += sp.getTongTien();
        }
        model.addAttribute("tongTienTatCaSanPhamTrongGio", tongTienTatCaSanPhamTrongGio);
        model.addAttribute("sanPhamTrongGio", sanPhamTrongGio);
        return "giohang/gio-hang";
    }

    @GetMapping("/delete")
    public String xoaSanPhamKhoiGioHang(@RequestParam(name = "maSanPham") Integer maSanPham) {
        gioHangService.xoaSanPhamKhoiGio(maSanPham);
        return "redirect:/asm/gio-hang/view";
    }

    @GetMapping("/xoa-tat-ca")
    public String xoaTatCa() {
        gioHangService.xoaTatCaSanPhamSauKhiMua();
        return "redirect:/asm/gio-hang/view";
    }
}
