package com.example.asmjava5s.giohang;

import com.example.asmjava5s.dienthoai.DienThoai;
import com.example.asmjava5s.dienthoai.IDienThoaiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class GioHangService {

    @Autowired
    private GioHangRepository repository;

    @Autowired
    private IDienThoaiRepository sanPhamRepository;

    public void themSanPhamVaoGio(Integer maSanPham, Integer soLuongThem) {
        if (repository.sanPhamDaCoTrongGio(maSanPham) == true) {
            Integer soLuongHienCo = repository.laySoLuongSanPhamTrongGio(maSanPham);
            Integer soLuongCongDon = soLuongThem + soLuongHienCo;
            repository.suaSoluongSanPhamTrongGio(maSanPham, soLuongCongDon);
        } else {
            repository.themSanPhamVaoGio(maSanPham, soLuongThem);
        }
    }

    public void boSanPhamKhoiGio(Integer maSanPham, Integer soLuongBo) {
        if (repository.sanPhamDaCoTrongGio(maSanPham) == true) {
            Integer soLuongHienCo = repository.laySoLuongSanPhamTrongGio(maSanPham);
            Integer soLuongConLai = soLuongHienCo - soLuongBo;
            if (soLuongConLai == 0) {
                repository.xoaSanPhamKhoiGio(maSanPham);
            } else {
                repository.suaSoluongSanPhamTrongGio(maSanPham, soLuongConLai);
            }
        }
    }

    public void nhapSoLuongVaoGio(Integer maSanPham, Integer soLuongNhap) {
        if (repository.sanPhamDaCoTrongGio(maSanPham) == true) {
            repository.suaSoluongSanPhamTrongGio(maSanPham, soLuongNhap);
        }
    }

    public void xoaSanPhamKhoiGio(Integer maSanPham) {
        repository.xoaSanPhamKhoiGio(maSanPham);
    }

    public void xoaTatCaSanPhamSauKhiMua() {
        repository.xoaTatCaSanPhamSauKhiMua();
    }

    public GioHangViewModel xemGioHang() {
        GioHangDoMainModel gioHangDoMainModel = repository.layGioHang();
        Map<Integer, Integer> listSanPham = gioHangDoMainModel.getDanhSachSanPham();
        GioHangViewModel gioHangViewModel = new GioHangViewModel();
        for (Map.Entry<Integer, Integer> sp : listSanPham.entrySet()) {
            Integer maSanPham = sp.getKey();
            Integer soLuong = sp.getValue();

            DienThoai sanPham = sanPhamRepository.findById(maSanPham).get();

            SanPhamTrongGioViewModel sptg = new SanPhamTrongGioViewModel();
            sptg.setMaSanPham(maSanPham);
            sptg.setSoLuong(soLuong);
            sptg.setGiaTien(sanPham.getGiaTien());
            sptg.setTenSanPham(sanPham.getTen());
            gioHangViewModel.getListSanPham().add(sptg);
        }
        return gioHangViewModel;
    }
}
