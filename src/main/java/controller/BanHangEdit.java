package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BanHangDAO;
import model.BanHang;

/**
 * Servlet implementation class BanHangEdit
 */
@WebServlet(urlPatterns = "/admin/pages/banhang/edit")
public class BanHangEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BanHangEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		if (session.getAttribute("admin") == null && session.getAttribute("nhanvien") ==null) {
			response.sendRedirect("../../../login");
		} else {
		
		request.setAttribute("BanHang", BanHangDAO.getAHoaDon(Integer.valueOf(request.getParameter("id"))));
		RequestDispatcher dispatcher= request.getRequestDispatcher("edit.jsp");
		dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		BanHang bh = new BanHang();
		bh.setTenNguoiMua(request.getParameter("ten"));
		bh.setSdtNguoiMua(request.getParameter("sodienthoai"));
		bh.setDiaChi(request.getParameter("diachi"));
		bh.setGhiChu(request.getParameter("ghichu"));
		bh.setIdBH(Integer.valueOf(request.getParameter("id")));
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date parsed1 = null;
		
		java.util.Date date = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime()); 
		
			try {
				if (request.getParameter("ngayban") == "") {
					parsed1 = new java.util.Date();
				}
				parsed1 = format.parse(request.getParameter("ngayban"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		java.sql.Date sqlDate1 = new java.sql.Date(parsed1.getTime());
		bh.setNgayBan(sqlDate1);
		bh.setNgayTao(sqlDate);
		bh.setNgaySua(sqlDate);
		System.out.println(bh.toString());
		HttpSession session = request.getSession();
		if(BanHangDAO.updateBH(bh)) {
			
			session.setAttribute("Edit", "Success");
			response.sendRedirect("list");
		}else {
			
			session.setAttribute("Edit", "Faill");
			response.sendRedirect("list");
		}
	}

}
