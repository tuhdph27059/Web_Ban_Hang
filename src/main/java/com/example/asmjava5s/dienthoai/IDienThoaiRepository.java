package com.example.asmjava5s.dienthoai;

import com.example.asmjava5s.dienthoai.DienThoai;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;

@Component
public interface IDienThoaiRepository extends JpaRepository<DienThoai, Integer> {
    DienThoai findDienThoaiByMa(Integer ma);

//    @Query("""
//                    select d from DienThoai d order by d.ma desc
//            """)
//    Page<DienThoai> danhSachGiamDanTheoMa(Pageable pageable);
}
