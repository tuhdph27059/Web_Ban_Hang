package com.example.asmjava5s.hoadon;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "hoadonchitiet")
public class HoaDonChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id")
    private String id;
    @Column(name = "mahd")
    private Integer maHD;
    @Column(name = "masp")
    private Integer maSP;
    @Column(name = "soluong")
    private Integer soLuongMua;
    @Column(name = "giatien")
    private Float giaTienSP;
}
