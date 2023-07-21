<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thêm điện thoại</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body class="container">
<h1 style="text-align: center">Thông tin điện thoại</h1>
<form action="/asm/add" method="post">
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <label class="form-label">Tên điện thoại:</label>
            <input type="text" class="form-control" name="ten">
        </div>
        <div class="col-4"></div>
    </div>
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <label class="form-label">Số lượng:</label>
            <input type="text" class="form-control" name="soLuongTon">
        </div>
        <div class="col-4"></div>
    </div>
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <label class="form-label">Đơn giá:</label><br>
            <input type="text" class="form-control" name="giaTien">
        </div>
        <div class="col-4"></div>
    </div>
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <label class="form-label">Màu sắc:</label>
            <select class="form-select" aria-label="Default select example" name="mauSac">
                <option value="Đen">Đen</option>
                <option value="Trắng">Trắng</option>
                <option value="Vàng">Vàng</option>
                <option value="Đỏ">Đỏ</option>
                <option value="Tím">Tím</option>
                <option value="Xanh Lam">Xanh Lam</option>
            </select>
        </div>
        <div class="col-4"></div>
    </div>
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <label class="form-label">Năm sản xuất:</label>
            <input type="text" class="form-control" name="namSanXuat">
        </div>
        <div class="col-4"></div>
    </div>
    <br>
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <%--            <button type="submit" class="btn btn-success" onclick="return them()">Add</button>--%>
            <button type="submit" class="btn btn-success">Add</button>
            <a href="/asm/view" class="btn btn-success">Quay lại</a>
        </div>
        <div class="col-4"></div>
    </div>
</form>

<%--<script>--%>
<%--    function them() {--%>
<%--        return confirm("Bạn có chắc chắn muốn thêm không?")--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>