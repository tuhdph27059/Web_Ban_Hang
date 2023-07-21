package com.example.asmjava5s.giohang;

import java.util.ArrayList;
import java.util.List;

public class GioHangViewModel {
    private List<SanPhamTrongGioViewModel> listSanPham = new ArrayList<>();

    public List<SanPhamTrongGioViewModel> getListSanPham() {
        return listSanPham;
    }

    public void setListSanPham(List<SanPhamTrongGioViewModel> listSanPham) {
        this.listSanPham = listSanPham;
    }
}
