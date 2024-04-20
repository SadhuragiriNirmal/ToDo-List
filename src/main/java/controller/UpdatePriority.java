package controller;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import dao.Dao;
import dto.Task;

@WebListener
public class UpdatePriority implements ServletContextListener{
	
	private BackgroundTask backgroundTask;
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {

		 backgroundTask = new BackgroundTask();
	     backgroundTask.start();
		 
		
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
		 if (backgroundTask != null) {
			 
	            backgroundTask.stopTask();
	        }
		
	}	

}
