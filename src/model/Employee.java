/**
 * 
 */
package model;

/**
 * @author User
 * @time:1:18:13 PM
 * @Date Dec 4, 2017
 * @Year:2017
 * @Description
 */
public class Employee {
  private String firstName;
  private String lastName;
  private String phone;
  private String gender;
  private String fileUp;
  private String vehicle;
  private String skill;
  private String description;

  /**
   * 
   */
  public Employee() {
    super();
  }

  /**
   * @param firstName
   * @param lastName
   * @param phone
   * @param gender
   * @param fileUp
   * @param vehicle
   * @param skill
   * @param description
   */
  public Employee(String firstName, String lastName, String phone, String gender, String fileUp, String vehicle,
      String skill, String description) {
    super();
    this.firstName = firstName;
    this.lastName = lastName;
    this.phone = phone;
    this.gender = gender;
    this.fileUp = fileUp;
    this.vehicle = vehicle;
    this.skill = skill;
    this.description = description;
  }

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public String getFileUp() {
    return fileUp;
  }

  public void setFileUp(String fileUp) {
    this.fileUp = fileUp;
  }

  public String getVehicle() {
    return vehicle;
  }

  public void setVehicle(String vehicle) {
    this.vehicle = vehicle;
  }

  public String getSkill() {
    return skill;
  }

  public void setSkill(String skill) {
    this.skill = skill;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

}
