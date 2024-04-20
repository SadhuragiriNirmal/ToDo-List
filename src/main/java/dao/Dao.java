package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import java.sql.Blob;
import com.mysql.cj.protocol.Resultset;

import dto.Task;
import dto.User;

public class Dao {
	
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException  {
		
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todolist?user=root&password=root");
			
			return con;
	}
	
	//Add User 
	public static int  saveUser(User user) throws SQLException, ClassNotFoundException {
		
		int userid = Dao.genUserid();
		user.setUserid(userid);
		
		Connection con = Dao.getConnection();
		PreparedStatement pst = con.prepareStatement("insert into user values(?,?,?,?,?,?)");
		pst.setInt(1, userid);
		pst.setString(2, user.getUsername());
		pst.setString(3, user.getUseremail());
		pst.setLong(4, user.getUsercontact());
		pst.setString(5, user.getUserpassword());
		
		
//		Blob image = new SerialBlob(user.getUserimage()); 
//		pst.setBlob(6, image);
		
		pst.setBlob(6, new SerialBlob(user.getUserimage()));
		
		int res = pst.executeUpdate();
		return res;
	}
	
	//User id generator
	public static int genUserid() throws ClassNotFoundException, SQLException {
			
		Connection con = getConnection();
	    Statement st = con.createStatement();
			
		ResultSet rs = st.executeQuery("select max(userid) from user");
		int res = 0;
		if(rs.next())
			res = rs.getInt(1);
		return res + 1;
			
	}
	
	//Get user data by email
	public User findByEmail(String email) throws ClassNotFoundException, SQLException {
		
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select * from user where useremail = ?");
		pst.setString(1, email);
		ResultSet rs = pst.executeQuery();
		
		if(rs.next()) {
			
			User u = new User();
			
			u.setUserid(rs.getInt(1));
			u.setUsername(rs.getString(2));
			u.setUseremail(rs.getString(3));
			u.setUsercontact(rs.getLong(4));
			u.setUserpassword(rs.getString(5));
			
			//getting image blob from data-base
			Blob imageBlob = rs.getBlob(6);
			//converting blobe to byte
			byte[] image = imageBlob.getBytes(1, (int) imageBlob.length());
			u.setUserimage(image);
			
			return u;
			
		}
		else {
			
			return null;
		}
		
	}
	
	//Add tasks
	public int createTask(Task task) throws ClassNotFoundException, SQLException {
		
		int taskid = Dao.genTaskid();
	
		task.setTaskid(taskid);
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("insert into task values(?,?,?,?,?,?,?)");
		
		pst.setInt(1, task.getTaskid());
		pst.setString(2, task.getTasktitle());
		pst.setString(3, task.getTaskdescripition());
		pst.setString(4, task.getTaskpriority());
		pst.setString(5, task.getTaskduedate());
		pst.setString(6, task.getTaskstatus());
		pst.setInt(7, task.getUserid());
		
		int res = pst.executeUpdate();
		return res;
        
		
		
	}
	
	//Task id generator
    public static int genTaskid() throws ClassNotFoundException, SQLException {
			
		Connection con = getConnection();
		Statement st = con.createStatement();
			
		ResultSet rs = st.executeQuery("select max(taskid) from task");
			
		int res = 0;
		if(rs.next()) {
			
			res = rs.getInt(1);
			return res + 1;
		}
		else {
				
			return 0;
		}
			
	}
				
	//Get tasks by user id
	public List<Task> getallTaskByuserid(int userid) throws ClassNotFoundException, SQLException{
		
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select * from task where userid = ?");
		
		pst.setInt(1, userid);
		
		ResultSet rs = pst.executeQuery();
		List<Task> tasks = new ArrayList<Task>();
		
		while(rs.next()) {
			
			Task task = new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
		
			tasks.add(task);
		}
		
		return tasks;
	}
	
	//Delete by id
	public int deleteBytaskid(int tid) throws SQLException, ClassNotFoundException {
		
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("delete from task where taskid = ?");
		
		pst.setInt(1, tid);
		
		int res = pst.executeUpdate();
		
		Dao dao = new Dao();
		dao.delbinId(tid);
		
		return res;
	}
	
	//update task
	public int updateTask(Task task) throws ClassNotFoundException, SQLException {
		
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("update task set tasktitle = ?, taskdescription = ?, taskpriority = ?, taskduedate = ?, taskstatus = ? where taskid = ?");
		
		
		pst.setString(1, task.getTasktitle());
		pst.setString(2, task.getTaskdescripition());
		pst.setString(3, task.getTaskpriority());
		pst.setString(4, task.getTaskduedate());
		pst.setString(5, task.getTaskstatus());
		pst.setInt(6, task.getTaskid());
		
		int res = pst.executeUpdate();
		
		return res;
		
		
	}
	
	//inseret the bin id
	public int delidInsert(int taskid) throws ClassNotFoundException, SQLException {
		
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("insert into bin values(?)");
		
		pst.setInt(1, taskid);
		int res = pst.executeUpdate();
		
		return res;
	}
	
	//get bin deleted id 
   public List getDelid() throws ClassNotFoundException, SQLException {
		
		Connection con = getConnection();
		Statement st = con.createStatement();
		
		
		ResultSet rs = st.executeQuery("select * from bin");
		
		List<Integer> tasksDid = new ArrayList<Integer>();
		
		while(rs.next()) {
			
			tasksDid.add(rs.getInt(1));
		}
		
		return tasksDid;
	}
   
     //delete bin id
	 public int delbinId(int taskid) throws ClassNotFoundException, SQLException {
		
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("delete from bin where delid = ?");
		
		pst.setInt(1, taskid);
		int res = pst.executeUpdate();
		
		return res;
	}
	 
	 
	 //get all task
	 public List getallTask() throws SQLException, ClassNotFoundException {
		 

			Connection con = getConnection();
			Statement st = con.createStatement();
		
			ResultSet rs = st.executeQuery("select * from task");
			List<Task> tasks = new ArrayList<Task>();
			
			while(rs.next()) {
				
				Task task = new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
			
				tasks.add(task);
			}
			
			return tasks;
			
		 }
	 
    //auto update priority
	 public int updatePriority(String priority, int taskid) throws ClassNotFoundException, SQLException {
			
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("update task set taskpriority = ? where taskid = ?");
			
			pst.setString(1, priority);
			pst.setInt(2, taskid);
			int res = pst.executeUpdate();
			
			return res;
		}
    
	
}	