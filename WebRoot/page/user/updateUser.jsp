<%@ page language="java" import="com.marry.model.*,com.marry.service.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改用户</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adduser.css">
	</head>
	<body>
	<section>
		<form class="form" method="post" action="${pageContext.request.contextPath }/user/UserServlet?method=updateUser" name = "myform">	
			<p>
				<label for="user_Id">编号</label>
				<input type="text" id="user_Id"  name="user_Id" value="${user.getUser_Id()}" readOnly/>
			</p>
			<p>
				<label for="user_name">昵称</label>
				<input type="text" id="user_name" autofocus name="user_name" value="${user.getUser_name()}" required = "required"/>
			</p>
			<p>
				<label for="user_password">密码</label>
				<input type="password" id="user_password" value="${user.getUser_password()}" name="user_password"/>
			</p>
			<p>
				<label for="user_email">电子邮箱</label><br />
				<input type="email" id="user_email" name="user_email" value="${user.getUser_email()}" required = "required" />
			</p>
			<p>
				<label for="user_phone">手机号码</label><br />
				<input type="telephone" id="user_phone" name="user_phone" value="${user.getUser_phone()}" required = "required"/>
			</p>
			<p>
				<label for="user_born">出生年月</label><br />
				<input type="text" id="user_born" name="user_born" value="${user.getUser_born()}" required = "required"/>
			</p>
			<p>
				<input type="submit" value="确认修改" id="submit" name="submit" />
			</p>
		</form>
	</section>
	</body>
</html>
