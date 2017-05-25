package com.marry.util;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class Dbutil {
	
	private static DataSource ds = null;
	static{
		//如果没有configName参数，去类加载路径读取c3p0-config.xml的默认配置 <default-config>
		//configName：<named-config name="mysql">
		System.out.println("已加载");
		ds = new ComboPooledDataSource("sqlserver");
	}
	/**获取数据连接池
	 * 
	 * @return
	 */
	public static DataSource getDataSource(){
		return ds;
	}
	
	
	public static void main(String[] args) {
		System.out.println(getDataSource());
	}
}
