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
        
    </header>
    <h1>Login</h1>
    <div  id="sign">
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
        <% String pass = (String)request.getAttribute("message"); %>
        <h3><%= pass%></h3>
        
    </div>
    </form>
    </div>
    <footer>

    </footer>   

</body>
</html>