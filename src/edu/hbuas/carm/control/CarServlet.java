package edu.hbuas.carm.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		}
			
		default:
			break;
		}
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
			request.getRequestDispatcher("CarServlet?method=listAll").forward(request, response);
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
		System.out.println("查询呢显示所有二手车列表的方法");
		
		//1.直接调用cardao对象的方法查询所有二手车信息
		List<Car> cars=dao.listAllcars();
		System.out.println(cars.size());
		//2.把数据存储起来
		request.setAttribute("cars", cars);
		
		//3.跳转页面
		request.getRequestDispatcher("carList.jsp").forward(request, response);
	}

}
