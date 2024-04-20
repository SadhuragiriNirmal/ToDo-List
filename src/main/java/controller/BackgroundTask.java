package controller;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import dao.Dao;
import dto.Task;

public class BackgroundTask extends Thread {
    
    private volatile boolean isRunning = true; // Volatile to ensure visibility across threads
    
    @Override
    public void run() {
        while (isRunning) {
        	
    		
   		 Dao dao = new Dao();
   		 
   		 try {
   			List<Task> tasks = dao.getallTask();
   			for(Task task:tasks) {
   			
   			    LocalDate today = LocalDate.now();
   			    LocalDate duedate = LocalDate.parse(task.getTaskduedate());
   			    long dif = ChronoUnit.DAYS.between(today, duedate);
   		         
   			    if(dif <= 3) {
   			    	
   			    	dao.updatePriority("high", task.getTaskid());
   			    	
   			    }
   			    else if(dif >= 4  && dif <= 7) {
   			    	
   			    	dao.updatePriority("medium", task.getTaskid());
   			    }
   			    else {
   			    	
   			    	dao.updatePriority("low", task.getTaskid());
   			    }
   			}
   			
   		} catch (ClassNotFoundException | SQLException e) {
   			// TODO Auto-generated catch block
   			e.printStackTrace();
   		}
           
        	try {
                Thread.sleep(1000); // Adjust as needed
            } catch (InterruptedException e) {
                // Handle interruption if needed
            }
        }
    }
    
    public void stopTask() {
        isRunning = false;
    }
}

