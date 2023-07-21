<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body class="container">
<h1 style="text-align: center">Update điện thoại</h1>
<form action="/asm/update" method="post">
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <label class="form-label">Mã điện thoại:</label>
            <input type="text" class="form-control" name="ma" value="${dienThoai.ma}" readonly>
        </div>
        <div class="col-4"></div>
    </div>
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <label class="form-label">Tên điện thoại:</label>
            <input type="text" class="form-control" name="ten" value="${dienThoai.ten}">
        </div>
        <div class="col-4"></div>
    </div>
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <label class="form-label">Số lượng:</label>
            <input type="text" class="form-control" name="soLuongTon" value="${dienThoai.soLuongTon}">
        </div>
        <div class="col-4"></div>
    </div>
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <label class="form-label">Đơn giá:</label><br>
            <input type="text" class="form-control" name="giaTien" value="${dienThoai.giaTien}">
        </div>
        <div class="col-4"></div>
    </div>
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <label class="form-label">Màu sắc:</label>
            <select class="form-select" aria-label="Default select example" name="mauSac">
                <option value="Đen" ${dienThoai.mauSac=="Đen"?"selected":""}>Đen</option>
                <option value="Trắng" ${dienThoai.mauSac=="Trắng"?"selected":""}>Trắng</option>
                <option value="Vàng" ${dienThoai.mauSac=="Vàng"?"selected":""}>Vàng</option>
                <option value="Đỏ" ${dienThoai.mauSac=="Đỏ"?"selected":""}>Đỏ</option>
                <option value="Tím" ${dienThoai.mauSac=="Tím"?"selected":""}>Tím</option>
                <option value="Xanh Lam" ${dienThoai.mauSac=="Xanh Lam"?"selected":""}>Xanh Lam</option>
            </select>
        </div>
        <div class="col-4"></div>
    </div>
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <label class="form-label">Năm sản xuất:</label>
            <input type="text" class="form-control" name="namSanXuat" value="${dienThoai.namSanXuat}">
        </div>
        <div class="col-4"></div>
    </div>
    <br>
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <%--            <button type="submit" class="btn btn-success" onclick="return sua()">Update</button>--%>
            <button type="submit" class="btn btn-success">Update</button>
            <a href="/asm/view" class="btn btn-success">Quay lại</a>
        </div>
        <div class="col-4"></div>
    </div>
</form>
<%--<script>--%>
<%--    function sua() {--%>
<%--        return confirm("Bạn có chắc chắn muốn sửa không?")--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>