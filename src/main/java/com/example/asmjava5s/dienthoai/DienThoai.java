package com.example.asmjava5s.dienthoai;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "sanpham")
public class DienThoai {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ma")
    private Integer ma;
    @Column(name = "ten")
    private String ten;
    @Column(name = "soluongton")
    private Integer soLuongTon;
    @Column(name = "giatien")
    private Float giaTien;
    @Column(name = "mausac")
    private String mauSac;
    @Column(name = "namsanxuat")
    private Integer namSanXuat;
    @Column(name = "chuthich")
    private String chuThich;
}
