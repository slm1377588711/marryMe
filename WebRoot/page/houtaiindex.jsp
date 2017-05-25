<%@ page language="java" import="java.util.*,com.marry.model.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <%
	Admin admin = (Admin)session.getAttribute("Admin");
%> --%>
<!DOCTYPE html>
<html>
<head>
<!--网页编码 -->
<meta charset="utf-8" />
<meta name="keyword" content="婚纱,婚庆,结婚" />
<meta name="description" content="Marry婚庆公司" />
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico">
<title>后台首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/houtaiIndex.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/font/font-awesome-4.7.0/css/font-awesome.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/houtaiindex.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
</head>
<body bgcolor="LavenderBlush">
	<!-- 退出登录的模态框 -->
	<div class="show" id="show">
		<div class="mengceng" id="mengceng"></div>
		<div class="loginout" id="loginout">
			<span>您确定退出吗？退出之后，您将重新登录</span>
			<button onclick="loginout()" class="butt1">确定</button>
			<button onclick="quxiao()" class="butt2">取消</button>
		</div>
	</div>
	<!--系统顶部导航 start-->
	<div class="marryme-header">
		<!--这的a标签路径以后改为前台首页-->
		<h1 class="logo">
			<a href="login.html">MarryMe</a>
		</h1>
		<div class="title">
			<span id="title-text">后台首页</span> <i id="icon"></i> <span>前台在线人数：</span><a
				id="onLineNum" onClick="showOnlineList()" href="javasript:;">
				${fn:length(applicationScope.online) }</a>
		</div>
		<div id="login-info" class="login-info">
			<a href="#"><i class="fa fa-user-circle-o"></i>&nbsp;${Admin.getUser_name()}&nbsp;<i
				id="carset" class="fa fa-caret-down"></i> </a>
			<div id="panel" class="panel">
				<span class="sanjiao"></span>
				<ul>
					<li><a onclick="showAdminInfo()" href="javascript:;">个人信息</a></li>
					<li><a onclick="updatepassword()" href="javascript:;">修改密码</a></li>
					<li class="line"></li>
					<li><a onclick="showmengceng()" href="javascript:;">退出</a></li>
				</ul>
			</div>
		</div>
		<ul class="list-item">
			<li><a href="javascript:;">用户管理</a></li>
			<li><a href="javascript:;">商品管理</a></li>
		</ul>
	</div>
	<!--系统顶部导航 end-->
	<!--左边菜单栏start-->
	<div class="marryme-left">
		<h3 class="title">
			<img src="${pageContext.request.contextPath }/img/touxiang.jpg" alt="头像" /> <span>
				${Admin.getUser_name()}</span>
		</h3>
		<ul id="nav" class="nav">
			<li class="nav-item"><span><i class="fa fa-hand-o-right"></i>
					用户管理</span>
				<ul class="nav-item-list">
					<li id="Userlist" data-url="${pageContext.request.contextPath }/user/UserServlet?method=userlist"><a
						href="#/user/Userlist">用户列表</a></li>
					<li id="addUser" data-url="${pageContext.request.contextPath }/page/user/addUser.jsp"><a
						href="#/user/addUser">添加用户</a></li>
					<li id="updateUser" style="height: 0px"
						data-url="user/UserServlet?method=updateUser&user_Id="><a
						style="display: inline-block;height: 0px;font-size:0px"
						href="#/user/updateUser">修改用户</a></li>
				</ul></li>
			<li class="nav-item"><span><i class="fa fa-hand-o-right"></i>
					商品管理</span>
				<ul class="nav-item-list">
					<li id="Marrylist" data-url="${pageContext.request.contextPath }/marry/MarryServlet?method=marrylist"><a
						href="#/marry/Marrylist">商品列表</a></li>
					<li id="addMarry" data-url="${pageContext.request.contextPath }/page/marry/addMarry.jsp"><a
						href="#/marry/addMarry">添加商品</a></li>
					<li id="updateMarry" data-url="marry/MarryServlet?method=updateMarry&Id="><a
					style="display: inline-block;height: 0px;font-size:0px"
						href="#/marry/updateMarry">修改商品</a></li>

				</ul></li>
		</ul>
	</div>
	<!--左边菜单栏end-->
	<!--右侧显示区包含两大部分：顶部包含内容；底部页脚，顶部使用js设置最小宽度和最小高度，内容区自己填充-->
	<div class="marryme-right">
		<!--右侧顶部 设置最小高度和最小宽度-->
		<div id="marryme-right-top" class="marryme-right-top">
			<!--右侧顶部的内容区-->
			<div id="marryme-right-content" class="marryme-right-content">
			</div>
		</div>
		<!--页脚-->
		<div class="marryme-right-bottom">
			<span>@2016 Baidu | 京ICP证030173号</span>
		</div>
	</div>

	<script>
		//修改密码
		function updatepassword() {
			$$("#marryme-right-content").load("${pageContext.request.contextPath}/page/admin/updatepassword.jsp");
		}

		//退出登录 中显示确定模态框 
		function showmengceng() {
			var showObj = document.getElementById("show");
			showObj.style.display = "block";
		}
		//进入退出登录处理页面
		function loginout() {
			window.location.href = "${pageContext.request.contextPath}/admin/AdminServlet?method=loginOut";
		}
		//取消退出
		function quxiao(){
			var showObj = document.getElementById("show");
			showObj.style.display = "none";
		}
		//显示管理员个人信息
		function showAdminInfo() {
			$$("#marryme-right-content").load("${pageContext.request.contextPath}/page/admin/adminInfo.jsp");
		}
		//显示在线人员信息
		function showOnlineList() {
			$$("#marryme-right-content").load("${pageContext.request.contextPath}/page/user/onLineLisr.jsp");
		}
		jQuery.noConflict(); //将$符所有权剔除
		var $$ = jQuery;
		marryme.init(); //调用houtaiindex.js封装的top区，left区，right区的事件 
		var url = window.location.href; //获取当前url信息
		var target = url.substring(url.indexOf("#")); //indexOf返回第一次出现#的位置  subString截取#出现的位置到最后的字符串
		if (target == "#/user/addUser") {
			//触发添加用户的单击事件
			$().getId("addUser").elements[0].onclick();
		} else if (target == "#/user/Userlist") {
			//触发用户列表的单击事件
			$().getId("Userlist").elements[0].onclick();
		} else if (target == "#/user/updateUser") {
			//触发修改用户的单击事件
			$().getId("updateUser").elements[0].onclick();
		} else if (target == "#/marry/addMarry") {
			//触发添加商品的单击事件
			$().getId("addMarry").elements[0].onclick();
		} else if (target == "#/marry/Marrylist") {
			//触发商品列表的单击事件
			$().getId("Marrylist").elements[0].onclick();
		} else if (target == "#/marry/updateMarry") {
			//触发修改商品的单击事件
			$().getId("updateMarry").elements[0].onclick();
		} else if (url.indexOf("#") == -1) {
			$$("#marryme-right-content").load("index/success.html");
		} else {
			$$("#marryme-right-content").load("error/404.jsp");
		}
		/* 左侧导航栏动画 */
		
			$$(".nav-item span").click(function(){
				$$(this).next("ul").toggle(
					function(){//slideUp()
						$$(this).next("ul").stop().fadeIn();
					},
					function(){//
						$$(this).next("ul").stop().fadeOut();
					}
				);
				
				$$(this).parent().siblings("li").children("ul").stop().slideUp();
			});
		
		

		/* 异步ajax请求：原生js */
		/* 创建XMLHttpRequest */
		function createXMLHttpRequest() {
			var xmlhttp;
			if (window.XMLHttpRequest) {
				//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
				xmlhttp = new XMLHttpRequest();
			} else {
				// IE6, IE5 浏览器执行代码
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			return xmlhttp;
		}
		function loadData() {
			// 1.创建异步XMLHttpRequest对象
			var xhr = createXMLHttpRequest();
			// 2.设置状态改变触发一个函数：请求响应回来之后会自动调用的函数
			xhr.onreadystatechange = function() {
				// 回调函数.
				if (xhr.readyState == 4) {// 请求发送完成
					if (xhr.status == 200) {// 响应也正确
						var data = xhr.responseText;
						console.log("num=" + data);
						//刷新在线人数
						var onlineNum = document.getElementById("onLineNum");
						onlineNum.innerHTML = data;
					}
				}
			}
			// 3.设置请求方式和请求路径
			xhr
					.open(
							"GET",
							"${pageContext.request.contextPath}/user/UserServlet?method=getOnlineList",
							true);

			// 4.发送请求
			xhr.send(null);
		}
		setInterval(function() {
			loadData();
		}, 10000);
	</script>
</body>
</html>
