package com.example.asmjava5s.thongke;

public class ThongKeTheoThang {
    private String thang;
    private Integer soLuong;
    private String tongTien;

    public ThongKeTheoThang() {
    }

    public ThongKeTheoThang(String thang, Integer soLuong, String tongTien) {
        this.thang = thang;
        this.soLuong = soLuong;
        this.tongTien = tongTien;
    }

    public String getThang() {
        return thang;
    }

    public void setThang(String thang) {
        this.thang = thang;
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
