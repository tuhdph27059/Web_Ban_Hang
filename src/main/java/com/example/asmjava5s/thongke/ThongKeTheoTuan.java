package com.example.asmjava5s.thongke;

public class ThongKeTheoTuan {
    private String tuan;
    private Integer soLuong;
    private String tongTien;

    public ThongKeTheoTuan() {
    }

    public ThongKeTheoTuan(String tuan, Integer soLuong, String tongTien) {
        this.tuan = tuan;
        this.soLuong = soLuong;
        this.tongTien = tongTien;
    }

    public String getTuan() {
        return tuan;
    }

    public void setTuan(String tuan) {
        this.tuan = tuan;
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
