<%@page import="dto.Task"%>
<%@page import="java.util.List"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Todo:Bin</title>
<link rel="stylesheet" href="home.css">
</head>
<body>

        
     <% 
     	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
       
        HttpSession  ses = request.getSession(false);
        User u = (User) ses.getAttribute("user");
        if(u == null) response.sendRedirect("login.jsp");
        else{
	        
        	int userid = u.getUserid();
	        String username = u.getUsername();
	        String useremail = u.getUseremail();
	        long usercontact = u.getUsercontact();
        
     %>
       <header id="navbar">
        <nav>
            <a href="index.jsp" id="nac1" class="nitem1">ToDO</a>
            <a href="back" id="nac2">Back</a>
        </nav>
    </header>
 	<section id="container2">
        <!-- task table -->
        <div id="tt">
            <h2>Trash Bin</h2>
            <table>
                <thead>
                    <tr>
                       <th>SIno</th>
                       <th>Title</th>
                       <th>Descripition</th>
                       <th>priority</th>
                       <th>Due date</th>
                       <th>status</th>
                       <th colspan="2">Edit</th>
                    </tr>
                </thead>
                 <% List<Task> tasks = (List)request.getAttribute("tasks");
                    
                    List<Integer> tasksDid = (List)request.getAttribute("tasksDid");
                   
                    
                    int num = 1;
                    if(!tasks.isEmpty()){
      				for(Task task:tasks){
      					//!tasksDid.contains(task.getTaskid())
      					boolean res = tasksDid.contains(task.getTaskid());
      		
      				  if(res){
      				
      					  
      			%>
                <tbody>
                    <tr>
            			<td><%= num++%></td>
            			<td><%= task.getTasktitle()%></td>
            			<td><%= task.getTaskdescripition()%></td>
            			<td><%= task.getTaskpriority()%></td>
            			<td><%= task.getTaskduedate()%></td>
            			<td><%= task.getTaskstatus()%></td>
            			<td style="text-align: center;"><form action="delete" method="post"><button name="tid" value="<%=task.getTaskid()%>" class="but">Delete</button></form></td>
            			<td style="text-align: center;"><form action="restore" method="post"><button name="tid" value="<%=task.getTaskid()%>" class="but">Restore</button></form></td>
                    </tr>
                </tbody>
                 <% }
                    }
                    }
                    else{
                    	
                    %>
                    <h3 style="text-align: center; color: blue;">No Task Avilable</h3>
                   <%
                    }
                    }%>
            </table>
            <p></p>
        </div>
    </section>

</body>
</html>