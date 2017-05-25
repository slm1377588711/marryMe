<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>显示信息</title>
		<style>
			/*最外层div*/
			.showInfo-content{
				position: relative;
				width: 100%;
				height: 100%;
			}
			/*显示简要信息区域*/
			.showInfo-content .showInfo-left{
				position: absolute;
				top:110px;
				float: left;
				width: 100%;
				height: auto;
			}
			.showInfo-content .showInfo-left .left-img{
				position: absolute;
				left: 148px;
				width: 400px;
				height: 400px;
				overflow: hidden;
			}
			/*显示简要信息区域下的图片*/
			.showInfo-content .showInfo-left .left-img img{
				/*position: absolute;
				left: 148px;*/
				/*width: 400px;*/
				/*height:400px;*/
			}
			/*信息*/
			.showInfo-content .showInfo-left .left-info{
				position: absolute;
				left: 600px;
				font-family: "微软雅黑";
				font-size: 24px;
			}
			.showInfo-content .showInfo-left .left-info span{
				display: inline-block;
				width: 120px;
			}
			.showInfo-content .showInfo-left .left-info p{
				display: inline-block;
				width: 480px;
			}
			.showInfo-content .showInfo-left .left-info .left-info-price{
				display: inline-block;
				width:140px;
				height: 30px;
				background: red;
			}
			/*查看全景区域*/
			.showInfo-content .showInfo-right{
				position: relative;
				width: 1000px;
				top:516px;
				left: 400px;
			}
			.showInfo-content .showInfo-right img{
				width: 700px;
				height: auto;
			}
		</style>
	</head>
	<body>
		<div class="showInfo-content">
			<div class="showInfo-left">
				<div class="left-img">
					<img src="img/${getmarryById.getImg() }" />
				</div>
				<div class="left-info">
					<table >
					<tr height="50px">
						<td >
							<span >名称：</span>
						</td>
						<td>
							<p>${getmarryById.getName() }</p>
						</td>
					</tr>
					<tr height="50px">
						<td>
							<span>价格：</span>
						</td>
						<td>
							<p class="left-info-price">￥${getmarryById.getPrice() }</p>
						</td>
					</tr>
					<tr height="50px">
						<td>
							<span >信息：</span>
						</td>
						<td>
							<p style="font-size: 16px;">${getmarryById.getInfo() }</p>
						</td>
					</tr>
				</table>
			</div>
			</div>
			<div class="showInfo-right">
				<img src="img/${getmarryById.getVideo() }" />
			</div>
		</div>
	</body>
</html>
