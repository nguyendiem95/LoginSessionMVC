package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeDAO;
import model.Employee;

/**
 * Servlet implementation class ServletGetAllEmployee
 */
@WebServlet("/ServletGetAllEmployee")
public class ServletInsertEmployee extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public ServletInsertEmployee() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see Servlet#init(ServletConfig)
   */
  public void init(ServletConfig config) throws ServletException {
    // TODO Auto-generated method stub
  }

  /**
   * @see Servlet#destroy()
   */
  public void destroy() {
    // TODO Auto-generated method stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      request.setAttribute("arrEmployee", new EmployeeDAO().getList());
    } catch (SQLException e) {
      e.printStackTrace();
    }
    RequestDispatcher rd = request.getRequestDispatcher("/jsp/getAllEmployee.jsp");
    rd.forward(request, response);
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String firstName = request.getParameter("firstname");
    String lastName = request.getParameter("lastname");
    String age1 = request.getParameter("age1");
    String age2 = request.getParameter("age2");
    String age3 = request.getParameter("age3");
    String gender = request.getParameter("gender");
    String fileUp = request.getParameter("fileup");
    String vehicle = request.getParameter("vehicle");
    String skill = request.getParameter("select");
    String description = request.getParameter("description");
    String phone = age1 + "-" + age2 + "-" + age3;
    Employee e = new Employee(firstName, lastName, age1 + "-" + age2 + "-" + age3, gender, fileUp, vehicle, skill,
        description);
    String msg = null;
    try {
      if (new EmployeeDAO().isExist(phone)) {
        if (new EmployeeDAO().updateEmployee(e)) {
          msg = "Update success";
        } else {
          msg = "Do not update";
        }
      } else {
        if (new EmployeeDAO().insert(e)) {
          msg = "Insert success";
        } else {
          msg = "Do not insert";
        }
      }
      request.setAttribute("msg", msg);
      request.setAttribute("arrEmployee", new EmployeeDAO().getList());
    } catch (ClassNotFoundException | SQLException e1) {
      e1.printStackTrace();
    }
    RequestDispatcher rd = request.getRequestDispatcher("/jsp/getAllEmployee.jsp");
    rd.forward(request, response);
  }

}
