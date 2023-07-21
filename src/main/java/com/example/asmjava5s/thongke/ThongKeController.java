package com.example.asmjava5s.thongke;

import com.example.asmjava5s.dienthoai.DienThoai;
import com.example.asmjava5s.dienthoai.IDienThoaiRepository;
import com.example.asmjava5s.hoadon.IHoaDonChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/asm/thong-ke")
public class ThongKeController {
    @Autowired
    private IHoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private IDienThoaiRepository dienThoaiRepository;

    @GetMapping("/view")
    public String thongKeView(Model model) {
//        Top 10 mặt hàng bán chạy nhất
//        String numberString = "4.4029184E8";
//        double number = Double.parseDouble(numberString);
//        String formattedNumber = df.format(number);
        List<Object[]> listObjectTop10SanPhamBanChayNhat = hoaDonChiTietRepository.listTop10SanPhamBanChayNhat();
        List<Top10SPBanChayNhat> listTop10SPBanChayNhat = new ArrayList<>();
        for (Object[] ob : listObjectTop10SanPhamBanChayNhat) {
            Top10SPBanChayNhat top10 = new Top10SPBanChayNhat();
            top10.setMaSP((((Number) ob[0]).intValue()));
            top10.setSoLuong((((Number) ob[1]).intValue()));
            listTop10SPBanChayNhat.add(top10);
        }
        List<DienThoai> listDienThoai = dienThoaiRepository.findAll();
        model.addAttribute("listDienThoai", listDienThoai);
        model.addAttribute("litsTop10SPBanChayNhat", listTop10SPBanChayNhat);
//        TOP 10 mặt hàng tồn lâu nhất
        List<Object[]> listObjectTop10SPTonKhoLauNhat = hoaDonChiTietRepository.listTop10SPTonKhoLauNhat();
        List<Top10SPTonKhoLauNhat> top10SPTonKhoLauNhatList = new ArrayList<>();
        for (Object[] ob4 : listObjectTop10SPTonKhoLauNhat) {
            Top10SPTonKhoLauNhat top10TonLauNhat = new Top10SPTonKhoLauNhat();
            top10TonLauNhat.setMaSP((((Number) ob4[0]).intValue()));
            top10TonLauNhat.setSoLuong((((Number) ob4[1]).intValue()));
            top10TonLauNhat.setSoNgay((((Number) ob4[2]).intValue()));
            top10SPTonKhoLauNhatList.add(top10TonLauNhat);
        }
        model.addAttribute("top10SPTonKhoLauNhatList", top10SPTonKhoLauNhatList);
        return "/thongke/thong-ke";
    }

    @GetMapping("/date")
    public String thongKeView(Model model, @RequestParam(name = "thang") Integer thang, @RequestParam(name = "nam") Integer nam) {
        DecimalFormat df = new DecimalFormat("#,###");
        List<Object[]> listObjectTop10SanPhamBanChayNhat = hoaDonChiTietRepository.listTop10SanPhamBanChayNhat();
        List<Top10SPBanChayNhat> listTop10SPBanChayNhat = new ArrayList<>();
        for (Object[] ob : listObjectTop10SanPhamBanChayNhat) {
            Top10SPBanChayNhat top10 = new Top10SPBanChayNhat();
            top10.setMaSP((((Number) ob[0]).intValue()));
            top10.setSoLuong((((Number) ob[1]).intValue()));
            listTop10SPBanChayNhat.add(top10);
        }
        List<DienThoai> listDienThoai = dienThoaiRepository.findAll();
        model.addAttribute("listDienThoai", listDienThoai);
        model.addAttribute("litsTop10SPBanChayNhat", listTop10SPBanChayNhat);
        List<Object[]> listObjectTop10SPTonKhoLauNhat = hoaDonChiTietRepository.listTop10SPTonKhoLauNhat();
        List<Top10SPTonKhoLauNhat> top10SPTonKhoLauNhatList = new ArrayList<>();
        for (Object[] ob4 : listObjectTop10SPTonKhoLauNhat) {
            Top10SPTonKhoLauNhat top10TonLauNhat = new Top10SPTonKhoLauNhat();
            top10TonLauNhat.setMaSP((((Number) ob4[0]).intValue()));
            top10TonLauNhat.setSoLuong((((Number) ob4[1]).intValue()));
            top10TonLauNhat.setSoNgay((((Number) ob4[2]).intValue()));
            top10SPTonKhoLauNhatList.add(top10TonLauNhat);
        }
        model.addAttribute("top10SPTonKhoLauNhatList", top10SPTonKhoLauNhatList);
//                Thống kê theo ngày
        List<Object[]> listObjectTheoNgay = hoaDonChiTietRepository.thongKeTheoNgay(thang, nam);
        List<ThongKeTheoNgay> thongKeTheoNgayList = new ArrayList<>();
        for (Object[] ob1 : listObjectTheoNgay) {
            ThongKeTheoNgay tktn = new ThongKeTheoNgay();
            tktn.setNgay((((Date) ob1[0]).toString()));
            tktn.setSoLuong((((Number) ob1[1]).intValue()));
            double number1 = Double.parseDouble(String.valueOf((((Number) ob1[2]).doubleValue())));
            tktn.setTongTien(df.format(number1));
            thongKeTheoNgayList.add(tktn);
        }
        model.addAttribute("thongKeTheoNgayList", thongKeTheoNgayList);
//        Thống kê theo tuần
//        List<Object[]> listObjectTheoTuan = hoaDonChiTietRepository.thongKeTheoTuan(thang, nam);
//        List<ThongKeTheoTuan> thongKeTheoTuanList = new ArrayList<>();
//        for (Object[] ob2 : listObjectTheoTuan) {
//            ThongKeTheoTuan tktt = new ThongKeTheoTuan();
//            tktt.setTuan((((Number) ob2[0]).toString()));
//            tktt.setSoLuong((((Number) ob2[1]).intValue()));
//            double number2 = Double.parseDouble(String.valueOf((((Number) ob2[2]).doubleValue())));
//            tktt.setTongTien(df.format(number2));
//            thongKeTheoTuanList.add(tktt);
//        }
//        model.addAttribute("thongKeTheoTuanList", thongKeTheoTuanList);
//        Thống kê theo tháng
        List<Object[]> listObjectTheoThang = hoaDonChiTietRepository.thongKeTheoThang(thang, nam);
        List<ThongKeTheoThang> thongKeTheoThangList = new ArrayList<>();
        for (Object[] ob3 : listObjectTheoThang) {
            ThongKeTheoThang tktth = new ThongKeTheoThang();
            tktth.setThang((((Number) ob3[0]).toString()));
            tktth.setSoLuong((((Number) ob3[1]).intValue()));
            double number3 = Double.parseDouble(String.valueOf((((Number) ob3[2]).doubleValue())));
            tktth.setTongTien(df.format(number3));
            thongKeTheoThangList.add(tktth);
        }
        model.addAttribute("thongKeTheoThangList", thongKeTheoThangList);
        return "/thongke/thong-ke";
    }
}
