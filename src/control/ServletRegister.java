package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

/**
 * Servlet implementation class ServletRegister
 */
@WebServlet("/ServletRegister")
public class ServletRegister extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public ServletRegister() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String userName = request.getParameter("user_name");
    String pass = request.getParameter("password");
    String rePass = request.getParameter("repassword");
    User user = new User(userName, pass);
    String msg = null;
    RequestDispatcher rDispatcher = null;
    try {
      if (new UserDAO().getUser(userName)) {
        msg = "User is exist";
        rDispatcher = request.getRequestDispatcher("/jsp/user_registration.jsp");
      } else {
        if (new UserDAO().insertUser(user)) {
          msg = "Creat account success!";
          rDispatcher = request.getRequestDispatcher("/jsp/user_login.jsp");
        } else {
          msg = "Creat account no success!";
          rDispatcher = request.getRequestDispatcher("/jsp/user_registration.jsp");
        }
      }
    } catch (ClassNotFoundException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    request.setAttribute("msg", msg);
    rDispatcher.forward(request, response);
  }

}
