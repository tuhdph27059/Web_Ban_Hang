package com.example.asmjava5s.thongke;

public class Top10SPTonKhoLauNhat {
    private Integer maSP;

    private Integer soLuong;

    private Integer soNgay;

    public Top10SPTonKhoLauNhat() {
    }

    public Top10SPTonKhoLauNhat(Integer maSP, Integer soLuong, Integer soNgay) {
        this.maSP = maSP;
        this.soLuong = soLuong;
        this.soNgay = soNgay;
    }

    public Integer getMaSP() {
        return maSP;
    }

    public void setMaSP(Integer maSP) {
        this.maSP = maSP;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

    public Integer getSoNgay() {
        return soNgay;
    }

    public void setSoNgay(Integer soNgay) {
        this.soNgay = soNgay;
    }
}
