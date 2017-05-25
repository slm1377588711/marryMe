package com.marry.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marry.model.User;
import com.marry.service.userService;
import com.marry.util.Page;
import com.marry.util.PageUtil;

public class UserServlet extends BaseServlet {

	// 添加用户名查询
	public void checkUserName(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		System.out.println(userName);
		User user = new User();
		userService us = new userService();
		System.out.println("jinlai");
		int i = 0;
		try {
			user = us.selectUserName(userName);
			// 如果user为空，则进行添加
			if (user != null) {
				i = 2;
			} else {
				i = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.getWriter().write(i + "");
	}

	// 记录实时在线人数
	public void getOnlineList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<User> list = (List<User>) request.getServletContext()
				.getAttribute("online");
		int num = 0;
		if (list != null) {
			num = list.size();
		}
		// 将num人数信息响应给浏览器
		response.getWriter().write(num + "");
	}

	/**
	 * 用户退出登录
	 * 
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 * @throws IOException
	 */
	public void userLoginOut(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			IOException {
		response.setContentType("text/html;charset=utf-8");
		// 销毁session对象
		request.getSession().invalidate();
		// 将页面重定向到登录页面
		response.sendRedirect(request.getContextPath() + "/nav.jsp");
	}

	/**
	 * 用户列表
	 * 
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 * @throws ServletException
	 * @throws IOException
	 */
	public void userlist(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			ServletException, IOException {
		try {
			/* 获取模糊查询的参数 */
			String username = request.getParameter("username");
			// 设置编码
			if (username != null) {
				username = new String(username.getBytes("iso8859-1"), "UTF-8");
			}
			// 获取生日开始时间
			String start = request.getParameter("userbron_start");
			// 获取生日结束时间
			String end = request.getParameter("userbron_end");
			// 获取到的对象放入map集合中
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("username", username);
			params.put("start", start);
			params.put("end", end);
			// 初始化list
			List<User> list = new ArrayList<User>();
			/**
			 * 1、创建userService对象 2、引用 返回总记录数（us.getUserCount()）
			 * 3、分页显示的方法(us.getUserByPage(page))
			 */
			userService us = new userService();
			// 设置默认当前页为1
			int currentPage = 1;
			// 获取客户端请求的当前页
			String currentPageStr = request.getParameter("currentPage");
			// 如果客户端请求的当前页不为空
			if (currentPageStr != null) {
				currentPage = Integer.parseInt(currentPageStr);
			}
			// 设置每页显示5条记录
			int pageSize = 5;
			String pageSizeStr = request.getParameter("pageSize");
			if (pageSizeStr != null) {
				pageSize = Integer.parseInt(pageSizeStr);
			}
			// 调用返回总记录数方法返回值
			int totalCount = us.getUserCount(params);
			// 获取总页数
			int totalPage = PageUtil.getTotalPage(pageSize, totalCount);
			/* 如果获取的当前页大于总页数，则显示最后一页 */
			if (currentPage > totalPage) {
				currentPage = totalPage;
				/* 如果获取的当前页小于1，则显示第一页 */
			} else if (currentPage < 1) {
				currentPage = 1;
			}
			// 工具类方法，三个参数：每页显示记录条数，总条数，当前页
			Page page = PageUtil.createPage(pageSize, totalCount, currentPage);
			// 调用分页显示数据
			list = us.getUserByPageLike(page, params);
			// 把所有数据放入page对象中
			page.setList(list);
			// 把page存储在request作用域
			request.setAttribute("page", page);
			request.setAttribute("params", params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 转发到显示记录页面
		request.getRequestDispatcher("/page/user/Userlist.jsp").forward(
				request, response);
	}

	/**
	 * 修改用户回显数据
	 * 
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateUserSelect(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			ServletException, IOException {
		User user = new User();
		// 接受传过来的ID
		int user_Id = Integer.parseInt(request.getParameter("user_Id"));
		userService us = new userService();
		try {
			user = us.selectUserById(user_Id);

			request.setAttribute("user", user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/page/user/updateUser.jsp").forward(
				request, response);
	}

	/**
	 * 修改用户
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 * @throws IOException
	 */
	public void updateUser(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			IOException {

		int id = Integer.parseInt(request.getParameter("user_Id"));
		String user_name = request.getParameter("user_name");
		String user_password = request.getParameter("user_password");
		String user_email = request.getParameter("user_email");
		String user_phone = request.getParameter("user_phone");
		String user_born = request.getParameter("user_born");
		User user = new User(id, user_name, user_password, user_email,
				user_phone, user_born);
		userService us = new userService();
		int i;
		try {
			i = us.UpdateUser(user);

			if (i > 0) {
				response.sendRedirect(request.getContextPath()
						+ "/page/houtaiindex.jsp#/user/Userlist");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 登录
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 * @throws IOException
	 * @throws ServletException
	 */
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException, IOException, ServletException {
		// 获取用户名
		String user_name = request.getParameter("user_name");
		// 获取密码
		String user_password = request.getParameter("user_password");
		// 获取是否记住密码的状态
		String remeberpwd = request.getParameter("remeberpwd");
		userService us = new userService();
		User user = new User();
		// 设置时间格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		// 获取当前时间
		String createTime = sdf.format(new Date());
		try {
			user = us.CheckUser(user_name, user_password);
			if (user != null) {
				// 创建一个cookie
				Cookie cookie = new Cookie("usernameAndPwd", URLEncoder.encode(
						user_name, "UTF-8")
						+ ","
						+ URLEncoder.encode(user_password, "UTF-8")
						+ ","
						+ createTime);
				// 获取到记住密码复选框的状态为1，说明勾选了
				if ("1".equals(remeberpwd)) {
					// 设置失效时间为7天，单位为秒
					cookie.setMaxAge(7 * 24 * 3600);
					// 设置保存路径为根目录 ：localhost：8080/marry
					cookie.setPath(request.getContextPath());
					// 通过浏览器将cookie对象响应给浏览器
					response.addCookie(cookie);
				} else {
					// 清除用户名和密码对应的cookie对象
					cookie.setMaxAge(0);// 关闭浏览器即消失
					cookie.setPath(request.getContextPath());
					response.addCookie(cookie);// 覆盖
				}
				request.getSession().setAttribute("user", user);
				String path = request.getContextPath();
				response.sendRedirect(path + "/nav.jsp");
			} else {
				request.setAttribute("errorInfo", "用户名或密码错误");
				request.getRequestDispatcher("/login.jsp").forward(request,
						response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 删除用户
	 * 
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 * @throws IOException
	 */
	public void delUser(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException, IOException {
		int uesr_Id = Integer.valueOf(request.getParameter("user_Id"));
		userService us = new userService();
		int i;
		try {
			i = us.delUser(uesr_Id);

			if (i > 0) {
				response.sendRedirect(request.getContextPath()
						+ "/page/houtaiindex.jsp#/user/Userlist");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 批量删除用户
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 * @throws IOException
	 */
	public void delbatch(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			IOException {
		String uesr_Id = request.getParameter("ids");
		userService us = new userService();
		int i;
		try {
			i = us.delBachUser(uesr_Id);
			if (i > 0) {
				response.sendRedirect(request.getContextPath()
						+ "/page/houtaiindex.jsp#/user/Userlist");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 添加用户
	 * 
	 * */
	public void adduser(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException, IOException {
		String user_name = request.getParameter("user_name");
		String user_password = request.getParameter("user_password");
		String user_email = request.getParameter("user_email");
		String user_phone = request.getParameter("user_phone");
		String user_born = request.getParameter("user_born");
		User user = new User(user_name, user_password, user_email, user_phone,
				user_born);
		userService us = new userService();
		int i;
		try {
			i = us.AddUser(user);
			if (i > 0) {
				response.sendRedirect(request.getContextPath()
						+ "/page/houtaiindex.jsp#/user/Userlist");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 用户注册
	 * 
	 * */
	public void Userzhuce(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException, IOException {
		String user_name = request.getParameter("user_name");
		String user_password = request.getParameter("user_password");
		String user_email = request.getParameter("user_email");
		String user_phone = request.getParameter("user_phone");
		String user_born = request.getParameter("user_born");
		User user = new User(user_name, user_password, user_email, user_phone,
				user_born);
		userService us = new userService();
		int i;
		try {
			i = us.AddUser(user);
			if (i > 0) {
				response.sendRedirect(request.getContextPath()
						+ "/nav.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
