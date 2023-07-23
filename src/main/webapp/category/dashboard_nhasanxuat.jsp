<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<link rel="stylesheet"
	href="http://localhost:8080/quanlysmatphone/assets/css/admin.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
</head>
<body>
	<div class="containesr">
		<div class="navigation">
			<ul>
				<li><a href="#"> <span class="icon"><i
							class='bx bxl-android'></i></span> <span class="title">Brand Name</span>
				</a></li>
				<li><a
					href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard.php">
						<span class="icon"><i class='bx bx-home'></i></span> <span
						class="title">Dashboard</span>
				</a></li>
				<li><a
					href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard_nhasanxuat.php">
						<span class="icon"><i class='bx bxl-product-hunt'></i></span> <span
						class="title">Nhà sản xuất</span>
				</a></li>
				<li><a
					href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard_sanpham.php">
						<span class="icon"><i class='bx bxl-product-hunt'></i></span> <span
						class="title">Sản phẩm</span>
				</a></li>
				<li><a
					href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard_khachhang.php">
						<span class="icon"><i class='bx bxs-user-account'></i></span> <span
						class="title">Khách hàng</span>
				</a></li>
				<li><a
					href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard_nhanvien.php">
						<span class="icon"><i class='bx bx-food-menu'></i></span> <span
						class="title">Nhân viên</span>
				</a></li>
				<li><a
					href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard_donhang.php">
						<span class="icon"><i class='bx bx-captions'></i></span> <span
						class="title">Đơn hàng</span>
				</a></li>
				<li><a
					href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard_phanhoi.php">
						<span class="icon"><i class='bx bx-message'></i></span> <span
						class="title">Phản hồi</span>
				</a></li>
			</ul>
		</div>



		<div class="main">
			<div class="topbar">
				<div class="toggle">
					<i class='bx bx-menu'></i>
				</div>
				<div class="search">
					<label> <input type="text" placeholder="Search...">
						<i class='bx bx-search-alt-2'></i>
					</label>
				</div>
				<div class="letters">
					<a href="#"><i class='bx bx-envelope'></i><sup>9</sup></a> <a
						href="#"><i class='bx bx-bell'></i><sup class="total-count"
						data-count='0'></sup></a>
				</div>
				<div class="user" onclick="settingsMenuToggle()">
					<?php
                    if (isset($_SESSION['username'], $_SESSION['user_id'], $_SESSION['anh_1'])) {
                        $anh = $_SESSION['anh_1'];
                        ?>
					<img style="border-radius: 50px;"
						src="data:image/jpeg;base64,<?php echo base64_encode($anh); ?>"
						alt="">
					<?php }
                    ?>
				</div>

				<div class="settings-menu">
					<div id="dark-btn">
						<span></span>
					</div>
					<div class="settings-menu-inner">
						<div class="user-profile">
							<?php
                            if (isset($_SESSION['username'], $_SESSION['user_id'], $_SESSION['anh_1'])) {
                                $anh = $_SESSION['anh_1'];
                                $user_id = $_SESSION['user_id'];
                                ?>
							<img style="border-radius: 50px;"
								src="data:image/jpeg;base64,<?php echo base64_encode($anh); ?>"
								alt="">
							<p>
								<?php echo $user_id ?>
							</p>
							<?php
                                // echo '<input type="text" value="' . $_SESSION['user_id'] . '">';
                            }
                            ?>
						</div>
						<!-- <div class="settings-links">
                            <form action="http://localhost/DOANPHPMYSQL_2023/admin/account/logout.php" method="POST">
                                <div class="fas fa-sign-out-alt"></div>
                                <span><input type="submit" value="Logout"></span>
                            </form>
                        </div> -->
						<hr>
						<div class="settings-links">
							<a
								href="http://localhost/DOANPHPMYSQL_2023/admin/view/category/dashboard_thongtintaikhoan.php">Xem
								thông tin tài khoản<i class='bx bxs-chevron-right'></i>
							</a>
						</div>
						<hr>
						<div class="settings-links">
							<i class='bx bx-log-in icon'></i> <a
								href="http://localhost/DOANPHPMYSQL_2023/admin/account/logout.php">Logout<i
								class='bx bxs-chevron-right'></i></a>
						</div>
					</div>
				</div>

			</div>

			<div style="padding: 22px 32px;">
				<div class="text">
					<%@ page errorPage="view.jsp"%>

					<h1>Thông tin nhà sản xuất</h1>
					</br>
					<button class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#addModal">Thêm mới</button>



					<div class="panel-body">
						<table id="tbl-student"
							class="table table-responsive table-bordered" cellpadding="0"
							width="100%">
							<thead>
								<tr>
									<th>MaNhaSanXuat</th>
									<th>TenNhaSanXuat</th>
									<th>DiaChi</th>
									<th>SoDienThoai</th>
									<th>Email</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="nsx" items="${nhaSanXuatList}"
									varStatus="status">
									<tr>
										<td><c:out value="${status.index + 1}" /></td>
										<td><c:out value="${nsx.tenNhaSanXuat}" /></td>
										<td><c:out value="${nsx.diaChi}" /></td>
										<td><c:out value="${nsx.soDienThoai}" /></td>
										<td><c:out value="${nsx.email}" /></td>
										<td>
											<button class="edit-btn" data-bs-toggle="modal"
												data-bs-target="#editModal${nsx.maNhaSanXuat}"
												data-ma-nha-san-xuat="${nsx.maNhaSanXuat}"
												data-ten-nha-san-xuat="${nsx.tenNhaSanXuat}"
												data-dia-chi="${nsx.diaChi}"
												data-so-dien-thoai="${nsx.soDienThoai}"
												data-email="${nsx.email}">Cập nhật</button>
										</td>
										<td>
											<button class="delete-btn">
												<a style="text-decoration: none; color: #000;"
													href="deletenhasanxuatcontroller?MaNhaSanXuat=${nsx.maNhaSanXuat}"
													data-ma-nha-san-xuat="${nsx.maNhaSanXuat}">Xóa</a>
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- Add Product Modal -->
					<div class="modal fade" id="addModal" tabindex="-1"
						aria-labelledby="addModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="addModalLabel">Thêm nhà sản
										xuất</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form action="addnhasanxuatcontroller" method="POST">
										<div class="mb-3">
											<label for="ten_nhasx" class="form-label">Tên nhà sản
												xuất:</label> <input type="text" class="form-control" id="ten_nhasx"
												name="ten_nhasx">
										</div>
										<div class="mb-3">
											<label for="dia_chi" class="form-label">Địa chỉ:</label> <input
												type="text" class="form-control" id="dia_chi" name="dia_chi">
										</div>
										<div class="mb-3">
											<label for="so_dt" class="form-label">Số điện thoại:</label>
											<input type="text" class="form-control" id="so_dt"
												name="so_dt">
										</div>
										<div class="mb-3">
											<label for="Email" class="form-label">Email:</label>
											<textarea class="form-control" id="Email" name="Email"></textarea>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Đóng</button>
											<button type="submit" class="btn btn-primary">Thêm
												sản phẩm</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal -->
					<c:forEach var="nsx" items="${nhaSanXuatList}">
						<div class="modal fade" id="editModal${nsx.maNhaSanXuat}"
							tabindex="-1" aria-labelledby="editModalLabel${nsx.maNhaSanXuat}"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="editModalLabel${nsx.maNhaSanXuat}">
											Chỉnh sửa thông tin nhà sản xuất</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form action="editnhasanxuatcontroller" method="POST">
											<input type="hidden" name="MaNhaSanXuat"
												value="${nsx.maNhaSanXuat}">
											<div class="mb-3">
												<label for="ten_nhasx_${nsx.maNhaSanXuat}"
													class="form-label">Tên nhà sản xuất:</label> <input
													type="text" class="form-control"
													id="ten_nhasx_${nsx.maNhaSanXuat}"
													name="ten_nhasx_${nsx.maNhaSanXuat}"
													value="${nsx.tenNhaSanXuat}">
											</div>
											<div class="mb-3">
												<label for="dia_chi${nsx.maNhaSanXuat}" class="form-label">Địa
													chỉ:</label> <input type="text" class="form-control"
													id="dia_chi${nsx.maNhaSanXuat}"
													name="dia_chi${nsx.maNhaSanXuat}" value="${nsx.diaChi}">
											</div>
											<div class="mb-3">
												<label for="so_đt${nsx.maNhaSanXuat}" class="form-label">Số
													điện thoại:</label> <input type="text" class="form-control"
													id="so_đt${nsx.maNhaSanXuat}"
													name="so_dien_thoai${nsx.maNhaSanXuat}"
													value="${nsx.soDienThoai}">
											</div>
											<div class="mb-3">
												<label for="email${nsx.maNhaSanXuat}" class="form-label">Email:</label>
												<input type="text" class="form-control"
													id="email${nsx.maNhaSanXuat}"
													name="email${nsx.maNhaSanXuat}" value="${nsx.email}">
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Đóng</button>
												<button type="submit" class="btn btn-primary">Lưu</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<script src="http://localhost:8080/quanlysmatphone/assets/js/admin.js"></script>
	<!-- <script language="Javascript" src="js/giohang.js"></script> -->
	<script>
    /// toggle///
    let toggle = document.querySelector('.toggle');
    let navigation = document.querySelector('.navigation');
    let main = document.querySelector('.main');

    toggle.onclick = function () {
        navigation.classList.toggle('active')
        main.classList.toggle('active')
    }



    /////
    let list = document.querySelectorAll('.navigation li');

    function activeLink() {
        list.forEach((item) =>
            item.classList.remove('hovered'));
        this.classList.add('hovered');
    }
    list.forEach((item) =>
        item.addEventListener('mouseover', activeLink));
</script>

</body>
</html>