package com.marry.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.marry.dao.marryDao;
import com.marry.model.Marry;
import com.marry.model.User;
import com.marry.util.Dbutil;
import com.marry.util.Page;

public class marryService implements marryDao{

	@Override
	public void addMarry(Marry marry) throws SQLException {
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql = "insert into t_marry (name , price , info , type , img , video) values ( ? , ? , ? , ? , ? , ?)";
		Object params[]={marry.getName(),marry.getPrice(),marry.getInfo(),marry.getType(),marry.getImg(),marry.getVideo()};
		qr.update(sql, params);	
	}
	@Override
	public void delMarry(Integer Id) throws SQLException {
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql = "delete from t_marry where Id = ?";
		qr.update(sql, Id);
	}

	@Override
	public void delBachMarry(String Id) throws SQLException {
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql = "delete from t_marry where Id in ("+Id+")";
		qr.update(sql);

	}

	@Override
	public void UpdateMarry(Marry marry) throws SQLException {
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql = "update t_marry set name = ? , price = ? , info = ? , type = ? , img = ? , video = ? where Id = ?";
		Object params[] = {marry.getName(),marry.getPrice(),marry.getInfo(),marry.getType(),marry.getImg(),marry.getVideo(),marry.getId()};
		qr.update(sql, params);
		
	}

	@Override
	public Marry selectMarryById(Integer id) throws SQLException {
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql = "select Id,name,price,info,type,img,video from t_marry where Id = ?";
		return qr.query(sql, new BeanHandler<Marry>(Marry.class),id);
	}

	@Override
	public List<Marry> selectMarry(String type) throws SQLException {
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql = "select Id,name,price,info,type,img,video from t_marry where type = ?";
		return qr.query(sql, new BeanListHandler<Marry>(Marry.class),type);

	}

	@Override
	public int getMarryCount(Map<String, Object> params) throws SQLException {
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql = "select count(Id) from t_marry where 1=1";
		sql = JoinSql(params, sql);
		Integer count =  qr.query(sql, new ScalarHandler<Integer>());
		return (int)count;
	}

	@Override
	public List<Marry> getMarryByPageLike(Page page, Map<String, Object> params)
			throws SQLException {
		QueryRunner qr = new QueryRunner(Dbutil.getDataSource());
		String sql="select top "+page.getPageSize()+" o.* from(select ROW_NUMBER() over(order by Id) as Row#,* from(select Id,name,price,info,type,img,video from t_marry where 1=1";
		//拼接sql
				sql = JoinSql(params, sql);
				sql+=" )as oo)as o where Row#>"+page.getBeginIndex();
		return  qr.query(sql, new BeanListHandler<Marry>(Marry.class));
	}

		//封装的拼接sql语句
		public String JoinSql(Map<String, Object> params, String sql) {
			if(params.get("type") != null && !"".equals(params.get("type"))){
				//拼接商品名
				sql +=" and type like '%"+params.get("type")+"%'";
			}
			if(params.get("start") != null && !"".equals(params.get("start"))){
				//拼接生日
				sql +=" and price >=  '"+params.get("start")+"'";
			}
			if(params.get("end") != null && !"".equals(params.get("end"))){
				//拼接生日
				sql +=" and  price <=  '"+params.get("end")+"'";
			}
			System.out.println(sql);
			return sql;
		}
}
