package ControllerDonhang;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ModelDonhang.Donhang;
import ModelDonhang.Donhangmodel;
import ModelKhachhang.KhachhangModel;
import ModelNhasanxuat.NhaSanXuat;

/**
 * Servlet implementation class DonHangController
 */
@WebServlet("/donHangController")
public class DonHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Donhangmodel mDonhangmodel;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DonHangController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init() throws ServletException {
		mDonhangmodel = new Donhangmodel();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			List<Donhang> donhanglList = mDonhangmodel.getAllDonhang();
			request.setAttribute("donhanglList", donhanglList);
			request.getRequestDispatcher("category/dashboard_donhang.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/error.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
