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
    
     <header>
        <nav>
			<a href="index.jsp" id="sh">ToDo</a>
			<a href="home.jsp" id="hs">Back</a>
		</nav>
    </header>
    <h1>Add Task</h1>
    <div  id="sign">
    <form action="addtask" method="post">
		<table>
            <tbody>
			   <tr>
				   <td><label for="title">Task Title</label></td>
				   <td><input type="text" name = "tasktitle" id = "title" required="required"></td>
			   </tr>  
			   <tr>
				   <td><label for="dis">Task Description</label></td>
				   <td><input type="text" name = "taskdescription" id = "dis" required="required"></td>
			   </tr>  
			   <tr>
				   <td><label for="low">Low Priority</label></td>
				   <td><input type="radio" name = "taskpriority" id = "low" value="low" required="required"></td>
			   </tr>
			   <tr>
				   <td><label for="medium">Medium Priority</label></td>
				   <td><input type="radio" name = "taskpriority" id = "medium" value="medium" required="required"></td>
				   
			   </tr>
			   <tr>
				   <td><label for="high">High Priority</label></td>
				   <td><input type="radio" name = "taskpriority" id = "high" value="high" required="required"></td>
			   </tr>
			   <tr>
				   <td><label for = "duedate">Due date</label></td>
				   <td><input type="date" name = "taskduedate" id ="duedate" required="required"></td>
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