<%@page import="com.marry.service.marryService"%>
<%@ page language="java" import="java.util.*,com.marry.model.*,com.marry.service.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>商品列表</title>
		<style>
		table{
			margin:0 auto;
			width:100%;
			min-width:800px;
			border:1px solid #fff;
			border-collapse:collapse; 
		}
		tr{
			text-align:center;
			height:35px;
		}
		tr:first-child{
			background:#d8bfd8;
		}
		td{
			border:1px solid #fff;
			font-size:16px;
		}
		td a{
			cursor: pointer;
		}
		button{
			border:0px;
			width:150px;
			height:40px;
			background:red;
			cursor: pointer;
		}
		.page{
			width:800px;
		}
		.search{
			height:40px;
			}
		.search	#search-from{
			width:800px;
			line-height:40px;
		}
		.search	#search-from input{
			height:20px;
		}
		.search	#search-from a{
			display:inline-block;
			width:50px;
			height:24px;
			border:1px solid;
			cursor:pointer;
			text-align: center;
			text-decoration: none;
			line-height: 24px;
			background:#556B2F;
			color:#fff;
		}
		#page a{
			display:inline-block;
			width:38px;
			height:20px;
			text-align:center;
			line-height:20px;
			border:1px solid #ccc;
			cursor:pointer;
		}
	#page a:hover{
		color:#fff;
		background:red;
	}
	</style>
 </head>
 <body>
		<button onclick="addMarry()" href="javascript:;" >添加商品</button>
		<button onclick="delbatch()" href="javascript:;" >批量删除</button>
		<div class="search">
		<form id="search-from">
			商品类型：<input type="text" value="${params.type}" name="type" > 
			价格区间：<input type="text" value="${params.start}" name="start">到<input type="text" value="${params.end }" name="end">
			<a onclick="doSearch()">搜索</a>
		</form>
		</div>
	<table>
		<tr>
			<td><input type="checkbox" name="all" id="allm"/></td>
			<td>商品名称</td>
			<td>商品价格</td>
			<td>商品信息</td>
			<td>商品类型</td>
			<td>图片展示名称</td>
			<td>视频展示 </td>
			<td>操作</td>
		</tr>
		  
		 <c:forEach items="${page.list }" var="marry">
			 <tr>
				<td><input type="checkbox" name="marryId" value="${marry.getId()}" /></td>
				<td>${marry.getName()}</td>
				<td>${marry.getPrice()}</td>
				<td>${marry.getInfo()}</td>
				<td>${marry.getType()}</td>
				<td>${marry.getImg()}</td>
				<td>${marry.getVideo()}</td>
				<td><a onclick="update(${marry.getId()})">修改</a>
				<a onclick="delUser(${marry.getId()})">删除</a></td>
			</tr>
		 </c:forEach> 
		  
	</table>
	<div class="page" id="page">
		共${page.totalPage }页,当前${page.currentPage }/${page.totalPage }页,
		每页显示<select name="pageSize" onchange="goPage(1,this.value)">
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="15">15</option>
			<option value="20">20</option>
		</select>条
		<c:if test="${page.hasPrePage}">
			<a href="javascript:;" onclick="goPage(1,${page.pageSize})">首页</a>
		</c:if>
		<c:if test="${!page.hasPrePage}">
			首页
		</c:if>
		<c:if test="${page.hasPrePage}">
			<a href="javascript:;" onclick="goPage(${page.currentPage -1},${page.pageSize})">上一页</a>
		</c:if>
		<c:if test="${!page.hasPrePage}">
			上一页
		</c:if>
		<c:if test="${page.hasNextPage}">
			<a href="javascript:;" onclick="goPage(${page.currentPage +1},${page.pageSize})">下一页</a>
		</c:if>
		<c:if test="${!page.hasNextPage}">
			下一页
		</c:if>
		<c:if test="${page.hasNextPage}">
			<a href="javascript:;" onclick="goPage(${page.totalPage},${page.pageSize})">尾页</a>
		</c:if>
		<c:if test="${!page.hasNextPage}">
			尾页
		</c:if>
		跳转到第<input type="text" name="pageNum" maxlength="3" style="width:40px">页
	</div>
	
	<script type="text/javascript">
	var page = ${page.currentPage};
	var total = ${page.totalPage};
	function showPage(page, total) {
		var str= '<a onclick="goPage(page,${page.pageSize})">' + page + '</a>';
		for(var i = 1; i <= 3; i++) {
			if(page - i > 1) {
				str = '<a onclick="goPage('+(page - i)+',${page.pageSize})">' + (page - i) + '</a>' + str;
			}
			if(page + i < total) {
				str = str + '' + '<a onclick="goPage('+(page + i)+',${page.pageSize})">'+(page + i)+'</a>';
			}
		}
		if(page - 4 > 1) {
			str = '...' + str;
		}
		if(page > 1) {
			str = '<a onclick="goPage(1,${page.pageSize})">' + 1 +'</a>'+ str;
		}
		if(page + 4 < total) {
			str = str + '...';
		}
		if(page < total) {
			str = str + '' +'<a onclick="goPage(total,${page.pageSize})">'+ total+'</a>';
		}

		return str;
	}
	var ret = showPage(page,total);
	$$("#page").html($$("#page").html()+ret);
	/* 搜索点击事件 */
	function doSearch(){
		var pageSize = ${page.pageSize};
		goPage(1,pageSize);
	}

	/* 跳转页码绑定键盘按下事件 */
	document.getElementsByName("pageNum")[0].onkeydown=function(event){
		var e = window.event||e;
		if(e.keyCode==13){
			var pageSize = ${page.pageSize};
			goPage(this.value,pageSize);
		}
	}
	/* 跳转页码数据回显 */
	document.getElementsByName("pageNum")[0].value=${page.currentPage};
	
	/* 设置每页显示记录数据回显 */
	//获取记录条数
	var pageSize = ${page.pageSize};
	//获取下拉框
	var selectPageSize=document.getElementsByName("pageSize")[0];
	//获取下拉框选项
	var options = selectPageSize.getElementsByTagName("option");
	for(var i=0;i<options.length;i++){
		//下拉框值等于显示的条数，就添加selected属性
		if(options[i].value==pageSize){
			options[i].setAttribute("selected",true);
		}
	}
	/* 分页工具条跳转方法 */
	function goPage(currentPage,pageSize){
		//模糊查询参数
		var searchFrom = document.getElementById("search-from");
		var params = {
			type:searchFrom.type.value,
			price_start:searchFrom.start.value,
			price_end:searchFrom.end.value
		}
		/* 商品列表 */
		var marryList = document.getElementById("Marrylist");
		var url="${pageContext.request.contextPath }/marry/MarryServlet?method=marrylist&currentPage="+currentPage+"&pageSize="+pageSize;
		if(params){
			url+="&type="+params.type+"&price_start="+params.price_start+"&price_end="+params.price_end;
		}
		marryList.setAttribute("data-url",url);
		//触发 左侧修改用户的单击事件
		marryList.onclick();
	}
	
	/*触发添加用户*/
	function addMarry(){
		document.getElementById("addMarry").onclick();
	}
	
	
	/* 全选效果实现 */
	document.getElementById("allm").onclick = function(){
		var objs = document.getElementsByName("Id");
		for(var i=0; i<objs.length;i++){
			objs[i].checked = this.checked;
		}
	}

	/* 批量删除 */
	function delbatch(){
		//判断是否有选中的记录
		var objs = document.getElementsByName("marryId");
		var count = 0;
		var ids = "";
		//获取到选中复选框对象
		for(var i=0; i<objs.length;i++){
			if(objs[i].checked){
				count++;
				ids += objs[i].value +",";
			}
		}
		if(count > 0){
			if(window.confirm("您确定要删除选中的记录吗？")){
				//去除最后一个逗号
				ids = ids.substring(0,ids.length -1);
				//去后台删除
				window.location.href="${pageContext.request.contextPath}/marry/MarryServlet?method=delbatch&ids="+ids;
			}
		}else{
			alert("请至少选中一条记录操作！");
		}
		
	}
	
		//删除点击事件
		function delUser(Id){
			if(window.confirm("您确定要删除该记录吗？")){
				window.location.href="${pageContext.request.contextPath }/marry/MarryServlet?method=delMarry&Id="+Id;
			}
		}
		//修改点击事件
		function update(Id){
			var updateMarry = document.getElementById("updateMarry");
			updateMarry.setAttribute("data-url","${pageContext.request.contextPath }/marry/MarryServlet?method=updateMarrySelect&Id="+Id);
			//触发 左侧修改商品的单击事件
			updateMarry.onclick();
		}
	</script>
	</body>
</html>
