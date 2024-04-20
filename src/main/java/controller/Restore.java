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
@WebServlet("/restore")
public class Restore extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int taskid = Integer.parseInt(req.getParameter("tid"));
		
		Dao dao = new Dao();
		
		try {
			int res = dao.delbinId(taskid);
			if(res > 0) {
				
                User u = (User) req.getSession().getAttribute("user");
				List<Task> tasks = dao.getallTaskByuserid(u.getUserid());
				req.setAttribute("tasks", tasks);
				List<Integer> tasksDid = dao.getDelid();
				req.setAttribute("tasksDid", tasksDid);
				req.getRequestDispatcher("home.jsp").include(req, resp);
				
				
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
	}

}
