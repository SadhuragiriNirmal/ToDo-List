package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/back")
public class Back extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	   Dao dao = new Dao();
	   try {
	
		    HttpSession ses = req.getSession();
			User user = (User) ses.getAttribute("user");
			List<Task> tasks = dao.getallTaskByuserid(user.getUserid());
			List<Integer> tasksDid = dao.getDelid();
			ses.setAttribute("tasksDid", tasksDid);
			ses.setAttribute("tasks", tasks);
		    resp.sendRedirect("home.jsp");
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
