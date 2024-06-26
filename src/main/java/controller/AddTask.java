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

@WebServlet("/addtask")
public class AddTask  extends HttpServlet{
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String tasktitle = req.getParameter("tasktitle");
		String taskdescription = req.getParameter("taskdescription");
		String taskpriority = req.getParameter("taskpriority");
		String taskduedate = req.getParameter("taskduedate");
		
		HttpSession ses = req.getSession();
		User user = (User) ses.getAttribute("user");
		int userid = user.getUserid();
		

		
		Task task = new Task(0,tasktitle, taskdescription, taskpriority, taskduedate,"Not initiated",userid);
		
		Dao dao = new Dao();
		
		try {
			
			int res = dao.createTask(task);
			
			if(res > 0) {
				
				List<Task> tasks = dao.getallTaskByuserid(userid);
				ses.setAttribute("tasks", tasks);
				List<Integer> tasksDid = dao.getDelid();
				ses.setAttribute("tasksDid", tasksDid);
				resp.sendRedirect("home.jsp");
			}
			else {
				
				resp.getWriter().println("Task created successfully");
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
		
		
	}

}
