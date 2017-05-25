<%@ page language="java" import="java.util.*,com.marry.model.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册</title>
		<link rel="stylesheet" type="text/css" href="css/zhuce.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/plugin/My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
		  <div id="wrapper">
	<section>
	<form class="form" onsubmit="return check()" method="post" action="${pageContext.request.contextPath}/user/UserServlet?method=Userzhuce" name = "myform">	
		<p>
			<label for="user_name">昵称</label>
			<input type="text" id="user_name" onchange="checkUsername()" onfocus="checkUserNname()" autofocus name="user_name" required = "required"/>
			<span id="usernameInfo" class="info"></span>
		</p>
			<p>
			<label for="user_password">密码</label>
			<input type="password" onfocus="checkUserPassword()" id="user_password" name="user_password"/>
			<span id="userPasswordInfo" class="info"></span>
		</p>
		<p>
			<label for="user_email">电子邮箱</label><br />
			<input type="email" onfocus="checkUserEmailInfo()" id="user_email" name="user_email" required = "required" />
			<span id="userEmailInfo" class="info"></span>
		</p>
		<p>
			<label for="user_phone">手机号码</label><br />
			<input type="telephone" onfocus="checkUserPhoneInfo()" id="user_phone" name="user_phone" required = "required"/>
			<span id="userPhoneInfo" class="info"></span>
		</p>
		<p>
			<label for="user_born">出生日期</label><br />
			<input id="user_born" class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true})" type="text" name="user_born"/>
		</p>
		<p>
		<input type="submit" value="确认添加" id="submit" name="submit" />
		</p>
	</form>
	</section>
