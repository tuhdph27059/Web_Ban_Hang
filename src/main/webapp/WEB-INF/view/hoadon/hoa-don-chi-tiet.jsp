<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hóa đơn chi tiết</title>
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
<h1 style="text-align: center">Hóa đơn chi tiết</h1>
<a href="/asm/hoa-don/view" class="btn btn-success">Quay lại</a>
<table class="table table-hover table-bordered">
    <thead>
    <tr>
        <th scope="col">Mã sản phẩm</th>
        <th scope="col">Tên sản phẩm</th>
        <th scope="col">Số lượng</th>
        <th scope="col">Giá tiền</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listHoaDonChiTiet}" var="a">
        <tr>
            <td>${a.maSP}</td>
            <td>
                <c:forEach items="${listDienThoai}" var="b">
                    <c:if test="${b.ma==a.maSP}">
                        ${b.ten}
                    </c:if>
                </c:forEach>
            </td>
            <td>${a.soLuongMua}</td>
            <td>${a.giaTienSP} USD</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>