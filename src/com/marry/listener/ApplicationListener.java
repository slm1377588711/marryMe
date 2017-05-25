package com.marry.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ApplicationListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {

		try {
			Class.forName("com.marry.util.Dbutil");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("配置文件加载出错");
		}
	}

}
