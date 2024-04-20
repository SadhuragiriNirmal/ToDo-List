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

@WebServlet("/update")
public class Update extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int taskid = Integer.parseInt(req.getParameter("tid")); 
	     
        String tasktitle = req.getParameter("tasktitle");
		String taskdescription = req.getParameter("taskdescription");
		String taskpriority = req.getParameter("taskpriority");
		String taskduedate = req.getParameter("taskduedate");
		String taskstatus = req.getParameter("taskstatus");
		
		HttpSession ses = req.getSession();
		User u = (User) ses.getAttribute("user");
		
	    Task task = new Task(taskid, tasktitle, taskdescription, taskpriority, taskduedate, taskstatus, u.getUserid());
		
		Dao dao = new Dao();
		
		try {
			
		     int res = dao.updateTask(task);
			
		     if(res > 0) {
				
				User user = (User) req.getSession().getAttribute("user");
				List<Task> tasks = dao.getallTaskByuserid(user.getUserid());
				List<Integer> tasksDid = dao.getDelid();
				ses.setAttribute("tasksDid", tasksDid);
				ses.setAttribute("tasks", tasks);
				resp.sendRedirect("home.jsp");
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
