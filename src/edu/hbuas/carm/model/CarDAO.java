package edu.hbuas.carm.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
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
	public List<Car>   listAllcars() {
		List<Car>  cars=new ArrayList<Car>();
		try {
			Class.forName(className);
			Connection  con=DriverManager.getConnection(url,username,password);
			Statement sta=con.createStatement();
			ResultSet rs=sta.executeQuery("select * from car order by carid desc");
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
	/**
	 * 添加车辆信息的数据库方法
	 * @param c
	 * @return
	 */
	public boolean  addCar(Car  c) {
		boolean result=false;
		try {
			Class.forName(className);
			Connection  con=DriverManager.getConnection(url,username,password);
			PreparedStatement sta=con.prepareStatement("insert into car values(null,null,?,?,?,?,?,?,?,?)");
			sta.setString(1, c.getCarname());
			sta.setString(2, c.getSeries());
			sta.setFloat(3, c.getShoujia());
			sta.setFloat(4, c.getXingshilicheng());
			sta.setString(5, c.getColor());
			sta.setString(6, c.getPailiang());
			sta.setString(7, c.getLeixing());
			sta.setString(8, c.getSuozaidi());
			int count=sta.executeUpdate();
			result=count>0?true:false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 修改车辆信息的dao方法
	 * @param c
	 * @return
	 */
	public boolean  updateCar(Car  c) {
		boolean result=false;
		try {
			Class.forName(className);
			Connection  con=DriverManager.getConnection(url,username,password);
			PreparedStatement sta=con.prepareStatement("update car set carname=?,series=?,shoujia=?,xingshilicheng=?,color=?,pailiang=?,leixing=?,suozaidi=? where carid=?");
			sta.setString(1, c.getCarname());
			sta.setString(2, c.getSeries());
			sta.setFloat(3, c.getShoujia());
			sta.setFloat(4, c.getXingshilicheng());
			sta.setString(5, c.getColor());
			sta.setString(6, c.getPailiang());
			sta.setString(7, c.getLeixing());
			sta.setString(8, c.getSuozaidi());
			sta.setInt(9, c.getCarid());
			int count=sta.executeUpdate();
			result=count>0?true:false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 这是根据carid查询车辆信息的dao方法
	 * @param carid
	 * @return
	 */
	public Car  getCarDetailById(int carid) {
		Car c=null;
		try {
			Class.forName(className);
			Connection  con=DriverManager.getConnection(url,username,password);
			Statement sta=con.createStatement();
			ResultSet rs=sta.executeQuery("select * from car  where carid="+carid);
			if(rs.next()) {
				c=new Car();
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
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	
	
	/**
	 * 根据车辆类型统计类型数量的dao方法
	 * @return
	 */
	public   HashMap<String, Integer>  tongjiByType() {
		HashMap<String, Integer> result=new HashMap<String, Integer>();
		try {
			Class.forName(className);
			Connection  con=DriverManager.getConnection(url,username,password);
			Statement sta=con.createStatement();
			ResultSet rs=sta.executeQuery("select leixing,count(*) from car group by leixing");
			while(rs.next()) {
				result.put(rs.getString(1), rs.getInt(2));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	
	
	
	

}
