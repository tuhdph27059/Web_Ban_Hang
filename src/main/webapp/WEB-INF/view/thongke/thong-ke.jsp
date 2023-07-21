<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thống kê</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body class="container">
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="/asm/view/san-pham">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/asm/hoa-don/view">Hóa đơn</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/asm/thong-ke/view">Thống kê</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/asm/gio-hang/view">Giỏ hàng</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<br>
<h1 style="text-align: center">THỐNG KÊ</h1>
<a href="/asm/view/san-pham" class="btn btn-success">Quay lại</a>
<br>
<%--Thống kê top 10--%>
<div class="row">
    <div class="col-6">
        <h5 style="text-align: center">Top 10 mặt hàng bán chạy nhất</h5>
        <table class="table table-hover table-bordered">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Mã sản phẩm</th>
                <th scope="col">Tên sản phẩm</th>
                <th scope="col">Số lượng</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${litsTop10SPBanChayNhat}" var="a" varStatus="stt">
                <tr>
                    <td>${stt.index+1}</td>
                    <td>${a.maSP}</td>
                    <td>
                        <c:forEach items="${listDienThoai}" var="b">
                            <c:if test="${b.ma==a.maSP}">
                                ${b.ten}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>${a.soLuong}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-6">
        <h5 style="text-align: center">Top 10 mặt hàng tồn lâu nhất</h5>
        <table class="table table-hover table-bordered">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Mã sản phẩm</th>
                <th scope="col">Tên sản phẩm</th>
                <th scope="col">Số lượng</th>
                <th scope="col">Số ngày</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${top10SPTonKhoLauNhatList}" var="a" varStatus="stt">
                <tr>
                    <td>${stt.index+1}</td>
                    <td>${a.maSP}</td>
                    <td>
                        <c:forEach items="${listDienThoai}" var="b">
                            <c:if test="${b.ma==a.maSP}">
                                ${b.ten}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>${a.soLuong}</td>
                    <td>${a.soNgay}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>
<hr>
<%----%>
<form action="/asm/thong-ke/date" method="get">
    <div class="row">
        <div class="col-3">
        </div>
        <div class="col-2">
            <input type="text" class="form-control" name="thang" value="${param.thang}" placeholder="Nhập tháng">
        </div>
        <div class="col-2">
            <input type="text" class="form-control" name="nam" value="${param.nam}" placeholder="Nhập năm">
        </div>
        <div class="col-2">
            <button type="submit" class="btn btn-success">Tìm kiếm</button>
        </div>
        <div class="col-3">
        </div>
    </div>
</form>
<br>

<div class="row">
    <div class="col-6">
        <h5 style="text-align: center">Thống kê sản phẩm mỗi ngày trong 1 tháng</h5>
        <table class="table table-hover table-bordered">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Ngày</th>
                <th scope="col">Số lượng sp</th>
                <th scope="col">Tổng tiền</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${thongKeTheoNgayList}" var="a" varStatus="stt">
                <tr>
                    <td>${stt.index+1}</td>
                    <td>${a.ngay}</td>
                    <td>${a.soLuong}</td>
                    <td>${a.tongTien} USD</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-6">
        <h5 style="text-align: center">Thống kê sản phẩm trong 1 tháng</h5>
        <table class="table table-hover table-bordered">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Tháng</th>
                <th scope="col">Số lượng sp</th>
                <th scope="col">Tổng tiền</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${thongKeTheoThangList}" var="a" varStatus="stt">
                <tr>
                    <td>${stt.index+1}</td>
                    <td>${a.thang}</td>
                    <td>${a.soLuong}</td>
                    <td>${a.tongTien} USD</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%----%>
<%--<div class="col-4"><h5 style="text-align: center">Thống kê theo tuần</h5>--%>
<%--    <table class="table table-hover table-bordered">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th scope="col">STT</th>--%>
<%--            <th scope="col">Tuần</th>--%>
<%--            <th scope="col">Số lượng sp</th>--%>
<%--            <th scope="col">Tổng tiền</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <c:forEach items="${thongKeTheoTuanList}" var="a" varStatus="stt">--%>
<%--            <tr>--%>
<%--                <td>${stt.index+1}</td>--%>
<%--                <td>${a.tuan}</td>--%>
<%--                <td>${a.soLuong}</td>--%>
<%--                <td>${a.tongTien} USD</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--</div>--%>
</body>
</html>