<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.marry.model.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<style type="text/css">
	input {
		width:200px;
		height: 20px;
		border: 1px solid;
		margin-bottom:5px;
		padding-left:3px;
	}
	input[type=submit]{
		border: 0px;
		width:80px;
		height: 24px;
		border-radius:2px;
		background-color: #ccc;
		color: black;
	}
</style>
</head>
<body>
	<form action="${pageContext.request.contextPath}/admin/AdminServlet?method=updateAdminPwd" method="post">
		<label>请输入旧密码：</label>
		<p><input type="password" autofocus name="adminpasswordold"></p>
		<label>请输入新密码：</label>
		<p><input type="password" name="adminpassword"></p>
		<input type="submit" value="提交">
	</form>
</body>
</html>