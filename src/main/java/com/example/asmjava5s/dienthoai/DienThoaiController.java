package com.example.asmjava5s.dienthoai;

import com.example.asmjava5s.hoadon.IHoaDonChiTietRepository;
import com.example.asmjava5s.thongke.Top10SPTonKhoLauNhat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/asm")
public class DienThoaiController {
    @Autowired
    private IDienThoaiRepository dienThoaiRepository;

    @Autowired
    private IHoaDonChiTietRepository hoaDonChiTietRepository;

    @GetMapping("/view")
    public String view(Model model, @RequestParam(defaultValue = "1") int page) {
        Page<DienThoai> pageDienThoai;
        Pageable pageable = PageRequest.of(page - 1, 10);
//        pageDienThoai = repository.findAll(pageable);
        pageDienThoai = dienThoaiRepository.findAll(pageable);
        model.addAttribute("chek", 0);
        model.addAttribute("pageDienThoai", pageDienThoai);
        return "/dienthoai/dien-thoai";
    }
    @GetMapping("/view/san-pham")
    public String viewsp(Model model, @RequestParam(defaultValue = "1") int page) {
        Page<DienThoai> pageDienThoai;
        Pageable pageable = PageRequest.of(page - 1, 10);
//        pageDienThoai = repository.findAll(pageable);
        pageDienThoai = dienThoaiRepository.findAll(pageable);
        model.addAttribute("chek", 0);
        model.addAttribute("pageDienThoai", pageDienThoai);
        return "/dienthoai/danh-sach-san-pham";
    }
//    @GetMapping("/view-add")
//    public String viewAdd() {
//        return "/dienthoai/add";
//    }

    @PostMapping("/add")
    public String add(@ModelAttribute DienThoai dienThoai) {

        dienThoaiRepository.save(dienThoai);
        return "redirect:/asm/view";
    }

    @GetMapping("/view-update")
    public String viewUpdate(Model model, @RequestParam(name = "maUpdate") Integer maUpdate) {
        DienThoai dienThoai = dienThoaiRepository.findDienThoaiByMa(maUpdate);
        model.addAttribute("dienThoai", dienThoai);
        return "/dienthoai/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute DienThoai dienThoai) {
        dienThoaiRepository.save(dienThoai);
        return "redirect:/asm/view";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam(name = "maDelete") Integer maDelete) {
        dienThoaiRepository.deleteById(maDelete);
        return "redirect:/asm/view";
    }
}
