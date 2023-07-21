package com.example.asmjava5s.thongke;

public class Top10SPBanChayNhat {
    private Integer maSP;
    private Integer soLuong;

    public Top10SPBanChayNhat() {
    }

    public Top10SPBanChayNhat(Integer maSP, Integer soLuong) {
        this.maSP = maSP;
        this.soLuong = soLuong;
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
}
