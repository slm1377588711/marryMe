package com.marry.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.marry.model.Marry;
import com.marry.model.User;
import com.marry.util.Page;

public interface marryDao {
	//添加商品
	public void addMarry(Marry marry)throws SQLException;
	//删除商品
	public void delMarry(Integer Id)throws SQLException;
	//批量删除
	public void delBachMarry(String id) throws SQLException;		
	//修改
	public void UpdateMarry(Marry marry) throws SQLException;	
	//根据商品ID查询商品
	public Marry selectMarryById(Integer id) throws SQLException;	
	//根据商品类型查询所有
	public List<Marry> selectMarry(String type) throws SQLException;	
	//计算总记录数Page page, Map<String, Object> params
	public int getMarryCount(Map<String,Object>params) throws SQLException;
	//分页模糊查询
	public List<Marry> getMarryByPageLike(Page page, Map<String, Object> params)throws SQLException;
}
