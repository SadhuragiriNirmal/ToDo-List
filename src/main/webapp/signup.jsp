<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Todo:SignUp</title>
<link rel="stylesheet" href="signup.css">
</head>
<body>
	 <header>
        
    </header>
    <h1>SignUp</h1>
    <div  id="sign">
    <form action="saveuser" method="post" enctype="multipart/form-data">
		<table>
            <tbody>
			   <tr>
				   <td><label for = "id">User Id</label></td>
				   <td><input type="text" name = "userid" id = "uid"></td>
			   </tr>
			   <tr>
				   <td><label for="name">Name</label></td>
				   <td><input type="text" name = "username" id = "name"></td>
			   </tr>  
			   <tr>
				   <td><label for="email">Email</label></td>
				   <td><input type="email" name = "useremail" id = "email"></td>
			   </tr>  
			   <tr>
				   <td><label for="contact">Contact</label></td>
				   <td><input type="text" name = "usercontact" id = "contact"></td>
			   </tr>
			   <tr>
				   <td><label for = "pass">Password</label></td>
				   <td><input type="password" name = "userpass" id ="pass"></td>
			   </tr>
			   <tr>
				   <td><label for = "image">Uplode Image</label></td>
				   <td><input type="file" name = "userimage" id ="image"></td>
			   </tr>
			</tbody>			
		</table>
        <div id="s1">
        <input id ="submit" type = "submit" value="SignUp">
    </div>
    </form>
    </div>
    <footer>

    </footer>   
  

</body>
</html>