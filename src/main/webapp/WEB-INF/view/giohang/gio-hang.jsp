<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Giỏ hàng</title>
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
<h1 style="text-align: center">Giỏ hàng</h1>
<a href="/asm/view/san-pham" class="btn btn-success">Quay lại</a>
<div class="row">
    <div class="col-10">
        <p>Tổng tiền: ${tongTienTatCaSanPhamTrongGio} USD</p>
    </div>
    <div class="col-1">
        <c:if test="${not sanPhamTrongGio.isEmpty()}">
            <form action="/asm/hoa-don/add" method="post">
                <button type="submit" class="btn btn-success">Mua</button>
            </form>
        </c:if>
    </div>
    <div class="col-1">
        <a href="/asm/gio-hang/xoa-tat-ca" class="btn btn-success">Xóa All</a>
    </div>
</div>
<table class="table table-hover table-bordered">
    <thead>
    <tr>
        <th scope="col">Mã</th>
        <th scope="col">Tên</th>
        <th scope="col">Số lượng</th>
        <th scope="col">Giá tiền</th>
        <th scope="col">Tổng tiền</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${sanPhamTrongGio}" var="a">
        <tr>
            <td>${a.maSanPham}</td>
            <td>${a.tenSanPham}</td>
            <td>
                <form action="/asm/gio-hang/adds" method="get">
                    <div class="input-group mb-3">
                        <input style="width: 100px;text-align: center" value="${a.soLuong}" type="text"
                               class="form-control" name="soLuongSanPham" aria-label="Recipient's username"
                               aria-describedby="button-addon2">
                        <button class="btn btn-outline-secondary" type="submit" id="button-addon2" name="maSanPham"
                                value="${a.maSanPham}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                            </svg>
                        </button>
                    </div>
                </form>
            </td>
            <td>${a.giaTien} USD</td>
            <td>${a.getTongTien()} USD</td>
            <td>
                <a href="/asm/gio-hang/delete?maSanPham=${a.maSanPham}" class="btn btn-danger">Xóa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script>
    function xoa() {
        return confirm("Bạn có chắc chắn muốn xóa sản phảm này khỏi giỏ hàng không?")
    }
</script>
</body>
</html>