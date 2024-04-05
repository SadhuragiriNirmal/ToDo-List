<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Todo:Addtask</title>
<link rel="stylesheet" href="addtask.css">
</head>
<body>

    
     <% 
        
        int taskid = Integer.parseInt(request.getParameter("tid")); 
     
        String tasktitle = request.getParameter("tasktitle");
		String taskdescription = request.getParameter("taskdescription");
		String taskpriority = request.getParameter("taskpriority");
		String taskduedate = request.getParameter("taskduedate");
		String taskstatus = request.getParameter("taskstatus");
		
     %>
     
     <header>
        <nav>
			<a href="index.jsp" id="sh">ToDo</a>
			<a href="home.jsp" id="hs">Back</a>
		</nav>
    </header>
    <h1>Update Task</h1>
    <div  id="sign">
    <form action="update" method="post">
		<table>
            <tbody>
			   <tr>
				   <td><label for="title">Task Title</label></td>
				   <td><input type="text" name = "tasktitle" id = "title" required="required" value="<%=tasktitle%>"></td>
			   </tr>  
			   <tr>
				   <td><label for="dis">Task Description</label></td>
				   <td><input type="text" name = "taskdescription" id = "dis" required="required" value="<%=taskdescription%>"></td>
			   </tr>
			<% if(taskpriority.equals("low")) { %>  
			   <tr>
				   <td><label for="low">Low Priority</label></td>
				   <td><input type="radio"  name = "taskpriority" id = "low" value="low" required="required" checked="checked"></td>
			   </tr>
			   <tr>
				   <td><label for="medium">Medium Priority</label></td>
				   <td><input type="radio" name = "taskpriority" id = "medium" value="medium" required="required"></td>
				   
			   </tr>
			   <tr>
				   <td><label for="high">High Priority</label></td>
				   <td><input type="radio" name = "taskpriority" id = "high" value="high" required="required"></td>
			   </tr>
			<% } else if(taskpriority.equals("medium")) { %> 
			   <tr>
				   <td><label for="low">Low Priority</label></td>
				   <td><input type="radio"  name = "taskpriority" id = "low" value="low" required="required"></td>
			   </tr>
			   <tr>
				   <td><label for="medium">Medium Priority</label></td>
				   <td><input type="radio" name = "taskpriority" id = "medium" value="medium" required="required" checked="checked"></td>
				   
			   </tr>
			   <tr>
				   <td><label for="high">High Priority</label></td>
				   <td><input type="radio" name = "taskpriority" id = "high" value="high" required="required"></td>
			   </tr>
			<% }else if(taskpriority.equals("high")) { %>  
			   <tr>
				   <td><label for="low">Low Priority</label></td>
				   <td><input type="radio"  name = "taskpriority" id = "low" value="low" required="required"></td>
			   </tr>
			   <tr>
				   <td><label for="medium">Medium Priority</label></td>
				   <td><input type="radio" name = "taskpriority" id = "medium" value="medium" required="required"></td>
				   
			   </tr>
			   <tr>
				   <td><label for="high">High Priority</label></td>
				   <td><input type="radio" name = "taskpriority" id = "high" value="high" required="required" checked="checked"></td>
			   </tr>
			<% } %>    
			   <tr>
				   <td><label for = "duedate">Due date</label></td>
				   <td><input type="date" name = "taskduedate" id ="duedate" required="required" value="<%=taskduedate%>"></td>
				  
			   </tr>
			   <tr>
				   <td><label for="status">Task Status</label></td>
				   <td><input type="text" name = "taskstatus" id = "status" required="required" value="<%=taskstatus%>"></td>
				   <td><input type="hidden" name ="tid" value=<%=taskid%>></td>
			   </tr>
			</tbody>			
		</table>
        <div id="s1">
        <input id ="submit" type = "submit">
    	</div>
    </form>
    </div>
    <footer>

    </footer>   
</body>
</html>
