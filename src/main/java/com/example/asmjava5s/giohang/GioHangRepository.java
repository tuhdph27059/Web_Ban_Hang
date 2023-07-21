package com.example.asmjava5s.giohang;

import org.springframework.stereotype.Repository;
import org.springframework.web.context.annotation.SessionScope;

import java.util.Map;

@Repository
@SessionScope
public class GioHangRepository {
    private GioHangDoMainModel gioHang = new GioHangDoMainModel();

    public void themSanPhamVaoGio(Integer maSanPham, Integer soLuongThem) {
        Map<Integer, Integer> sanPhamTrongGio = gioHang.getDanhSachSanPham();
        sanPhamTrongGio.put(maSanPham, soLuongThem);
    }

    public void xoaSanPhamKhoiGio(Integer maSanPham) {
        Map<Integer, Integer> sanPhamTrongGio = gioHang.getDanhSachSanPham();
        sanPhamTrongGio.remove(maSanPham);
    }

    public void xoaTatCaSanPhamSauKhiMua() {
        Map<Integer, Integer> sanPhamTrongGio = gioHang.getDanhSachSanPham();
        sanPhamTrongGio.clear();
    }

    public void suaSoluongSanPhamTrongGio(Integer maSanPham, Integer soLuongCapNhat) {
        Map<Integer, Integer> sanPhamTrongGio = gioHang.getDanhSachSanPham();
        sanPhamTrongGio.put(maSanPham, soLuongCapNhat);
    }

    public Integer laySoLuongSanPhamTrongGio(Integer maSanPham) {
        return gioHang.getDanhSachSanPham().get(maSanPham);
    }

    public Boolean sanPhamDaCoTrongGio(Integer maSanPham) {
        return gioHang.getDanhSachSanPham().containsKey(maSanPham);
    }

    public GioHangDoMainModel layGioHang() {
        return gioHang;
    }
}
