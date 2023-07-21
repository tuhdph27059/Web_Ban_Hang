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
                    <a class="nav-link active" href="/asm/view">Trang chủ</a>
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
<h1 style="text-align: center">Danh sách điện thoại</h1>
<%--<a href="/asm/view-add" class="btn btn-success">Add New</a>--%>
<!-- Button trigger modal -->
<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Add New
</button>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/asm/add" method="post">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm sản phẩm</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <label class="form-label">Tên điện thoại:</label>
                        <input type="text" class="form-control" name="ten">
                    </div>
                    <div class="row">
                        <label class="form-label">Số lượng:</label>
                        <input type="text" class="form-control" name="soLuongTon">
                    </div>
                    <div class="row">
                        <label class="form-label">Đơn giá:</label><br>
                        <input type="text" class="form-control" name="giaTien">
                    </div>
                    <div class="row">
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
                    <div class="row">
                        <label class="form-label">Năm sản xuất:</label>
                        <input type="text" class="form-control" name="namSanXuat">
                    </div>
                    <%--                    <br>--%>
                    <%--                    <div class="row">--%>
                    <%--                        <button type="submit" class="btn btn-success">Add</button>--%>
                    <%--                    </div>--%>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Save</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
<p>Tổng số : ${pageDienThoai.getTotalElements()}</p>
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
                <a href="/asm/view-update?maUpdate=${a.ma}" class="btn btn-success">Update</a>
                <a href="/asm/delete?maDelete=${a.ma}" class="btn btn-danger" onclick="return xoa()">Delete</a>
                <a href="/asm/gio-hang/add?maSanPham=${a.ma}" class="btn btn-danger">Thêm vào
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-cart4" viewBox="0 0 16 16">
                        <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
                    </svg>
                </a>
                    <%--                <a href="/gio-hang/add/${a.ma}" class="btn btn-danger">Thêm vào giỏ hàng</a>--%>
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
<script>
    function xoa() {
        return confirm("Bạn có chắc chắn muốn xóa không?")
    }
</script>
</body>
</html>