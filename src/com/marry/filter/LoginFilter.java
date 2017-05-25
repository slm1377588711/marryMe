package com.marry.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		/*先看请求的地址是否就是登录页面，如果是，就放行，如果不是，判断是否已登录，否则，重定向到登录页面*/
		/*获取浏览器地址栏地址*/
		String path = req.getRequestURI();
		/*获取请求servlet的方法名*/
		String methodName = req.getParameter("method");
		if(path.endsWith("login.jsp")
				|| path.endsWith(".css") 
				|| path.endsWith(".js")
				|| path.endsWith(".jpg")
				|| path.endsWith(".png")
				|| path.endsWith(".gif")){
			chain.doFilter(req, resp);
		}else if("houtailogin".equals(methodName)){
			chain.doFilter(req, resp);
		}else if("login".equals(methodName)){
			chain.doFilter(req, resp);
		}else{
			/*判断session中是否为空*/
			Object admin=req.getSession().getAttribute("Admin");
			
			if(admin!=null){
				chain.doFilter(req, resp);
			}else{
				resp.sendRedirect(req.getContextPath()+"/houtailogin.jsp");
			}
			
		}
		
		
		
		
		
		
		
		
		
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
