package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.User;

@WebServlet("/userlogin")
public class Login extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String email = req.getParameter("useremail");
		String password = req.getParameter("userpass");
		
		Dao dao = new Dao();
		
		try {
			User u = dao.findByEmail(email);

			if(u != null) {
				
				if(u.getUserpassword().equals(password)) {
					
					//session object created
					req.getSession().setAttribute("user",u);
					req.getRequestDispatcher("home.jsp").include(req, resp);
				}
				else {
					
					req.setAttribute("message","Wrong Password");
					req.getRequestDispatcher("login.jsp").include(req, resp);
				}
			}
			else {
				
				req.setAttribute("message", "Wrong Email");
				req.getRequestDispatcher("login.jsp").include(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
	}

}
