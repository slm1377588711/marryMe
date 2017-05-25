<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<title></title>
  </head>
  
  <body>
	欢迎${user.user_name}
	<button onclick="loginout()">退出登录</button>


<script type="text/javascript">
function loginout(){
	window.location.href="${pageContext.request.contextPath}/user/UserServlet?method=userLoginOut";
}
</script>
  </body>
</html>
