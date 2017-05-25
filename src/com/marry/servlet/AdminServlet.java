package com.marry.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marry.model.User;
import com.marry.service.userService;

public class AdminServlet extends BaseServlet {
	/*验证 验证码*/
	public void Code(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException, IOException, ServletException {
		response.setContentType("text/html;charset=utf-8");
		// 获取用户输入的验证码
		String admincode = request.getParameter("code");
		// 获取系统生成的验证码
		String sessionCode = (String) request.getSession().getAttribute(
				"verifyCode");
		if (admincode.equalsIgnoreCase(sessionCode)) {
			response.getWriter().write("{\"success\":true,\"msg\":\"√\"}");
		} else {
			response.getWriter().write("{\"success\":false,\"msg\":\"×\"}");
		}
	}
	/*验证用户名和密码*/
	public void houtailogin(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			IOException, ServletException {
		response.setContentType("text/html;charset=utf-8");
		String adminname = request.getParameter("adminname");
		String adminpwd = request.getParameter("adminpwd");
		User user = new User();
		userService us = new userService();
		try {
			user = us.CheckUser(adminname, adminpwd);
			if (user != null) {
				request.getSession().setAttribute("Admin", user);
				response.getWriter().write("{\"success\":true,\"msg\":\"成功\"}");
			} else {
				response.getWriter().write(
						"{\"success\":false,\"msg\":\"用户名或密码错误\"}");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	/**
	 * 修改管理员密码
	 * 
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 * @throws IOException
	 */
	public void updateAdminPwd(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 获取session的用户
		User adminsession = (User) request.getSession().getAttribute("Admin");
		// 获取session的ID值
		int adminId = adminsession.getUser_Id();
		String adminname = adminsession.getUser_name();
		// 获取输入的旧密码
		String adminold = request.getParameter("adminpasswordold");
		// 获取新的密码
		String adminpwd = request.getParameter("adminpassword");
		// 获取session旧密码
		String oldpwd = adminsession.getUser_password();
		// 给实体类设置值，ID和用户名是session作用域的，密码是输入新的密码
		// 判断输入的旧密码和获取数据库里的旧密码是否相等，如果相等，则执行修改密码操作，否则，修改失败
		if (adminold.equals(oldpwd)) {
			// 创建adminService对象
			userService us = new userService();
			// 调用方法
			try {
				us.UpdatePassword(adminpwd,adminId);
				out.print("<script>alert('您的密码已过期，请重新登录');</script>");
				out.print("<script>location.href='../houtailogin.jsp';</script>");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			out.write("您输入的密码有误");
		}
	}

	/**
	 * 管理员退出登录
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void loginOut(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// 销毁session对象
		request.getSession().invalidate();
		// 将页面重定向到登录页面
		response.sendRedirect(request.getContextPath() + "/houtailogin.jsp");
	}

}
