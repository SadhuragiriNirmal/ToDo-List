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

@WebServlet("/bin")
public class Bin extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String taskid = req.getParameter("tid");
		
		Dao dao = new Dao();
		
		try {
			if(taskid != null) {
				
			
			int res = dao.delidInsert(Integer.parseInt(taskid));
			if(res > 0) {
				
				HttpSession ses = req.getSession();
			    User u = (User) ses.getAttribute("user");
			  	List<Task> tasks = dao.getallTaskByuserid(u.getUserid());
				ses.setAttribute("tasks", tasks);
				List<Integer> tasksDid = dao.getDelid();
				ses.setAttribute("tasksDid", tasksDid);
				resp.sendRedirect("home.jsp");
			}
			
		  }
		  else {
			  
			    User u = (User) req.getSession().getAttribute("user");
			  	List<Task> tasks = dao.getallTaskByuserid(u.getUserid());
				req.setAttribute("tasks", tasks);
				List<Integer> tasksDid = dao.getDelid();
				req.setAttribute("tasksDid", tasksDid);
				req.getRequestDispatcher("bin.jsp").include(req, resp);
		  }
			
		} catch (ClassNotFoundException | SQLException e) {
		
			e.printStackTrace();
		}
	}

}
