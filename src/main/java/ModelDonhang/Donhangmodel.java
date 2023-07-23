package ModelDonhang;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ModelNhasanxuat.NhaSanXuat;

public class Donhangmodel {
	private Connection con;

	public Donhangmodel() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/ql_ban_smatphon", "root", "chinh2003");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Donhang> getAllDonhang() throws SQLException {
		List<Donhang> donhanglList = new ArrayList<>();
		PreparedStatement pst = con.prepareStatement(
				"SELECT hoadon.MaHoaDon, khachhang.TenKhachHang, khachhang.SoDienThoai, hoadon.TongGiaTri, hoadon.NgayBan, hoadon.trangthai\r\n"
						+ "    FROM hoadon\r\n"
						+ "    LEFT JOIN khachhang ON hoadon.MaKhachHang = khachhang.MaKhachHang\r\n"
						+ "    WHERE hoadon.trangthai NOT IN ('Đã huỷ', 'Đã giao hàng')\r\n"
						+ "    ORDER BY MaHoaDon DESC");
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			Donhang donhang = new Donhang();
			donhang.setMaHoaDon(rs.getInt("MaHoaDon"));
			donhang.setNgayBan(rs.getDate("NgayBan"));
			donhang.setTenKhachHang(rs.getString("TenKhachHang"));
			donhang.setTongGiaTri(rs.getFloat("TongGiaTri"));
			donhang.setTrangThai(rs.getString("TrangThai"));
			donhang.setSoDienThoai(rs.getString("SoDienThoai"));
			donhanglList.add(donhang);
		}
		rs.close();
		pst.close();
		return donhanglList;
	}

}
