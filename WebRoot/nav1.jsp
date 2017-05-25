<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>详细信息导航</title>
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src='js/style.js'></script>
		<link rel="stylesheet" href="css/style1.css">
	</head>
	<body>
		<div class="nav">
			<!--导航区-->
			<div class="nav_li">
				<ul>
					<li>
						<a href="nav.jsp">首页</a>
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
		<div class="main" style="position: absolute; z-index: 1; height: 100%; width: 100%;"></div>
		<!--页脚-->
		<div class="bottom">
			<span>版权所有&copy;2017-06-10 & 支持浏览器 chrom 分辨率 1366x768</span>
		</div>
	</body>
	<script>
		$(".main").load("showInfo.jsp");
		//成功案例的点击事件
			function zuopin() {
				$(".main").load("zuopin.html");
			}
			//视频展示
			function video() {
				$(".main").load("Video.html");
			}
			//关于我们
			function about(){
				$(".main").load("about.html");
			}
	</script>
</html>
