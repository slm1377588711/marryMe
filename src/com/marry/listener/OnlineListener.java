package com.marry.listener;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.marry.model.User;

public class OnlineListener implements ServletContextListener,
		HttpSessionListener,HttpSessionAttributeListener{



	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		//创建session

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		//session被毁

	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// application销毁

	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		List<User> onlineList  = new ArrayList<User>();
		sce.getServletContext().setAttribute("online", onlineList);
	}

	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		// 添加session属性
		//获取在session存的对象对象名，返回值为枚举Enum
		Enumeration<String> sessionName = se.getSession().getAttributeNames();
		if(sessionName!=null){
			while(sessionName.hasMoreElements()){
				String userObjectName=sessionName.nextElement();
				if("user".equals(userObjectName)){
					//获取到session中的对象user
					User user = (User) se.getSession().getAttribute("user");
					//获取到application集合作在线人数集合
					List<User> onlineList = (List<User>) se.getSession().getServletContext().getAttribute("online");
					System.out.println(onlineList);
					onlineList.add(user);
				}
			}
		}
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		// 移除session属性
	User user = (User) se.getSession().getAttribute("user");
	List<User> onlineList = (List<User>) se.getSession().getServletContext().getAttribute("online");
	onlineList.remove(user);	
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		//修改session属性
		
	}

}
