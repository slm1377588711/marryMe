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
		<form class="form" method="post" action="${pageContext.request.contextPath }/marry/MarryServlet?method=addmarry" name = "myformadd">	
			<p>
				<label for="user_name">商品名称</label>
				<input type="text" id="nameadd" name="name" required = "required"/>
			</p>
			<p>
				<label for="user_password">价格</label>
				<input type="text" id="priceadd" name="price"/>
			</p>
			<p>
				<label for="user_email">商品信息</label><br />
				<input type="text" id="infoadd" name="info" required = "required" />
			</p>
			<p>
				<label for="user_phone">商品类型</label><br />
				<input type="text" id="typeadd" name="type" required = "required"/>
			</p>
			<p>
				<label for="user_born">展示图片</label><br />
				<input type="text" id="imgadd" name="img" required = "required"/>
			</p>
			<p>
				<label for="user_born">展示视频</label><br />
				<input type="text" id="vedioadd" name="vedio" required = "required"/>
			</p>
			<p>
				<input type="submit" value="确认添加" />
			</p>
		</form>
	</section>
	</body>
</html>
