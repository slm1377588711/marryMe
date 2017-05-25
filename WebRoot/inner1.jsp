<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>内容展示</title>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-boxSlider.js"></script>
<link rel="stylesheet" href="css/inner.css" />
</head>

<body>
<div class="wrapinner">
	<div class="box-slider" id="dowebok">
		<a href="javascript:" class="box-slider-seta-left"></a>
		<div class="box-slider-content">
			<div class="box-slider-move">
				<div id="append" class="item first"><span><img alt="图片" src="${pageContext.request.contextPath }/img/touxiang.jpg"></span></div>
				 <div class="item last-item"><span><img alt="图片" src="${pageContext.request.contextPath }/img/touxiang.jpg"></span></div>
			</div>
		</div>
		<a href="javascript:" class="box-slider-seta-right"></a>
	</div>
</div>
 

<script>
	$(function() {
		$("#dowebok").boxSlider({
			orientation: 'horizontal',
			speed: 3
		});
	});
	
	var url = "${pageContext.request.contextPath }/marry/MarryServlet?method=selectMarry";
	$.get(url,{type:"婚纱照"},function(resp){
		var data = $.parseJSON(resp);
		console.log("根据类型查询回显数据======"+data);
		$.each(data,function(index,ele) {
			console.log("回显图片"+ele.img);
			var div = "";
			div += '<div class="item">';
			div += ' <span><img onclick="showInfo('+ele.id+')" src='+'"'+"${pageContext.request.contextPath }/img/"+ele.img+'"'+' /></span/>';
			div += '</div>';
			$(".box-slider-move").append(div);
		})
	});
	function showInfo(id){
		var url = "${pageContext.request.contextPath }/marry/MarryServlet?method=selectMarryById"
		$.get(url,"id="+id,function(resp){
			var data = $.parseJSON(resp);
			window.location.href="nav1.jsp";
			console.log(data);
		});
	}
</script>
</body>
</html>