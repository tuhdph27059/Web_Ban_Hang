<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hóa đơn</title>
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
<h1 style="text-align: center">HÓA ĐƠN</h1>
<a href="/asm/view/san-pham" class="btn btn-success">Quay lại</a>
<p>Tổng số : ${pageHoaDon.getTotalElements()}</p>
<table class="table table-hover table-bordered">
    <thead>
    <tr>
        <th scope="col">Mã hóa đơn</th>
        <th scope="col">Ngày tạo</th>
        <th scope="col">Tổng tiền</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageHoaDon.getContent()}" var="a">
        <tr>
            <td>${a.ma}</td>
            <td>${a.ngayTao}</td>
            <td>${a.chuyenDoi()} USD</td>
            <td>
                <a href="/hoa-don-chi-tiet/view?maHoaDon=${a.ma}" class="btn btn-success">Chi tiết</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div>
    <c:if test="${pageHoaDon.getNumber() + 1 > 1}">
        <a href="?page=${pageHoaDon.getNumber()}">
            Previous
        </a>
    </c:if>
    <span> ${pageHoaDon.getNumber() + 1} / ${pageHoaDon.getTotalPages()} </span>
    <c:if test="${pageHoaDon.getNumber() + 1 lt pageHoaDon.getTotalPages()}">
        <a href="?page=${pageHoaDon.getNumber() + 2}">
            Next
        </a>
    </c:if>
</div>
</body>
</html>