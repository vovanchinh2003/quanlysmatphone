<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
				<li><a href=""> <span class="icon"><i
							class='bx bx-home'></i></span> <span class="title">Dashboard</span>
				</a></li>
				<li><a
					href="http://localhost:8080/quanlysmatphone/NhaSanXuatController">
						<span class="icon"><i class='bx bxl-product-hunt'></i></span> <span
						class="title">Nhà sản xuất</span>
				</a></li>
				<li><a href=""> <span class="icon"><i
							class='bx bxl-product-hunt'></i></span> <span class="title">Sản
							phẩm</span>
				</a></li>
				<li><a href=""> <span class="icon"><i
							class='bx bxs-user-account'></i></span> <span class="title">Khách
							hàng</span>
				</a></li>
				<li><a href=""> <span class="icon"><i
							class='bx bx-food-menu'></i></span> <span class="title">Nhân viên</span>
				</a></li>
				<li><a href=""> <span class="icon"><i
							class='bx bx-captions'></i></span> <span class="title">Đơn hàng</span>
				</a></li>
				<li><a
					href="http://localhost:8080/quanlysmatphone/category/h.jsp"> <span
						class="icon"><i class='bx bx-message'></i></span> <span
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
					<%@ page errorPage="dashboard_sanpham.jsp"%>

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
									<th>ID</th>
									<th>TenSanPham</th>
									<th>GiaBan</th>
									<th>MoTaSanPham</th>
									<th>AnhSanPham</th>
									<th>MaNhaSanXuat</th>
									<th>Update</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="sp" items="${sanphamlList}" varStatus="status">
									<tr>
										<td><c:out value="${status.index + 1}" /></td>
										<td><c:out value="${sp.tenSanPham}" /></td>
										<td><c:out value="${sp.giaBan}" /></td>
										<td><c:out value="${sp.moTaSanPham}" /></td>
										<td><img style="width: 100px; height: 100px;"
											src="data:image/jpeg;base64,${sp.anhSanPhamBase64}"
											alt="${sp.tenSanPham}"></td>
										<td><c:out value="${sp.maNhaSanXuat}" /></td>
										<td>
											<button class="edit-btn" data-bs-toggle="modal"
												data-bs-target="#editModal${sp.maSanPham}"
												data-ma-san-pham="${sp.maSanPham}"
												data-ten-san-pham="${sp.tenSanPham}"
												data-gia-ban="${sp.giaBan}"
												data-so-luong-trong-kho="${sp.soLuongTrongKho}"
												data-mo-ta-san-pham="${sp.moTaSanPham}"
												data-anh-san-pham-base64="${sp.anhSanPhamBase64}"
												data-kich-thuoc="${sp.kichThuoc}"
												data-trong-luong-san-pham="${sp.trongLuongSanPham}"
												data-dien-tich-man-hinh="${sp.dienTichManHinh}"
												data-ram="${sp.ram}"
												data-dung-luong-pin="${sp.dungLuongPin}"
												data-thoi-gian-bao-hanh="${sp.thoiGianBaoHanh}"
												data-ma-nha-san-xuat="${sp.maNhaSanXuat}"
												data-ma-nha-san-xuat="${sp.maNhaSanXuat}">Cập nhật</button>
										</td>
										<td>
											<button class="delete-btn">
												<a style="text-decoration: none; color: #000;" href="">Xóa</a>
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
						<div class="modal-dialog modal-xl">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="addModalLabel">Thêm sản phẩm
										mới</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form
										action="http://localhost/DOANPHPMYSQL_2023/admincore/xulyadd_sanpham.jsp"
										method="POST" enctype="multipart/form-data">
										<div class="row">
											<div class="col-md-6">
												<div class="mb-3">
													<label for="ten_sanpham" class="form-label">Tên sản
														phẩm:</label> <input type="text" class="form-control"
														id="ten_sanpham" name="ten_sanpham">
												</div>
												<div class="mb-3">
													<label for="gia" class="form-label">Đơn giá:</label> <input
														type="number" class="form-control" id="gia" name="gia">
												</div>
												<div class="mb-3">
													<label for="so_luong" class="form-label">Số lượng
														trong kho:</label> <input type="number" class="form-control"
														id="so_luong" name="so_luong">
												</div>
												<div class="mb-3">
													<label for="mo_ta" class="form-label">Mô tả:</label>
													<textarea class="form-control" id="mo_ta" name="mo_ta"></textarea>
												</div>
												<div class="mb-3">
													<label for="anh_sanpham" class="form-label">Ảnh sản
														phẩm:</label> <input type="file" class="form-control"
														id="anh_sanpham" name="anh_sanpham">
												</div>
												<div class="mb-3">
													<label for="kich_thuoc" class="form-label">Kích
														thước:</label> <input type="text" class="form-control"
														id="kich_thuoc" name="kich_thuoc">
												</div>
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label for="trong_luong_san_pham" class="form-label">Trọng
														lượng sản phẩm:</label> <input type="text" class="form-control"
														id="trong_luong_san_pham" name="trong_luong_san_pham">
												</div>
												<div class="mb-3">
													<label for="dien_tich_man_hinh" class="form-label">Diện
														tích màn hình:</label> <input type="text" class="form-control"
														id="dien_tich_man_hinh" name="dien_tich_man_hinh">
												</div>
												<div class="mb-3">
													<label for="ram" class="form-label">RAM:</label> <input
														type="text" class="form-control" id="ram" name="ram">
												</div>
												<div class="mb-3">
													<label for="dung_luong_pin" class="form-label">Dung
														lượng pin:</label> <input type="text" class="form-control"
														id="dung_luong_pin" name="dung_luong_pin">
												</div>
												<div class="mb-3">
													<label for="thoi_gian_bao_hanh" class="form-label">Thời
														gian bảo hành:</label> <input type="text" class="form-control"
														id="thoi_gian_bao_hanh" name="thoi_gian_bao_hanh">
												</div>
												<div class="mb-3">
													<label for="ma_nha_sx_" class="form-label">Mã nhà
														sản xuất:</label> <select class="form-select" id="ma_nha_sx_"
														name="ma_nha_sx_">
														<option selected disabled>Chọn nhà sản xuất</option>
														<%
														try {
															Class.forName("com.mysql.jdbc.Driver");
															Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ql_ban_smatphon", "root", "chinh2003");
															Statement stmt = conn.createStatement();
															String querya = "SELECT * FROM NhaSanXuat";
															ResultSet rs = stmt.executeQuery(querya);
															while (rs.next()) {
																String maNhaSanXuat = rs.getString("MaNhaSanXuat");
														%>
														<option value="<%=maNhaSanXuat%>"><%=maNhaSanXuat%></option>
														<%
														}
														rs.close();
														stmt.close();
														conn.close();
														} catch (Exception e) {
														e.printStackTrace();
														}
														%>
													</select>
												</div>
												<!-- Other input fields here -->
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Đóng</button>
											<input type="submit" class="btn btn-primary" name="submit"
												value="Thêm">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- edit Modal -->
					<c:forEach var="sp" items="${sanphamlList}">
						<div class="modal fade" id="editModal${sp.maSanPham}"
							tabindex="-1" aria-labelledby="editModalLabel${sp.maSanPham}"
							aria-hidden="true">
							<div class="modal-dialog modal-xl">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="editModalLabel${sp.maSanPham}">
											Chỉnh sửa thông tin sản phẩm</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form action="" method="POST" enctype="multipart/form-data">
											<input type="hidden" name="maSanPham" value="${sp.maSanPham}">
											<div class="row">
												<div class="col-6">
													<div class="mb-3">
														<label for="ten_sanpham_${sp.maSanPham}"
															class="form-label">Tên sản phẩm:</label> <input
															type="text" class="form-control"
															id="ten_sanpham_${sp.maSanPham}" name="ten_sanpham"
															value="${sp.tenSanPham}">
													</div>
													<div class="mb-3">
														<label for="gia_ban_${sp.maSanPham}" class="form-label">Giá
															bán:</label> <input type="number" class="form-control"
															id="gia_ban_${sp.maSanPham}" name="gia_ban"
															value="${sp.giaBan}">
													</div>
													<div class="mb-3">
														<label for="so_luong_trong_kho_${sp.maSanPham}"
															class="form-label">Số lượng trong kho:</label> <input
															type="number" class="form-control"
															id="so_luong_trong_kho_${sp.maSanPham}"
															name="so_luong_trong_kho" value="${sp.soLuongTrongKho}">
													</div>
													<div class="mb-3">
														<label for="mo_ta_san_pham_${sp.maSanPham}"
															class="form-label">Mô tả sản phẩm:</label>
														<textarea class="form-control"
															id="mo_ta_san_pham_${sp.maSanPham}" name="mo_ta_san_pham">${sp.moTaSanPham}</textarea>
													</div>
													<div class="mb-3">
														<label for="anh_sanpham_${sp.maSanPham}"
															class="form-label">Ảnh sản phẩm:</label> <input
															type="file" class="form-control"
															id="anh_sanpham_${sp.maSanPham}" name="anh_sanpham">
													</div>

												</div>
												<div class="col-6">
													<div class="mb-3">
														<label for="kich_thuoc_${sp.maSanPham}" class="form-label">Kích
															thước:</label> <input type="text" class="form-control"
															id="kich_thuoc_${sp.maSanPham}" name="kich_thuoc"
															value="${sp.kichthuoc}">
													</div>
													<div class="mb-3">
														<label for="dien_tich_man_hinh_${sp.maSanPham}"
															class="form-label">Diện tích màn hình:</label> <input
															type="text" class="form-control"
															id="dien_tich_man_hinh_${sp.maSanPham}"
															name="dien_tich_man_hinh" value="${sp.dientichmanhinh}">
													</div>
													<div class="mb-3">
														<label for="ram_${sp.maSanPham}" class="form-label">RAM:</label>
														<input type="text" class="form-control"
															id="ram_${sp.maSanPham}" name="ram" value="${sp.ram}">
													</div>
													<div class="mb-3">
														<label for="dung_luong_pin_${sp.maSanPham}"
															class="form-label">Dung lượng pin:</label> <input
															type="text" class="form-control"
															id="dung_luong_pin_${sp.maSanPham}" name="dung_luong_pin"
															value="${sp.dungluongpin}">
													</div>
													<div class="mb-3">
														<label for="thoi_gian_bao_hanh_${sp.maSanPham}"
															class="form-label">Thời gian bảo hành:</label> <input
															type="text" class="form-control"
															id="thoi_gian_bao_hanh_${sp.maSanPham}"
															name="thoi_gian_bao_hanh" value="${sp.thoigianbaohang}">
													</div>
												</div>
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