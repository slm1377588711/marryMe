
var marryme = {
	//系统初始化
	init:function(){
		marryme.initTop();
		marryme.initLeft();
		marryme.initRight();
	},
	//初始化顶部导航栏
	initTop:function(){
		//为login-info绑定鼠标移入事件
		$().getId("login-info").mouseover(function(){
			//显示下拉选
			$().getId("panel").show();
			//显示向上箭头
			$().getId("carset").elements[0].className = "fa fa-caret-up";
		});
		$().getId("login-info").mouseout(function(){
			//隐藏下拉选
			$().getId("panel").hide();
			//显示向下箭头
			$().getId("carset").elements[0].className = "fa fa-caret-down";
		});	
	},
	//初始化右侧内容区高度/宽度
	initRight:function(){
		marryme.initRange();
		window.onresize = function(){
			marryme.initRange();
		}
	},
	//初始化右侧内容区高度/宽度
	initRange:function(){
		//为右侧内容区顶部设置最小高度
		var minHeight = document.documentElement.clientHeight - 60 - 60 -40;
		$().getId("marryme-right-top").minHeight(minHeight);
		/*为右侧内容区顶部设置最小宽度*/
		var minWidth = document.documentElement.clientWidth - 210;
		$().getId("marryme-right-top").minWidth(minWidth);
	},
	//初始化左侧导航
	initLeft:function(){
		$().getClassNameAndTagName("nav-item","li").click(function(){
			//移出所有样式
			$().getClassNameAndTagName("nav-item-list","li").delClass();
			this.className = "active";
			//页面切换
			var pageurl =this.getAttribute("data-url");
			$$("#marryme-right-content").load(pageurl);
			//改变导航title
			var text = this.getElementsByTagName("a")[0].innerText;
			$().getId("title-text").text(text);
			//改变图标演示
			$().getId("icon").attr("class","fa fa-info-circle");
		});
	}
	
}