package com.marry.model;

public class User {

	private int user_Id;
	private String user_name;
	private String user_password;
	private String user_email;
	private String user_phone;
	private String user_born;
	public int getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(int user_Id) {
		this.user_Id = user_Id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_born() {
		return user_born;
	}
	public void setUser_born(String user_born) {
		this.user_born = user_born;
	}
	public User(int user_Id, String user_name, String user_password,
			String user_email, String user_phone, String user_born) {
		super();
		this.user_Id = user_Id;
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_born = user_born;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String user_name, String user_password, String user_email,
			String user_phone, String user_born) {
		super();
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_born = user_born;
	}
	
	
	
	
	
}
