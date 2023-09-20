package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;

@WebServlet(name = "userdelete", urlPatterns = "/admin/pages/user/delete")
public class UserDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserDelete() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		if (session.getAttribute("admin") == null) {
			response.sendRedirect("../../../login");
		} else {
			int id = Integer.parseInt(request.getParameter("id"));
			if (UserDAO.deleteUser(id)) {

				session.setAttribute("Delete", "Success");
				session.setMaxInactiveInterval(15);
				response.sendRedirect("list");
			} else {

			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
