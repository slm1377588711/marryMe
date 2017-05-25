package com.marry.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.marry.model.Marry;
import com.marry.model.User;
import com.marry.service.marryService;
import com.marry.service.userService;
import com.marry.util.Page;
import com.marry.util.PageUtil;


public class MarryServlet extends BaseServlet {
	
	
	
	//根据商品ID查询商品，前台用户点击图片传selectMarryById
	public void selectMarryById(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			ServletException, IOException {
		System.out.println("进入查询方法内。。。。");
		Integer Id = Integer.valueOf(request.getParameter("id"));
		marryService ms = new marryService();
		try {
			Marry marry = ms.selectMarryById(Id);
			System.out.println(marry.getName());
			//查询到的商品，存入session
			request.getSession().setAttribute("getmarryById",marry);
			String mar =  JSON.toJSONString(marry);
			response.getWriter().write(mar);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 根据商品类型查询商品
	 */
	public void selectMarry(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			ServletException, IOException {
		String type = request.getParameter("type");
		if (type != null) {
			type = new String(type.getBytes("iso8859-1"), "UTF-8");
		}
		List<Marry> marrylist = null;
		marryService ms = new marryService();
		try {
			 marrylist = ms.selectMarry(type);
		} catch (SQLException e) {
		}
		String marry = JSON.toJSONString(marrylist);
		response.getWriter().write(marry);
	}
	/**
	 * 商品列表
	 * 
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 * @throws ServletException
	 * @throws IOException
	 */
	public void marrylist(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			ServletException, IOException {
		try {
			/* 获取模糊查询的参数 */
			String type = request.getParameter("type");
			// 设置编码
			if (type != null) {
				type = new String(type.getBytes("iso8859-1"), "UTF-8");
			}
			// 获取最小价格区间
			String start = request.getParameter("price_start");
			// 获取最大
			String end = request.getParameter("price_end");
			// 获取到的对象放入map集合中
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("type", type);
			params.put("start", start);
			params.put("end", end);
			// 初始化list
			List<Marry> list = new ArrayList<Marry>();
			/**
			 * 1、创建marryService对象 
			 * 2、引用 返回总记录数（us.getMarryCount()）
			 * 3、分页显示的方法(us.getMarryByPage(page))
			 */
			marryService ms = new marryService();
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
			int totalCount = ms.getMarryCount(params);
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
			list = ms.getMarryByPageLike(page, params);
			// 把所有数据放入page对象中
			page.setList(list);
			// 把page存储在request作用域
			request.setAttribute("page", page);
			request.setAttribute("params", params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 转发到显示记录页面
		request.getRequestDispatcher("/page/marry/Marrylist.jsp").forward(
				request, response);
	}
	
	
	/**
	 * 修改商品回显数据
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateMarrySelect(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			ServletException, IOException {
		Marry marry = new Marry();
		// 接受传过来的ID
		int Id = Integer.parseInt(request.getParameter("Id"));
		marryService ms = new marryService();
		try {
			marry = ms.selectMarryById(Id);

			request.setAttribute("marry", marry);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/page/marry/updateMarry.jsp").forward(
				request, response);
	}
	
	/**
	 * 修改商品
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 * @throws IOException
	 */
	public void updateMarry(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException,
			IOException {

		int id = Integer.parseInt(request.getParameter("Id"));
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String info = request.getParameter("info");
		String type = request.getParameter("type");
		String img = request.getParameter("img");
		String vedio = request.getParameter("vedio");
		Marry marry = new Marry(id, name, price, info, type, img, vedio);
		marryService ms = new marryService();
		try {
			 ms.UpdateMarry(marry);
				response.sendRedirect(request.getContextPath()
						+ "/page/houtaiindex.jsp#/marry/Marrylist");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 删除商品
	 * 
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 * @throws IOException
	 */
	public void delMarry(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException, IOException {
		int Id = Integer.valueOf(request.getParameter("Id"));
		marryService ms = new marryService();
		try {
			 ms.delMarry(Id);

				response.sendRedirect(request.getContextPath()
						+ "/page/houtaiindex.jsp#/marry/Marrylist");
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
		String Id = request.getParameter("ids");
		marryService ms = new marryService();
		try {
			 ms.delBachMarry(Id);
				response.sendRedirect(request.getContextPath()
						+ "/page/houtaiindex.jsp#/marry/Marrylist");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 添加商品
	 * 
	 * */
	public void addmarry(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException, IOException {
		System.out.println("方法内");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String info = request.getParameter("info");
		String type = request.getParameter("type");
		String img = request.getParameter("img");
		String vedio = request.getParameter("vedio");
		Marry marry = new Marry(name, price, info, type, img, vedio);
		System.out.println("name"+marry+"price"+price);
		marryService ms = new marryService();
		try {
			 ms.addMarry(marry);
				response.sendRedirect(request.getContextPath()
						+ "/page/houtaiindex.jsp#/marry/Marrylist");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
