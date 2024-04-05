package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/delete")
public class Delete extends HttpServlet{

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int tid = Integer.parseInt(req.getParameter("tid"));
		
		Dao dao = new Dao();
		try {
			
			int res = dao.deleteBytaskid(tid);
			if(res > 0) {
				
				User user = (User) req.getSession().getAttribute("user");
				List<Task> tasks = dao.getallTaskByuserid(user.getUserid());
				req.setAttribute("tasks", tasks);
				req.getRequestDispatcher("home.jsp").include(req, resp);
			}
			else {
				
				resp.getWriter().println("delete operation could't done");
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
}
