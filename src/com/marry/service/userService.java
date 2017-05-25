package com.marry.service;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import com.marry.dao.userDao;
import com.marry.model.User;
import com.marry.util.Dbutil;
import com.marry.util.Page;

public class userService implements userDao{

	//检查用户登录
	@Override
	public User CheckUser(String user_name, String user_password) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql = "select user_Id , user_name , user_password , user_email , user_phone , user_born from t_user where user_name=? and user_password=?";
		return qr.query(sql, new BeanHandler<User>(User.class), user_name,user_password);
	}
	//添加用户
	@Override
	public int AddUser(User user) throws SQLException {
		// TODO Auto-generated method stub
		int i=0;
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql = "insert into t_user (user_name , user_password , user_email , user_phone , user_born) values(?  ,? , ? , ? , ?)";
		Object params[]={user.getUser_name(),user.getUser_password(), user.getUser_email(),user.getUser_phone(),user.getUser_born()};
		i=qr.update(sql, params);	
		return i;
	}
	
	
	

	//删除用户
	@Override
	public int delUser(int id) throws SQLException {
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		int i = 0;
		String sql = "delete from t_user where user_Id = ?";
		i=qr.update(sql, id);
		return i;
	}

	//修改用户
	@Override
	public int UpdateUser(User user) throws SQLException {
		// TODO Auto-generated method stub
		int i = 0;
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql = "update t_user set user_name = ? , user_password = ?, user_email = ? , user_phone = ? , user_born = ? where user_Id = ?";
		Object params[] = {user.getUser_name(),user.getUser_password(),user.getUser_email(),user.getUser_phone(),user.getUser_born(),user.getUser_Id()};
		i=qr.update(sql, params);
		return i;
	}

	//根据ID查询
	@Override
	public User selectUserById(int id) throws SQLException {
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql = "select user_Id , user_name , user_password , user_email , user_phone , user_born from t_user where user_Id = ?";
		return qr.query(sql, new BeanHandler<User>(User.class), id);
	}

	//查看全部用户
	@Override
	public List<User> selectUser() throws SQLException {
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql = "select user_Id,user_name,user_password,user_email,user_phone,user_born from t_user where user_name != 'admin' order by user_Id desc";
		return qr.query(sql, new BeanListHandler<User>(User.class));
	}
	//根据用户名检查是否重复
	@Override
	public User selectUserName(String user_name) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql = "select user_Id , user_name , user_password from t_user where user_name=?";
		System.out.println(sql);
		System.out.println(user_name);
		return qr.query(sql, new BeanHandler<User>(User.class), user_name);
	}
	//批量删除用户
	@Override
	public int delBachUser(String id) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		int i = 0;
		String sql = "delete from t_user where user_Id in ("+id+")";
		i=qr.update(sql);
		return i;
	}
	
	
	//分页
	@Override
	public List<User> getUserByPage(Page page) throws SQLException{
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql="select top "+page.getPageSize()+" o.* from(select ROW_NUMBER() over(order by user_Id desc) as Row#,* from(select user_Id,user_name,user_password,user_email,user_phone,user_born from t_user)as oo)as o where Row#>"+page.getBeginIndex();
		return  qr.query(sql, new BeanListHandler<User>(User.class));
	}
	//分页模糊查询
	@Override
	public List<User> getUserByPageLike(Page page,Map<String,Object>params) throws SQLException{
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql="select top "+page.getPageSize()+" o.* from(select ROW_NUMBER() over(order by user_Id) as Row#,* from(select user_Id,user_name,user_password,user_email,user_phone,user_born from t_user where user_name != 'admin'";
		//拼接sql
				sql = JoinSql(params, sql);
				sql+=" )as oo)as o where Row#>"+page.getBeginIndex();
				
		return  qr.query(sql, new BeanListHandler<User>(User.class));
	}
	//封装的拼接sql语句
	public String JoinSql(Map<String, Object> params, String sql) {
		if(params.get("username") != null && !"".equals(params.get("username"))){
			//拼接用户名
			sql +=" and user_name like '%"+params.get("username")+"%'";
		}
		if(params.get("start") != null && !"".equals(params.get("start"))){
			//拼接生日
			sql +=" and user_born >=  '"+params.get("start")+"'";
		}
		if(params.get("end") != null && !"".equals(params.get("end"))){
			//拼接生日
			sql +=" and  user_born <=  '"+params.get("end")+"'";
		}
		System.out.println(sql);
		return sql;
	}
	//计算总记录数
	@Override
	public int getUserCount(Map<String,Object>params) throws SQLException {
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql = "select count(user_Id) from t_user where user_name != 'admin'";
		sql = JoinSql(params, sql);
		Integer count =  qr.query(sql, new ScalarHandler<Integer>());
		return (int)count;
	}
	//修改密码
	@Override
	public void UpdatePassword(String password,Integer User_Id) throws SQLException {
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql = "update t_user set user_password = ? where user_Id = ?";
		qr.update(sql,password,User_Id);
	}
}
