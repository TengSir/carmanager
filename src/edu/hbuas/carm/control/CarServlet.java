package edu.hbuas.carm.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import edu.hbuas.carm.model.CarDAO;
import edu.hbuas.carm.model.javabean.Car;
/**
 * Servlet implementation class CarServlet
 */
@WebServlet("/CarServlet")
public class CarServlet extends HttpServlet {
	private CarDAO dao=new CarDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String method=request.getParameter("method");
		switch (method) {
		case "listAll":
		{
			listAll(request,response);
			break;
		}
		case "deleteCar":
		{
			deleteCar(request,response);
			break;
		}case "addCar":
		{
			addCar(request,response);
			break;
		}case "getCarDetailById":
		{
			getCarDetailById(request,response);
			break;
		}case "updateCar":
		{
			updateCar(request,response);
			break;
		}case "tongjiByType":
		{
			tongjiByType(request,response);
			break;
		}
			
		default:
			break;
		}
	}
	/**
	 * 前段ajax调用的根据车辆类型统计数据的后台方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void tongjiByType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//后台方法直接调用dao统计车辆类型数据
		HashMap<String, Integer> result=dao.tongjiByType();
		
		//讲统计出来的map集合数据转化成json格式
		JSONObject  jsonObj=new JSONObject();
		jsonObj.put("names", JSONArray.toJSON(result.keySet()));
		jsonObj.put("counts", JSONArray.toJSON(result.values()));
		
		//使用servlet的输出流将数据返回给ajax对象
		response.setContentType("text/json;charset=utf-8");
		PrintWriter  out=response.getWriter();
		out.write(jsonObj.toString());
		out.flush();
		out.close();
		
	}
	/**
	 * 修改车辆信息的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void updateCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  //1.先获取页面上修改后的内容
		String  carid=request.getParameter("carid");
		String  carname=request.getParameter("carname");
		String  series=request.getParameter("series");
		String  shoujia=request.getParameter("shoujia");
		String  xingshilicheng=request.getParameter("xingshilicheng");
		String  color=request.getParameter("color");
		String  pailiang=request.getParameter("pailiang");
		String  leixing=request.getParameter("leixing");
		String  suozaidi=request.getParameter("suozaidi");
		Car c=new Car(carname,series,Float.parseFloat(shoujia),Float.parseFloat(xingshilicheng),color,pailiang,leixing,suozaidi);
		c.setCarid(Integer.parseInt(carid));
	  //2.调用dao方法将车辆信息修改
		boolean result=dao.updateCar(c);
	  //3.根据修改结果跳转页面
		if(result) {
			response.sendRedirect("CarServlet?method=listAll");//使用重定向跳转到列表页面不会出现表单重复提交现象
		//	request.getRequestDispatcher("CarServlet?method=listAll").forward(request, response);
		}else {
			request.setAttribute("updateMessage", "修改失败！");
			request.getRequestDispatcher("carEdit.jsp").forward(request, response);
		}
		
	}
	/**
	 * 这是根据编号查找某个车辆信息的具体方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void getCarDetailById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取用户点击链接时传入的carid
		String carid=request.getParameter("carid");
		//2.调用dao方法根据这个id查询这个车辆信息
		Car c=dao.getCarDetailById(Integer.parseInt(carid));
		//3.将查询出来的car对象存储到request范围里
		request.setAttribute("car", c);
		//4.跳转到修改页面
		request.getRequestDispatcher("carEdit.jsp").forward(request, response);
	}
	
	/**
	 * 这是添加二手车信息的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void addCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//1.获取表单上用户输入的车辆信息
	String  carname=request.getParameter("carname");
	String  series=request.getParameter("series");
	String  shoujia=request.getParameter("shoujia");
	String  xingshilicheng=request.getParameter("xingshilicheng");
	String  color=request.getParameter("color");
	String  pailiang=request.getParameter("pailiang");
	String  leixing=request.getParameter("leixing");
	String  suozaidi=request.getParameter("suozaidi");
	
	Car c=new Car(carname,series,Float.parseFloat(shoujia),Float.parseFloat(xingshilicheng),color,pailiang,leixing,suozaidi);
	//2.调用dao方法，将该车辆信息插入到数据库的表里面
	System.out.println(c);
	 boolean result=dao.addCar(c);
	 System.out.println(result);
	//3.根据dao方法返回值来跳转到相应页面并提示添加的操作结果
		if(result) {
			response.sendRedirect("CarServlet?method=listAll");//使用重定向跳转到列表页面不会出现表单重复提交现象
		//	request.getRequestDispatcher("CarServlet?method=listAll").forward(request, response);
		}else {
			request.setAttribute("addMessage", "添加失败！");
			request.getRequestDispatcher("carAdd.jsp").forward(request, response);
		}
	}
	
	
	/**
	 * 这是删除车辆信息的后台方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void deleteCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("进入了删除方法");
	//1.取前段ajax发送古来的要删除的car的id
	String carid=request.getParameter("carid");
	//2.调用dao里面的删除方法删除这条车辆信息
	boolean result=dao.deleteCarById(Integer.parseInt(carid));
	System.out.println("删除结果："+result);
	//3.使用输出流将当前这个业务执行的结果返回给前段ajax对象
	response.setContentType("text/html;charset=utf-8");
	PrintWriter  out=response.getWriter();
	out.write(result+"");
	out.flush();
	out.close();
	}
	
	/**
	 * 这是查询显示所有二手车的后台业务方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void listAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("查询显示所有二手车列表的方法");
		//1.直接调用cardao对象的方法查询所有二手车信息
		List<Car> cars=dao.listAllcars();
		System.out.println(cars.size());
		//2.把数据存储起来
		request.setAttribute("cars", cars);
		//3.跳转页面
		request.getRequestDispatcher("carList.jsp").forward(request, response);
	}

}
