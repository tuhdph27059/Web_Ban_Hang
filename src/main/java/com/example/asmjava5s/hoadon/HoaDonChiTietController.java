package com.example.asmjava5s.hoadon;

import com.example.asmjava5s.dienthoai.DienThoai;
import com.example.asmjava5s.dienthoai.IDienThoaiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/hoa-don-chi-tiet")
public class HoaDonChiTietController {
    @Autowired
    private IHoaDonChiTietRepository hoaDonChiTietRepository;
    @Autowired
    private IDienThoaiRepository dienThoaiRepository;

    @GetMapping("/view")
    public String viewHoaDon(Model model, @RequestParam(name = "maHoaDon") Integer maHD) {
//        Optional obj = hoaDonChiTietRepository.findById("F3A77E99-0169-48AE-BAAB-267FD0AF9175");
        List<HoaDonChiTiet> list = hoaDonChiTietRepository.findByMaHD(maHD);
        List<DienThoai> listDienThoai = dienThoaiRepository.findAll();
        model.addAttribute("listDienThoai", listDienThoai);
        model.addAttribute("listHoaDonChiTiet", list);
        return "/hoadon/hoa-don-chi-tiet";
    }
}
