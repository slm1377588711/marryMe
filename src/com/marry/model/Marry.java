package com.marry.model;

public class Marry {
	private Integer Id; //商品Id
	private String name;	//商品名称
	private String price;//商品价格
	private String info; //商品信息
	private String type;//商品类型
	private String img; //商品图片
	private String video; //展示视频
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public Marry(Integer id, String name, String price, String info,
			String type, String img, String video) {
		super();
		Id = id;
		this.name = name;
		this.price = price;
		this.info = info;
		this.type = type;
		this.img = img;
		this.video = video;
	}
	
	public Marry(String name, String price, String info, String type,
			String img, String video) {
		super();
		this.name = name;
		this.price = price;
		this.info = info;
		this.type = type;
		this.img = img;
		this.video = video;
	}
	public Marry() {
		super();
		// TODO Auto-generated constructor stub
	}
}
