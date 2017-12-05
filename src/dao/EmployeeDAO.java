/**
 * 
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Employee;

/**
 * @author User
 * @time:1:14:09 PM
 * @Date Dec 4, 2017
 * @Year:2017
 * @Description
 */
public class EmployeeDAO {
  /**
   * @Description: insert information employee
   * @Author: User CMC SOFT
   * @Creat date:Dec 4, 2017
   * @Modifier: User
   * @Modifined date: Dec 4, 2017
   * @Exception:
   * @param args:
   *          object Emplyee
   * @param employee
   * @return: boolean
   * @throws ClassNotFoundException
   * @throws SQLException
   */
  public boolean insert(Employee employee) throws ClassNotFoundException, SQLException {
    Connection connect = util.ConnectDB.Connect();
    String sql = "Insert into Customer Values(?,?,?,?,?,?,?,?)";
    PreparedStatement prepare = connect.prepareStatement(sql);
    prepare.setString(1, employee.getFirstName());
    prepare.setString(2, employee.getLastName());
    prepare.setString(3, employee.getPhone());
    prepare.setString(4, employee.getGender());
    prepare.setString(5, employee.getDescription());
    prepare.setString(6, employee.getVehicle());
    prepare.setString(7, employee.getSkill());
    prepare.setString(8, employee.getFileUp());
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

  /**
   * @Description: get list Employee
   * @Author: User CMC SOFT
   * @Creat date:Dec 4, 2017
   * @Modifier: User
   * @Modifined date: Dec 4, 2017
   * @Exception:
   * @return: list object
   * @throws SQLException
   */
  public List<Employee> getList() throws SQLException {
    Connection connect;
    // ConnectDB connectDB = new ConnectDB();
    try {
      connect = util.ConnectDB.Connect();
      List<Employee> list = new ArrayList<Employee>();
      // Statement creation
      Statement statement = connect.createStatement();
      // for retrieve data
      ResultSet rs = statement.executeQuery("SELECT *FROM Customer");
      while (rs.next()) {
        Employee ex = new Employee();
        ex.setFirstName(rs.getString("firstname"));
        ex.setLastName(rs.getString("lastname"));
        ex.setPhone(rs.getString("phone"));
        ex.setGender(rs.getString("gender"));
        ex.setDescription(rs.getString("description"));
        ex.setVehicle(rs.getString("goby"));
        ex.setSkill(rs.getString("skill"));
        ex.setFileUp(rs.getString("img"));
        list.add(ex);
      }
      connect.close();
      return list;
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
      return null;
    }
  }

  /**
   * @Description: delete information Employee
   * @Author: User CMC SOFT
   * @Creat date:Dec 4, 2017
   * @Modifier: User
   * @Modifined date: Dec 4, 2017
   * @Exception:
   * @param phone
   * @return: boolean
   * @throws ClassNotFoundException
   * @throws SQLException
   */
  public boolean delete(String phone) throws SQLException, ClassNotFoundException {
    Connection connect = util.ConnectDB.Connect();
    String sql = "DELETE Customer WHERE phone = ?";
    PreparedStatement prepare = connect.prepareStatement(sql);
    prepare.setString(1, phone);
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

  /**
   * @Description: get object Employee
   * @Author: User CMC SOFT
   * @Creat date:Dec 4, 2017
   * @Modifier: User
   * @Modifined date: Dec 4, 2017
   * @Exception:
   * @param phone
   * @return: object Employee
   * @throws ClassNotFoundException
   * @throws SQLException
   */
  public Employee getEmoloyee(String phone) throws ClassNotFoundException, SQLException {
    Connection connect = util.ConnectDB.Connect();
    String sql = "SELECT * FROM Customer" + " WHERE phone = " + "'" + phone + "'";
    PreparedStatement ps = null;
    try {
      ps = connect.prepareStatement(sql);
      ResultSet rs = ps.executeQuery();
      String firstName = null;
      String lastName = null;
      String gender = null;
      String vehicle = null;
      String description = null;
      String skill = null;
      String img = null;
      while (rs.next()) {
        firstName = rs.getString("firstname");
        lastName = rs.getString("lastname");
        gender = rs.getString("gender");
        vehicle = rs.getString("goby");
        description = rs.getString("description");
        skill = rs.getString("skill");
        img = rs.getString("img");
      }
      Employee emp = new Employee(firstName, lastName, phone, gender, img, vehicle, skill, description);
      return emp;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }

  /**
   * @Description: update information Employee
   * @Author: User CMC SOFT
   * @Creat date:Dec 4, 2017
   * @Modifier: User
   * @Modifined date: Dec 4, 2017
   * @Exception:
   * @param e:
   *          Object Employee
   * @return: boolean
   * @throws ClassNotFoundException
   * @throws SQLException
   */
  public boolean updateEmployee(Employee e) throws ClassNotFoundException, SQLException {
    Connection connect = util.ConnectDB.Connect();
    String sql = "UPDATE Customer SET firstname=?, lastname =?, gender=?, description =?, goby=?, skill=?, img=? WHERE phone=?";
    PreparedStatement prepare = connect.prepareStatement(sql);
    prepare.setString(1, e.getFirstName());
    prepare.setString(2, e.getLastName());
    prepare.setString(3, e.getGender());
    prepare.setString(4, e.getDescription());
    prepare.setString(5, e.getVehicle());
    prepare.setString(6, e.getSkill());
    prepare.setString(7, e.getFileUp());
    prepare.setString(8, e.getPhone());
    try {
      prepare.executeUpdate();
    } catch (Exception ex) {
      ex.printStackTrace();
      return false;
    } finally {
      connect.close();
    }
    return true;
  }

  /**
   * @Description: check employee is exit
   * @Author: User CMC SOFT
   * @Creat date:Dec 4, 2017
   * @Modifier: User
   * @Modifined date: Dec 4, 2017
   * @Exception:
   * @param args:
   *          String phone
   * @return: boolean
   * @throws ClassNotFoundException
   * @throws SQLException
   */
  public boolean isExist(String phone) throws ClassNotFoundException, SQLException {
    Connection connect = util.ConnectDB.Connect();
    String sql = "SELECT * FROM Customer" + " WHERE phone=" + "'" + phone + "'";
    PreparedStatement prepare = null;
    try {
      prepare = connect.prepareStatement(sql);
      ResultSet rs = prepare.executeQuery();
      while (rs.next()) {
        return true;
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return false;
  }
}
