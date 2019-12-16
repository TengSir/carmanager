package edu.hbuas.carm.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;

import edu.hbuas.carm.model.javabean.Car;

public class CarDAO {
	public String url="jdbc:mysql://localhost:3306/carmanager";
	public String className="com.mysql.jdbc.Driver";
	public String username="root";
	public String password="root";
	/**
	 * 这是查询所有二手车信息的方法
	 * @return
	 */
	public Set<Car>   listAllcars() {
		Set<Car>  cars=new HashSet<Car>();
		try {
			Class.forName(className);
			Connection  con=DriverManager.getConnection(url,username,password);
			Statement sta=con.createStatement();
			ResultSet rs=sta.executeQuery("select * from car");
			while(rs.next()) {
				Car c=new Car();
				c.setCarid(rs.getInt("carid"));
				c.setCarname(rs.getString("CARNAME"));
				c.setColor(rs.getString("color"));
				c.setImage(rs.getString("image"));
				c.setLeixing(rs.getString("leixing"));
				c.setPailiang(rs.getString("pailiang"));
				c.setSeries(rs.getString("series"));
				c.setShoujia(rs.getFloat("shoujia"));
				c.setSuozaidi(rs.getString("suozaidi"));
				c.setXingshilicheng(rs.getFloat("xingshilicheng"));
				cars.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cars;
	}
	/**
	 * 这是dao里面删除车辆信息的dao方法
	 * @param carid
	 * @return
	 */
	public boolean  deleteCarById(int carid) {
		boolean result=false;
		try {
			Class.forName(className);
			Connection  con=DriverManager.getConnection(url,username,password);
			Statement sta=con.createStatement();
			int count=sta.executeUpdate("delete from car where carid="+carid);
			result=count>0?true:false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	

}
