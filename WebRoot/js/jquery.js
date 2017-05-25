
var $ = function(){
	return new MyJQuery();
}

function MyJQuery(){
	this.elements = []; //数组
}
//替换文本
MyJQuery.prototype.text = function(text){
	for(var i=0;i<this.elements.length; i++){
		this.elements[i].innerText = text;
	}
	return this;
}
//更改属性
MyJQuery.prototype.attr = function(attrName,value){
	for(var i=0;i<this.elements.length; i++){
		this.elements[i].setAttribute(attrName,value);
	}
	return this;
}
//为元素设置最小高度
MyJQuery.prototype.minHeight = function(height){
	for(var i=0;i<this.elements.length; i++){
		this.elements[i].style['min-height'] = height+"px";
	}
	return this;
}
//为元素设置最小宽度
MyJQuery.prototype.minWidth = function(width){
	for(var i=0;i<this.elements.length; i++){
		this.elements[i].style['min-width'] = width+"px";
	}
	return this;
}


//根据id获取元素对象
MyJQuery.prototype.getId = function(id){
	this.elements.push(document.getElementById(id));
	return this;
}
//根据class名获取元素对象：集合
MyJQuery.prototype.getClassName = function(className){
	var objs = document.getElementsByClassName(className);
	for(var i=0; i<objs.length;i++){
		this.elements.push(objs[i]);
	}
	return this;
}

//根据class名下的标签名获取元素对象：集合
MyJQuery.prototype.getClassNameAndTagName = function(className,tagName){
	var objs = document.getElementsByClassName(className);
	for(var i=0; i<objs.length;i++){
		var tagObjs = objs[i].getElementsByTagName(tagName);
		for(var j=0;j<tagObjs.length; j++){
			this.elements.push(tagObjs[j]);
		}
	}
	return this;
}

//移除类名，置空
MyJQuery.prototype.delClass = function(className){
	for(var i=0;i<this.elements.length; i++){
		this.elements[i].className = "";
	}
	return this;
}

//鼠标移入事件
MyJQuery.prototype.mouseover = function(fn){
	for(var i=0;i<this.elements.length; i++){
		this.elements[i].onmouseover = fn;
	}
	return this;
}
//鼠标移出事件
MyJQuery.prototype.mouseout = function(fn){
	for(var i=0;i<this.elements.length; i++){
		this.elements[i].onmouseout = fn;
	}
	return this;
}
//鼠标点击事件
MyJQuery.prototype.click = function(fn){
	for(var i=0;i<this.elements.length; i++){
		this.elements[i].onclick = fn;
	}
	return this;
}


//显示
MyJQuery.prototype.show = function(){
	for(var i=0;i<this.elements.length; i++){
		this.elements[i].style.display = "block";
	}
	return this;
}
//隐藏
MyJQuery.prototype.hide = function(){
	for(var i=0;i<this.elements.length; i++){
		this.elements[i].style.display = "none";
	}
	return this;
}

//隐藏
MyJQuery.prototype.clas = function(){
	for(var i=0;i<this.elements.length; i++){
		this.elements[i].style.display = "none";
	}
	return this;
}

