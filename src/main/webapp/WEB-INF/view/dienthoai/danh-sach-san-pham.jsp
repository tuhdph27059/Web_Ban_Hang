<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
            integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
            crossorigin="anonymous"></script>
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
<h1 style="text-align: center">Danh sách sản phẩm</h1>
<table class="table table-hover table-bordered">
    <thead>
    <tr>
        <th scope="col">Mã</th>
        <th scope="col">Tên</th>
        <th scope="col">Số lượng tồn</th>
        <th scope="col">Giá tiền</th>
        <th scope="col">Màu sắc</th>
        <th scope="col">Năm sản xuất</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageDienThoai.getContent()}" var="a">
        <tr>
            <td>${a.ma}</td>
            <td>${a.ten}</td>
            <td>${a.soLuongTon}</td>
            <td>${a.giaTien} USD</td>
            <td>${a.mauSac}</td>
            <td>${a.namSanXuat}</td>
            <td>
                <a href="/asm/gio-hang/add?maSanPham=${a.ma}" class="btn btn-danger">Thêm vào
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-cart4" viewBox="0 0 16 16">
                        <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
                    </svg>
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<c:if test="${chek==0}">
    <div>
        <c:if test="${pageDienThoai.getNumber() + 1 > 1}">
            <a href="?page=${pageDienThoai.getNumber()}">
                Previous
            </a>
        </c:if>
        <span> ${pageDienThoai.getNumber() + 1} / ${pageDienThoai.getTotalPages()} </span>
        <c:if test="${pageDienThoai.getNumber() + 1 lt pageDienThoai.getTotalPages()}">
            <a href="?page=${pageDienThoai.getNumber() + 2}">
                Next
            </a>
        </c:if>
    </div>
</c:if>
</body>
</html>