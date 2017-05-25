<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.marry.model.*"%>
<%--     <%
    Admin admin = (Admin)session.getAttribute("Admin");
	
    %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员个人信息</title>
<style>
	.h1{
		font-family:"宋体";
		font-size:20px;
		margin-bottom:10px;
	}

	table{
		border-collapse:collapse;
		width:300px; 
		
	}
	td:FIRST-CHILD{
		text-align: right;
	}
	td{
		font-size:18px;
		font-family: "宋体";
		width:150px;
		height:30px;
		padding-right:15px;
	}
</style>
</head>
<body>
	<span class="h1">个人信息</span>
	<table>
		<tr>
			<td>管理员编号:</td>
			<td>${Admin.getUser_Id()}</td>
		</tr>
		<tr>
			<td>管理员名:</td>
			<td>${Admin.getUser_name()}</td>
		</tr>
		<tr>
			<td>Email:</td>
			<td>${Admin.getUser_email()}</td>
		</tr>
		<tr>
			<td>联系方式:</td>
			<td>${Admin.getUser_phone()}</td>
		</tr>
	</table>	
</body>
</html>