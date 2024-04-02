package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/addtask")
public class AddTask  extends HttpServlet{
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int taskid = Integer.parseInt(req.getParameter("taskid"));
		String tasktitle = req.getParameter("tasktitle");
		String taskdescription = req.getParameter("taskdescription");
		String taskpriority = req.getParameter("taskpriority");
		String tsakduedate = req.getParameter("tsakduedate");
		
		User user = (User) req.getSession().getAttribute("user");
		int userid = user.getUserid();
		

		
		Task task = new Task(taskid, tasktitle, taskdescription, taskpriority, tsakduedate, "pending", userid);
		
		Dao dao = new Dao();
		
		try {
			
			int res = dao.createTask(task);
			
			if(res > 0) {
				
				resp.getWriter().println("Task created successfully");
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
