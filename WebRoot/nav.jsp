<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<title>MarryMe</title>
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src='js/style.js'></script>
		<link rel="stylesheet" href="css/style.css">
	</head>

	<body>
		<!--导航栏-->
		<div class="nav">
		   <c:choose>
		  	<c:when test="${empty user.getUser_name() }">
		  	<!--加载登录注册索引-->
			<div id="loadlogin" onclick="loadlogin()" style="width:100%;cursor:pointer;height: 10px; font-size:12px;text-align: right;color: red;">登录/注册</div>
		  	</c:when>
		  	<c:otherwise>
		  	<p style="color:red"></p>
		  	<div onclick="showmengceng()" style="width:100%;cursor:pointer;height: 10px; font-size:12px;text-align: right;color: red;">欢迎！${user.getUser_name() }</div>
		  	</c:otherwise>
		  </c:choose>
			<!--导航区-->
			<div class="nav_li">
				<ul>
					<li>
						<a href="nav.jsp" href="nav.jsp">首页</a>
					</li>
					<li>
						<a onclick="about()" href="javascript:;">关于我们</a>
					</li>
					<li>
						<a onclick="zuopin()" href="javascript:;">成功案例</a>
					</li>
					<li>
						<a href="nav.jsp"><img src="img/marrymelogo.png" style="height: 100%;"></a>
					</li>
					<li>
						<a onclick="video()" href="javascript:;">视频展示</a>
					</li>
					<li>
						<a href="javascript:;">联系方式</a>
					</li>
					<li>
						<a href="http://weibo.com/5285139683/profile?rightmod=1&wvr=6&mod=personinfo&is_all=1">官方微博</a>
					</li>
				</ul>
			</div>
		</div>
		<!--加载内容区-->
		<div class="main" style="position: absolute; z-index: 1; height: 100%; width: 100%;"></div>
		<!--页脚-->
		<div class="bottom">
			<span>版权所有&copy;2017-06-10 & 支持浏览器 chrom 分辨率 1366x768</span>
		</div>
		<!--加载登录注册区块-->		
        <div id="loadloginmodel" style="position: fixed; width: 100%;height: 100%; z-index: 9999; display: none;">
		</div>
		<!-- 退出登录的模态框 -->
		<div class="show" id="show">
			<div class="mengceng" id="mengceng"></div>
			<div class="loginout" id="loginout">
				<span>您确定退出吗？退出之后，您将重新登录</span>
				<button onclick="loginout()" class="butt1">确定</button>
				<button onclick="quxiao()" class="butt2">取消</button>
			</div>
		</div>
		<script>
		//退出登录 中显示确定模态框 
		function showmengceng() {
			var showObj = document.getElementById("show");
			showObj.style.display = "block";
		}
		//进入退出登录处理页面
		function loginout() {
			window.location.href = "${pageContext.request.contextPath}/user/UserServlet?method=userLoginOut";
		}
		function quxiao(){
			var showObj = document.getElementById("show");
			showObj.style.display = "none";
		}
			//加载登录注册页面
			function loadlogin() {
				$("#loadloginmodel").show().stop();
				$("#loadloginmodel").load("login2.html");
			}
			//加载首页
			$(".main").load("main.html");
			//成功案例的点击事件
			function zuopin() {
				$(".main").load("zuopin.html");
			}
			//关于我们
			function about(){
				$(".main").load("about.html");
			}
			//视频展示
			function video() {
				$(".main").load("Video.html");
			}
		</script>
	</body>
</html>