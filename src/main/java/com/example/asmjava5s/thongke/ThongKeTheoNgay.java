package com.example.asmjava5s.thongke;

import java.util.Date;

public class ThongKeTheoNgay {
    private String ngay;
    private Integer soLuong;
    private String tongTien;

    public ThongKeTheoNgay() {
    }

    public ThongKeTheoNgay(String ngay, Integer soLuong, String tongTien) {
        this.ngay = ngay;
        this.soLuong = soLuong;
        this.tongTien = tongTien;
    }

    public String getNgay() {
        return ngay;
    }

    public void setNgay(String ngay) {
        this.ngay = ngay;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

    public String getTongTien() {
        return tongTien;
    }

    public void setTongTien(String tongTien) {
        this.tongTien = tongTien;
    }
}
