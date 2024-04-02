<%@page import="java.util.Base64"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Todo:Home</title>
</head>
<body>
     
    

     <% 
     
        HttpSession  ses = request.getSession();
        User u = (User) ses.getAttribute("user");
        int userid = u.getUserid();
        String username = u.getUsername();
        String useremail = u.getUseremail();
        long usercontact = u.getUsercontact();
        String image = new String(Base64.getEncoder().encode(u.getUserimage()));
       
        
     %>
     
     <h1>Welcome <%= username%></h1>
     <h3>Eamil: <%= useremail%></h3>
     <h3>Mobile: <%= usercontact%></h3>
     <img alt="" src="data:image/jpeg;base64,<%= image%>" width="180" height="200">
      
      <a href="addtask.jsp">Add Task</a>
</body>
</html>