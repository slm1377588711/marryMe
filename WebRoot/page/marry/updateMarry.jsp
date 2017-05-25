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
		<form class="form" method="post" action="${pageContext.request.contextPath }/marry/MarryServlet?method=updateMarry" name = "myform">	
			<p>
				<input type="hidden" id="Id"  name="Id" value="${marry.getId()}"/>
			</p>
			<p>
				<label for="user_name">商品名称</label>
				<input type="text" id="name" name="name" value="${marry.getName()}" required = "required"/>
			</p>
			<p>
				<label for="user_password">价格</label>
				<input type="text" id="price" value="${marry.getPrice()}" name="price"/>
			</p>
			<p>
				<label for="user_email">商品信息</label><br />
				<input type="text" id="info" name="info" value="${marry.getInfo()}" required = "required" />
			</p>
			<p>
				<label for="user_phone">商品类型</label><br />
				<input type="text" id="type" name="type" value="${marry.getType()}" required = "required"/>
			</p>
			<p>
				<label for="user_born">展示图片</label><br />
				<input type="text" id="img" name="img" value="${marry.getImg()}" required = "required"/>
			</p>
			<p>
				<label for="user_born">展示视频</label><br />
				<input type="text" id="vedio" name="vedio" value="${marry.getVideo()}" required = "required"/>
			</p>
			<p>
				<input type="submit" value="确认修改" id="submit" name="submit" />
			</p>
		</form>
	</section>
	</body>
</html>
