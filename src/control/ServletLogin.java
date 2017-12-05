package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public ServletLogin() {
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
    String email, password;
    try {
      email = request.getParameter("email");
      password = request.getParameter("password");
      User user = new User(email, password);
      String result = new UserDAO().checkLogin(user);
      RequestDispatcher rDispatcher;
      HttpSession session;
      Map<String, String> emailSession;
      if ("SUCCESS".equals(result)) {
        session = request.getSession();
        emailSession = new HashMap<String, String>();
        emailSession.put("email", email);
        emailSession.put("password", password);
        session.setAttribute("account", emailSession);
        rDispatcher = request.getRequestDispatcher("/jsp/index.jsp");
        rDispatcher.forward(request, response);
      } else {
        String msg = "Login fail";
        request.setAttribute("msg", msg);
        rDispatcher = request.getRequestDispatcher("/jsp/user_login.jsp");
        rDispatcher.forward(request, response);
      }
    } catch (ClassNotFoundException | SQLException e) {
      throw new ServletException();
    }
  }

}
