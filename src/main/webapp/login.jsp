<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Todo:Login</title>
 <link rel="stylesheet" href="login.css">
</head>
<body>
     <header>
        <nav>
			<a href="index.jsp" id="sh">ToDo</a>
			<a href="signup.jsp" id="hs">SignUp</a>
		</nav>
    </header>
    <h1>Login</h1>
    <div  id="login">
    <form action="userlogin" method="post">
		<table>
            <tbody>
			     
			   <tr>
				   <td><label for="email">Email</label></td>
				   <td><input type="email" name = "useremail" id = "email" required="required"></td>
			   </tr>  
			   
			   <tr>
				   <td><label for = "pass">Password</label></td>
				   <td><input type="password" name = "userpass" id ="pass" required="required"></td>
			   </tr>
			   
			</tbody>			
		</table>
        <div id="s1">
        <input id ="submit" type = "submit" value="Login">
        <% String pass = (String)request.getAttribute("message"); 
        if(pass != null){
        %>
         <h4 style="color:blue; padding-top: 10px"><%= pass%></h4>
     <%} %>
    </div>
    </form>
    </div>
    
    <footer>

    </footer>   

</body>
</html>