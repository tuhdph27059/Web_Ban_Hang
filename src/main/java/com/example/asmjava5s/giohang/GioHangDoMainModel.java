package com.example.asmjava5s.giohang;

import java.util.HashMap;
import java.util.Map;

public class GioHangDoMainModel {
    Map<Integer, Integer> danhSachSanPham = new HashMap<>();

    public Map<Integer, Integer> getDanhSachSanPham() {
        return danhSachSanPham;
    }

    public void setDanhSachSanPham(Map<Integer, Integer> danhSachSanPham) {
        this.danhSachSanPham = danhSachSanPham;
    }
}
