package com.example.asmjava5s.giohang;

public class SanPhamTrongGioViewModel {
    private Integer maSanPham;
    private String tenSanPham;
    private Float giaTien;
    private Integer soLuong;

    public Float getTongTien() {
        return giaTien * soLuong;
    }

    public SanPhamTrongGioViewModel() {
    }

    public SanPhamTrongGioViewModel(Integer maSanPham, String tenSanPham, Float giaTien, Integer soLuong) {
        this.maSanPham = maSanPham;
        this.tenSanPham = tenSanPham;
        this.giaTien = giaTien;
        this.soLuong = soLuong;
    }

    public Integer getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(Integer maSanPham) {
        this.maSanPham = maSanPham;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public Float getGiaTien() {
        return giaTien;
    }

    public void setGiaTien(Float giaTien) {
        this.giaTien = giaTien;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

}
