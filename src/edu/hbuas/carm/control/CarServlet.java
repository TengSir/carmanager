package edu.hbuas.carm.control;

import java.io.IOException;
import java.io.PrintWriter;
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
		}
			
		default:
			break;
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
		Set<Car> cars=dao.listAllcars();
		System.out.println(cars.size());
		//2.把数据存储起来
		request.setAttribute("cars", cars);
		
		//3.跳转页面
		request.getRequestDispatcher("carList.jsp").forward(request, response);
	}

}
