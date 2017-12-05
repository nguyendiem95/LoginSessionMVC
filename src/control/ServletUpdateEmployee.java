package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeDAO;
import model.Employee;

/**
 * Servlet implementation class ServletUpdateEmployee
 */
@WebServlet("/ServletUpdateEmployee")
public class ServletUpdateEmployee extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public ServletUpdateEmployee() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String phone = request.getParameter("id");
    try {
      Employee emp = new EmployeeDAO().getEmoloyee(phone);
      String age1[] = emp.getPhone().split("-");
      request.setAttribute("age1", age1[0]);
      request.setAttribute("age2", age1[1]);
      request.setAttribute("age3", age1[2]);
      request.setAttribute("emp", emp);
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    RequestDispatcher rd = request.getRequestDispatcher("/jsp/form.jsp");
    rd.forward(request, response);
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }

}
