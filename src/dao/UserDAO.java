/**
 * 
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;

import model.User;

/**
 * @author User
 * @time:10:16:21 AM
 * @Date Dec 5, 2017
 * @Year:2017
 * @Description
 */
public class UserDAO {
  private PreparedStatement preparedStatement;

  public String checkLogin(User user) throws ClassNotFoundException, SQLException, ServletException {
    Connection connection = util.ConnectDB.Connect();
    try {
      String sql = "SELECT * FROM Account" + " WHERE username = " + "'" + user.getUserName() + "'" + " AND password = "
          + "'" + user.getPassWord() + "'";
      preparedStatement = connection.prepareStatement(sql);
      ResultSet rSet = preparedStatement.executeQuery();
      if (rSet.next())
        return "SUCCESS";
      else
        return "FAIL";
    } finally {
      if (connection != null)
        try {
          connection.close();
        } catch (SQLException e) {
          throw new ServletException();
        }
      if (preparedStatement != null)
        try {
          preparedStatement.close();
        } catch (SQLException e) {
          throw new ServletException();
        }
    }
  }

  public static void main(String[] args) throws ClassNotFoundException, SQLException, ServletException {
    User u = new User("1", "1");
    String a = new UserDAO().checkLogin(u);
    System.out.println(a);
  }
}
