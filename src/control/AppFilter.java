/**
 * 
 */
package control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author User
 * @time:9:44:30 AM
 * @Date Dec 5, 2017
 * @Year:2017
 * @Description
 */
public class AppFilter implements Filter {

  /*
   * (non-Javadoc)
   * 
   * @see javax.servlet.Filter#destroy()
   */
  @Override
  public void destroy() {
    // TODO Auto-generated method stub

  }

  /*
   * (non-Javadoc)
   * 
   * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest,
   * javax.servlet.ServletResponse, javax.servlet.FilterChain)
   */
  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    System.out.println("inside filter");
    String email, password, status;
    status = request.getParameter("status");
    email = request.getParameter("email");
    password = request.getParameter("password");

    RequestDispatcher rDispatcher;
    HttpSession session = ((HttpServletRequest) request).getSession();
    HashMap<String, String> emailSession = (HashMap<String, String>) session.getAttribute("account");

    if ((email == null) && (password == null)) {
      if (emailSession == null) {
        if (status == null) {
          rDispatcher = request.getRequestDispatcher("/jsp/user_login.jsp");
          rDispatcher.forward(request, response);
        } else {
          rDispatcher = request.getRequestDispatcher("/jsp/user_registration.jsp");
          rDispatcher.forward(request, response);
        }
      } else {
        String id = request.getParameter("id");
        if ("1".equals(id)) {
          request.setAttribute("order_date", "2017-05-01");
          System.out.println(request.getAttribute("order_date"));
        }
        chain.doFilter(request, response);
      }
    } else {
      chain.doFilter(request, response);
    }

  }

  /*
   * (non-Javadoc)
   * 
   * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
   */
  @Override
  public void init(FilterConfig arg0) throws ServletException {
    // TODO Auto-generated method stub

  }

}
