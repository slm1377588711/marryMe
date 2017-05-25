<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String user_name = "";
	String user_password = "";
	String createTime="";
	String flag = "off";
	//获取Cookie中的用户名和密码数据
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++){
			//查询名字为usernameAndPassword的cookie
			String cookieName = cookies[i].getName();
			if("usernameAndPwd".equals(cookieName)){
				String usernameAndPassword = cookies[i].getValue();
				String[] userAndPass = usernameAndPassword.split(",");
				user_name = userAndPass[0];
				user_password = userAndPass[1];
				createTime = userAndPass[2];
				flag = "on";
				request.setAttribute("flag", flag);
				request.setAttribute("user_name", URLDecoder.decode(user_name,"UTF-8") );
				request.setAttribute("user_password", URLDecoder.decode(user_password,"UTF-8") );
				request.setAttribute("createTime", createTime);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		
		 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
		 <link rel="stylesheet" href="${pageContext.request.contextPath}/font/font-awesome-4.7.0/css/font-awesome.min.css" />
	</head>
	<body>
		
	<!-- 	蒙层设置白底
		<div style="width: 100%;height: 100%;position: fixed; background: rgba(f,f,f,0.5);">
			
		</div>
		 -->
		
	<div class="content">
		<div class="zhezhao">
		</div>
			<div class="login_font">
			</div>
			<p>Log in</p>
				<label class="loginTime">${createTime}</label>
			<img src="${pageContext.request.contextPath}/img/marrymelogo.png" />
		 <form id="login-form" action="${pageContext.request.contextPath}/user/UserServlet?method=login" onsubmit="return loginbut()" method="post">
			<label for="login">昵称</label>
			<input type="text" id="user_name" value="${user_name}" name="user_name"/>
			<div class="clear"></div>
			<label for="password">密码</label>
			<input type="password" id="user_password" value="${user_password}" name="user_password"/>
			<div class="clear"></div>
			<label for="remember_me" style="padding: 0;">记住我?</label>
			<input type="checkbox" value="1" ${flag=="on" ? "checked":""} name="remeberpwd" id="remember_me" />
			<div class="clear"></div>
			<input type="submit" class="button" name="commit" value="登录"/><br/>	
			<button class="zhuceBut"><a href="zhuce.jsp">注册</a></button>
	</form>
		<div class="error">
			<span id="error">
				<%=request.getAttribute("errorInfo")==null?"":request.getAttribute("errorInfo") %>
			</span>
		</div>
	</div>
		<script type="text/javascript">
			function loginbut(){
				var user_nameObj = document.getElementById("user_name");
				var user_passwordObj = document.getElementById("user_password");//获取密码input对象
				var user_nameVal = user_nameObj.value;//获取用户input对象值
				var user_passwordVal = user_passwordObj.value;//获取密码input对象值
				var errorObj = document.getElementById("error");
				//如果用户名为空/6~12
				if(user_nameVal == ''){
					//给出错误提示
					errorObj.innerHTML = "<i class='fa fa-exclamation'></i> 用户名不能为空！";
					//获取焦点
					user_nameObj.focus();
					return false;
				}
				//如果密码为空/6~12
				if(user_passwordVal == ''){
					//给出错误提示
					errorObj.innerHTML = "<i class='fa fa-exclamation'></i> 密码不能为空！";
					//获取焦点
					user_passwordObj.focus();
					return false;
				}
				//验证通过
				errorObj.style.color="blue";
				errorObj.innerHTML = "<i class='fa fa-exclamation'></i> 登录中...";
			return true;
			
		}
		
		</script>
	</body>
</html>
