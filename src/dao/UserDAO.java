/**
 * 
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;

import model.Employee;
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

  public boolean insertUser(User user) throws ClassNotFoundException, SQLException {
    Connection connect = util.ConnectDB.Connect();
    String sql = "Insert into Account Values(?,?)";
    PreparedStatement prepare = connect.prepareStatement(sql);
    prepare.setString(1, user.getUserName());
    prepare.setString(2, user.getPassWord());
    try {
      prepare.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    } finally {
      connect.close();
    }
    return true;
  }
  
  public boolean getUser(String userName) throws ClassNotFoundException, SQLException {
    Connection connect = util.ConnectDB.Connect();
    String sql = "SELECT * FROM Account" + " WHERE username = " + "'" + userName + "'";
    PreparedStatement ps = null;
    try {
      ps = connect.prepareStatement(sql);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
        return true;
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return false;
  }
}
