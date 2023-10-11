package com.example.asmjava5s.hoadon;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.text.DecimalFormat;
import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "hoadon")
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ma")
    private Integer ma;
    @Column(name = "ngaytao")
    private Date ngayTao;
    @Column(name = "tongtien")
    private Float tongTienHoaDon;

    @Column(name = "age")
    private Integer age;

    @Column(name = "name")
    private String name;

    @Column(name = "name")
    private String name1;

    public String chuyenDoi() {
        DecimalFormat df = new DecimalFormat("#,###");
        return df.format(tongTienHoaDon);
    }
}
