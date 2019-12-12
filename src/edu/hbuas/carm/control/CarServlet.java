package edu.hbuas.carm.control;

import java.io.IOException;
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
			listAll(request,response);
			break;

		default:
			break;
		}
	}
	
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
