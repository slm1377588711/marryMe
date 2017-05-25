<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页面</title>
<!--引入外部样式-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/houtailogin.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/font/font-awesome-4.7.0/css/font-awesome.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
</head>
<body class="login_body">
	<div class="login_container">
		<div class="login_title">
			<div class="login_title_center">
				<img src="${pageContext.request.contextPath}/img/marrymelogo.png"
					alt="" /> <span>后台登录管理</span>
			</div>
		</div>
		<div class="login_content">
			<div class="login_form">
				<form id="login_form"
					action="${pageContext.request.contextPath}/user/UserServlet?method=houtailogin"
					onsubmit="return loginbut()" method="post">
					<p class="form-group">
						<label for="adminname">用户名</label> <input id="adminname"
							type="text" value="${Admin.getUser_name()}" name="adminname" />
					</p>
					<p class="form-group">
						<label for="adminpwd">密 码</label> <input id="adminpwd"
							type="password" onblur="loginAjax()" name="adminpwd" />
					</p>
					<p class="form-group">
						<label for="yanzhengma">输入验证码</label> <input onblur="codeAjax()"
							class="code" type="text" id="code" name="code" maxlength="4" />
					<!-- 验证码是否正确的信息 -->
					<div class="codemsg"
						style="position:relative ;top:-40px;left:178px; display:inline-block;width:10px;height:10px;">
						<span id="codemsg"></span>
					</div>
					<!-- 验证码图片 -->
					<img class="code_img"
						style="position:relative;top:-42px;left:174px"
						onclick="changeCode(this)"
						src="${pageContext.request.contextPath }/verifyCode.jpg" />

					<div class="error">
						<span id="error"> ${errorInfo} </span>
					</div>
					<p class="form-group">
						<!-- <a onclick="onSubmintfrom()" class="login_btn" href="javascript:;">检查</a> -->
						<!-- <button onclick="onSubmintfrom()" class="login_btn" style="margin-top:-72px">登录</button> -->
						  <input
							type="button" onclick="onSubmintfrom()" class="login_btn" style="margin-top:-72px"
							value="登录" /> <input class="reg_btn" style="margin-top:-72px"
							type="button" value="注册" />
					</p>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	//提交按钮事件
	function onSubmintfrom(){
		if(loginAjax()&&codeAjax()){
			window.location.href = "${pageContext.request.contextPath }/page/houtaiindex.jsp";
		}
	}
	//检查用户名和密码
		function loginAjax() {
			var flag = true;
			var formArgs = $("#login_form").serialize();
			$
					.ajax({
						url : "${pageContext.request.contextPath }/admin/AdminServlet?method=houtailogin",
						type : "post",
						data : formArgs,
						async:false,
						success : function(resp) {
							var objlogn = $.parseJSON(resp);
							if (objlogn.success) {
								//如果用户名正确则判断验证码
								flag = true;
							} else {
								//给出错误提示
								$("#error").css("color", "#f30");
								$("#error").html(objlogn.msg);
								flag = false;
							}
						}
					});
			return flag;
		}
		//验证码请求
		function codeAjax() {
			var flag = true;
			var code = $("#code");
			$
					.ajax({
						url : "${pageContext.request.contextPath }/admin/AdminServlet?method=Code",
						type : "get",
						data : code,
						async:false,
						success : function(resp) {
							obj = $.parseJSON(resp);//将json数据转换为原生js数据
							if (obj.success) {
								$("#codemsg").css({
									"color" : "green",
									"font-size" : "14px",
									"font-weight" : "bold"
								});
								$("#codemsg").html(obj.msg);
								flag = true;
							} else {
								//给出错误提示
								$("#codemsg").css({
									"color" : "#f30",
									"font-size" : "14px",
									"font-weight" : "bold"
								});
								$("#codemsg").html(obj.msg);
								flag = false;
							}
						}
					});
			return flag;
		}

		/* 改变验证码 */
		function changeCode(_this) {
			//图片地址是否刷新：保证每次单击图片地址都不一样，不然浏览器就会使用缓存，不会发送新的请求
			_this.src="${pageContext.request.contextPath}/verifyCode.jpg?time="+new Date().getTime();
		}
		function loginbut() {
			var adminnameObj = document.getElementById("adminname");
			var adminpwdObj = document.getElementById("adminpwd");//获取密码input对象
			var adminnameVal = adminnameObj.value;//获取用户input对象值
			var adminpwdVal = adminpwdObj.value;//获取密码input对象值
			var admincode = document.getElementById("code");//获取用户输入验证码对象
			var admincodeVal = admincode.value; //获取用户输入的验证码值
			var errorObj = document.getElementById("error");
			//如果用户名为空/6~12
			if (adminnameVal == '') {
				//给出错误提示
				errorObj.innerHTML = "<i class='fa fa-exclamation'></i> 用户名不能为空！";
				//获取焦点
				adminnameObj.focus();
				return false;
			}
			//如果密码为空/6~12
			if (adminpwdVal == '') {
				//给出错误提示
				errorObj.innerHTML = "<i class='fa fa-exclamation'></i> 密码不能为空！";
				//获取焦点
				adminpwdObj.focus();
				return false;
			}
			if (admincodeVal == '') {
				//给出错误提示
				errorObj.innerHTML = "<i class='fa fa-exclamation'></i> 验证码不能为空！";
				//获取焦点
				admincode.focus();
				return false;
			}
			//验证通过
			errorObj.style.color = "blue";
			errorObj.innerHTML = "<i class='fa fa-exclamation'></i> 登录中...";
			return true;
		}
	</script>
</body>
</html>
