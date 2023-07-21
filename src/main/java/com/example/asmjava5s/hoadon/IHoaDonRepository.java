package com.example.asmjava5s.hoadon;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;

@Component
public interface IHoaDonRepository extends JpaRepository<HoaDon, Integer> {
    @Query("""
                    select d from HoaDon d order by d.ma desc
            """)
    Page<HoaDon> danhSachHoaDonGiamDanTheoMa(Pageable pageable);
}
