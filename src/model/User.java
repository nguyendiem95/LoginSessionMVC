/**
 * 
 */
package model;

/**
 * @author User
 * @time:10:15:01 AM
 * @Date Dec 5, 2017
 * @Year:2017
 * @Description
 */
public class User {
  private String userName;
  private String passWord;

  /**
   * 
   */
  public User() {
    super();
  }

  /**
   * @param userName
   * @param passWord
   */
  public User(String userName, String passWord) {
    super();
    this.userName = userName;
    this.passWord = passWord;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getPassWord() {
    return passWord;
  }

  public void setPassWord(String passWord) {
    this.passWord = passWord;
  }
}
