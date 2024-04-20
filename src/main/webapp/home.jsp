<%@page import="dto.Task"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>Todo:Home</title>
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
	        String image = new String(Base64.getEncoder().encode(u.getUserimage()));
        
        
     %>
       <header id="navbar">
        <nav>
            <a href="index.jsp" id="nac1" class="nitem1">ToDO</a>
            <a href="logout" id="nac2">LogOut</a>
        </nav>
    </header>
    <section id="container">
        <!-- user info -->
    <div id="uio">
        <div id="ui">
            <img alt="" src="data:image/jpeg;base64,<%= image%>" id="img1">
            <div id="info">

                <p>Name :</p><p><%= username%></p>
        
                <p>Email id :</p><p><%= useremail%></p>

                <p>Mobile no :</p><p><%= usercontact%></p>

            </div>
            <img src="assert/projektmanagement.png" alt="" id="img2">
            <div id ="add">
             <form action="bin" method="post"><button class="but">Bin</button></form>
            <form action="addtask.jsp"method="post"><button name="tid" class="but" id="pluse">+</button></form>
            </div>
        </div>
    </div>
    </section>
 <section id="container2">
        <!-- task table -->
        <div id="tt">
            <h2>Tasks</h2>
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
                 <% List<Task> tasks = (List)ses.getAttribute("tasks");
                    
                    List<Integer> tasksDid = (List)ses.getAttribute("tasksDid");
                   
                    
                    int num = 1;
                    if(!tasks.isEmpty()){
      				for(Task task:tasks){
      					//!tasksDid.contains(task.getTaskid())
      					boolean res = tasksDid.contains(task.getTaskid());
      		
      				  if(!res){
      				
      					  
      			%>
                <tbody>
                    <tr>
            			<td><%= num++%></td>
            			<td><%= task.getTasktitle()%></td>
            			<td><%= task.getTaskdescripition()%></td>
            			<td><%= task.getTaskpriority()%></td>
            			<td><%= task.getTaskduedate()%></td>
            			<td><%= task.getTaskstatus()%></td>
            			<td style="text-align: center;"><form action="bin" method="post"><button name="tid" value="<%=task.getTaskid()%>" class="but">Delete</button></form></td>
            			<td style="text-align: center;">
            			<form action="update.jsp" method="post">
            				<button name="tid" value="<%=task.getTaskid()%>" class="but">Update</button>
            			    <input type="hidden" name = "tasktitle" value="<%=task.getTasktitle()%>">
            			    <input type="hidden" name = "taskdescription" value="<%=task.getTaskdescripition()%>">
                            <input type="hidden" name = "taskpriority" value="<%=task.getTaskpriority()%>"> 			
            			    <input type="hidden" name = "taskduedate" value="<%=task.getTaskduedate()%>">
            			    <input type="hidden" name = "taskstatus" value="<%=task.getTaskstatus()%>">
            			</form>
            			</td>
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
    <footer>
        <section>
            <div id="a1">
                 <h2>LEARNING</h2>
                 <div class="bar"></div>
                 <p>
                     Create a To Do List
                     <br>
                     Plan and share tasks
                     <br>
                     Create Kanban Board
                     <br>
                     Project management
                     <br>
                     File Upload
                     <br>
                     Write comments
                 </p>
            </div>
            <div id="a2">
             <h2>LINKS</h2>
              <div class="bar"></div>
              <p>
                 Imprint
                 <br>
                 Privacy
                 <br>
                 Terms of use
              </p>
 
            </div>
            <div id="a3">
             <h1>This makes collaboration fun and the project a success.</h1>
             <div class="bar"></div>
             <h3>Powered By MSG Keni Tech</h3>
            </div>
 
         </section>

    </footer>   
       
       <script src="index.js"></script>
</body>
</html>