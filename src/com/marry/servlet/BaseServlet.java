package com.marry.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//获取方法名
		String methodName = request.getParameter("method");
		Class cl = this.getClass();
		try {
			//根据方法名和方法参数获得方法(返回处理User业务的方法)
			Method Method = cl.getDeclaredMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
			Method.invoke(this, request,response);

		}  catch (Exception e) {
			e.printStackTrace();
		}
	}

}
