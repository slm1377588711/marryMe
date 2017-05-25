package com.marry.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.marry.model.User;
import com.marry.util.Page;

public interface userDao {
	//检查用户登录
	public User CheckUser(String user_name,String user_password) throws SQLException ;
	public int AddUser(User user) throws SQLException;  //增加用户，返回影响行数
	public int delUser(int id) throws SQLException;		//根据id删除用户，返回影响行数
	public int delBachUser(String id) throws SQLException;		//批量根据id删除用户，返回影响行数
	public int UpdateUser(User user) throws SQLException;	//根据id修改用户,返回影响行数
	public User selectUserById(int id) throws SQLException;	//根据id查询返回用户对象
	public List<User> selectUser() throws SQLException;		//查询所有，返回用户对象	
	public List<User> getUserByPage(Page page) throws SQLException; //分页	
	public int getUserCount(Map<String,Object>params) throws SQLException;//计算总记录数Page page, Map<String, Object> params
	public List<User> getUserByPageLike(Page page, Map<String, Object> params)throws SQLException;//分页模糊查询
	public User selectUserName(String userName) throws SQLException;//根据名字查询
	public void UpdatePassword(String password,Integer User_Id) throws SQLException; //修改密码
}
