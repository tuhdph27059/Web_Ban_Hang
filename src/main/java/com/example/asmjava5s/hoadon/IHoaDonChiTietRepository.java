package com.example.asmjava5s.hoadon;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Component
public interface IHoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, String> {
    List<HoaDonChiTiet> findByMaHD(Integer maHD);

    //  Top10 sp bán chạy nhất
    @Query(value = """
            SELECT TOP 10 MaSP, SUM(SoLuong)N'Số lượng sản phẩm'
            FROM HoaDonChiTiet
            GROUP BY MaSP
            ORDER BY SUM(SoLuong) DESC
            """
            , nativeQuery = true)
    List<Object[]> listTop10SanPhamBanChayNhat();

    //  Thông kê theo ngày
    @Query(value = """
            SELECT CONVERT(date, NgayTao)N'Ngày', SUM(SoLuong)N'Tổng số lượng sp bán đc',SUM(TongTien)N'Tổng tiền'
            FROM HoaDon h join HoaDonChiTiet c on c.MaHD=h.Ma WHERE MONTH(h.NgayTao)=:thang And YEAR(h.NgayTao)=:nam
            GROUP BY CONVERT(date, NgayTao)
              """, nativeQuery = true)
    List<Object[]> thongKeTheoNgay(@Param("thang") Integer thang, @Param("nam") Integer nam);

    //    Optional findById(String s);
//    Thông kê theo tuần
    @Query(value = """
            SELECT DATEPART(week,NgayTao)N'Tuần', SUM(SoLuong)N'Tổng số lượng sp bán đc', SUM(TongTien)N'Tổng tiền'
            FROM HoaDon h join HoaDonChiTiet c on c.MaHD=h.Ma where month(h.NgayTao)=:thang And YEAR(h.NgayTao)=:nam
            GROUP BY DATEPART(week,NgayTao)
              """, nativeQuery = true)
    List<Object[]> thongKeTheoTuan(@Param("thang") Integer thang, @Param("nam") Integer nam);

    //        Thông kê theo tháng
    @Query(value = """
            SELECT DATEPART(month,NgayTao)N'Tháng', SUM(SoLuong)N'Tổng số lượng sp bán đc', SUM(TongTien)N'Tổng tiền'
            FROM HoaDon h join HoaDonChiTiet c on c.MaHD=h.Ma where month(h.NgayTao)=:thang And YEAR(h.NgayTao)=:nam
            GROUP BY DATEPART(month,NgayTao)
               """, nativeQuery = true)
    List<Object[]> thongKeTheoThang(@Param("thang") Integer thang, @Param("nam") Integer nam);

    //        TOP 10 mặt hàng tồn lâu nhất
    @Query(value = """
            SELECT TOP 10 s.Ma,s.SoLuongTon,DATEDIFF(day, MIN(n.NgayNhapHang), GETDATE())N'Số ngày' FROM SanPham s
                                                           LEFT JOIN HoaDonChiTiet c ON s.Ma = c.MaSP
                                                           join NgayNhapHang n on n.MaSP=s.Ma
                                                           WHERE c.MaSP IS NULL
                                                           GROUP BY s.Ma,s.SoLuongTon
                                                           ORDER BY DATEDIFF(day, MIN(n.NgayNhapHang), GETDATE()) DESC
               """, nativeQuery = true)
    List<Object[]> listTop10SPTonKhoLauNhat();
}