</div>
<script type="text/javascript">
	//user_name框获取焦点显示“请输入用户名”
	function checkUserNname(){
		var userNameInfoObj = document.getElementById("usernameInfo");
		userNameInfoObj.style.color="green";
		userNameInfoObj.style['font-size']="15px";
		userNameInfoObj.innerHTML="请输入用户名！";
	}
	//user_password框获取焦点“请输入密码”
	function checkUserPassword(){
		var userpasswordInfoObj = document.getElementById("userPasswordInfo");
		userpasswordInfoObj.style.color="green";
		userpasswordInfoObj.style['font-size']="15px";
		userpasswordInfoObj.innerHTML="[a-Z 0-9 A-Z]";
	}
	//user_eamil 框获取焦点"请输入邮箱""
	function checkUserEmailInfo(){
		var userEmailInfoObj = document.getElementById("userEmailInfo")
		userEmailInfoObj.style.color="green";
		userEmailInfoObj.style['font-size']="15px";
		userEmailInfoObj.innerHTML="请输入邮箱！";	
	}
	//user_phone 框获取焦点"请输入有效手机号！"
	function checkUserPhoneInfo(){
		var userPhoneInfoObj = document.getElementById("userPhoneInfo");
		userPhoneInfoObj.style.color="green";
		userPhoneInfoObj.style['font-size']="15px";
		userPhoneInfoObj.innerHTML="请输入有效手机号！";	
	}
	/*表单验证操作  */
	function check(){
		//获取user_name用户名输入框对象
		var user_name = document.getElementById("user_name");
		//获取提示信息对象
		var userNameInfo = document.getElementById("usernameInfo");
		//获取user_name输入框的值
		var usernameval = user_name.value;
		
		//获取user_password密码输入框对象
		var user_password = document.getElementById("user_password");
		//获取密码提示信息对象
		var userPasswordInfo = document.getElementById("userPasswordInfo");
		//获取user_password密码值
		var userpasswordval = user_password.value;
		
		//获取user_email输入框对象
		var user_email = document.getElementById("user_email");
		//获取email提示信息对象
		var useremailInfo = document.getElementById("userEmailInfo");
		//获取user_email值
		var useremailval = user_email.value;
	
		//获取phone输入框对象
		var user_phone = document.getElementById("user_phone");
		//获取email提示信息对象
		var userphoneInfo = document.getElementById("userPhoneInfo");
		//获取email值
		var userphoneval = user_phone.value;
	
		//验证用户名
		if(usernameval==" "){
			userNameInfo.style.color="#f66";
			userNameInfo.style['font-size']="15px";
			userNameInfo.innerHTML="<i class='fa fa-close'></i>用户名不能为空！";
			return false;
		}else if(usernameval.length<5 || usernameval.length>10 ){
			userNameInfo.style.color="#f66";
			userNameInfo.style['font-size']="15px";
			userNameInfo.innerHTML="<i class='fa fa-close'></i>用户名长度在5到10之间";
			return false;
		}else{
			userNameInfo.style.color="green";
			userNameInfo.style['font-size']="15px";
			userNameInfo.innerHTML="<i class='fa fa-check'></i>";
			/*将焦点下移  */
			user_password.focus();
		}
		
		//验证密码
		if(userpasswordval==" "){
			userPasswordInfo.style.color="#f66";
			userPasswordInfo.style['font-size']="15px";
			userPasswordInfo.innerHTML="<i class='fa fa-close'></i>密码不能为空！";
			return false;
		}else if(usernameval.length<5 || usernameval.length>10 ){
			userPasswordInfo.style.color="#f66";
			userPasswordInfo.style['font-size']="15px";
			userPasswordInfo.innerHTML="<i class='fa fa-close'></i>密码长度在5到10之间";
			return false;
		}else{
			userPasswordInfo.style.color="green";
			userPasswordInfo.style['font-size']="15px";
			userPasswordInfo.innerHTML="<i class='fa fa-check'></i>";
			/*将焦点下移  */
			user_email.focus();
		}
		//验证邮箱
		if(useremailval==" "){
			useremailInfo.style.color="#f66";
			useremailInfo.style['font-size']="15px";
			useremailInfo.innerHTML="<i class='fa fa-close'></i>邮箱不能为空！";
			return false;
		}
		else{
			useremailInfo.style.color="green";
			useremailInfo.style['font-size']="15px";
			useremailInfo.innerHTML="<i class='fa fa-check'></i>";
			/*将焦点下移  */
			user_phone.focus();
		}
		//验证手机号
		if(userphoneval==" "){
			userphoneInfo.style.color="#f30";
			userphoneInfo.style['font-size']="15px";
			userphoneInfo.innerHTML="<i class='fa fa-close'></i>手机号不能为空！";
			return false;
		}else{
			userphoneInfo.style.color="green";
			userphoneInfo.style['font-size']="15px";
			userphoneInfo.innerHTML="<i class='fa fa-check'></i>";
		}
		
	}
	//异步ajax请求：原生js
	//AJAX异步校验用户名 :
		$("#user_name").blur(function(){
			var username=$("#user_name").val();
		if(username!=""){	
			$.ajax({
				url:"${pageContext.request.contextPath}/user/UserServlet?method=checkUserName",
				type:"get",
				data:"username="+username,
				success:function(resp){
					if(resp=="1"){
						$$("#usernameInfo").css(
								{"color":"green",	
									"font-size":"12px"	
								}	
							);
						$("#usernameInfo").html("<i class='fa fa-check'></i>用户名可以使用");
						$("input[type='submit']").css("cursor","pointer");
						$("input[type='submit']").attr("disabled",false);
					}else{
						$("#usernameInfo").css(
							{"color":"#f30",	
								"font-size":"12px"	
							}	
						);
						$("#usernameInfo").html("<i class='fa fa-close'></i>此用户名已被占用");
						$("input[type='submit']").css("cursor","not-allowed");
						$("input[type='submit']").attr("disabled",true);
					}
				}
			});
		}else{
			$("#usernameInfo").css(
					{"color":"#f30",	
						"font-size":"12px"	
					}	
				);
			$("#usernameInfo").html("<i class='fa fa-close'></i>用户名不能为空");
			$("input[type='submit']").css("cursor","not-allowed");
			$("input[type='submit']").attr("disabled",true);
		}
		});
</script>
	</body>
</html>
