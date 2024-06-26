package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.Dao;
import dto.User;

@WebServlet("/saveuser")
@MultipartConfig(maxFileSize = 10*1024*1024)
public class SaveUser extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String name = req.getParameter("username");
		String email = req.getParameter("useremail");
		Long contact = Long.parseLong(req.getParameter("usercontact"));
		String password = req.getParameter("userpass");
		
		//Get image from view as part.
	    Part imagePart = req.getPart("userimage");
	    
	    //convert part image into byte image.
	    byte[] imagebyte = imagePart.getInputStream().readAllBytes();
	    
	    User user = new User(name, email, contact, password, imagebyte);
	    
	    
//	    Dao dao = new Dao();
	    
	    try {
			int res = Dao.saveUser(user);
			if(res > 0) {
				
				resp.sendRedirect("login.jsp");
			}
			else {
				
				resp.sendRedirect("signup.jsp");
				
			}
			
		} catch (SQLException | ClassNotFoundException e) {

			e.printStackTrace();
		} 
	    
	    
	}

}
