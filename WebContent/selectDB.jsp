<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	  Connection con = null;
	  Statement st = null;
	  try {
	    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    con = DriverManager.getConnection(
	        "jdbc:sqlserver://localhost" + ";instance=SQLEXPRESS;databaseName=DIEM;integratedSecurity=true;");
	    st = con.createStatement();
	    String sql = "SELECT *FROM Employee";
	    ResultSet rec = st.executeQuery(sql);
	%>
	<table width="600" border="1" style="float: left;">
		<tr>
			<th width="91">
				<div align="center">Account</div>
			</th>
			<th width="98">
				<div align="center">LastName</div>
			</th>
			<th width="198">
				<div align="center">FirstName</div>
			</th>
			<th width="97">
				<div align="center">Email</div>
			</th>
		</tr>
		<%
		  while ((rec != null) && (rec.next())) {
		%>
		<tr>
			<td><div align="center"><%=rec.getString("ACCOUNT")%></div></td>
			<td><%=rec.getString("FIRSTNAME")%></td>
			<td><%=rec.getString("LASTNAME")%></td>
			<td><div align="center"><%=rec.getString("EMAIL")%></div></td>
		</tr>
		<%
		  }
		%>
	</table>
	<%
	  } catch (Exception e) {
	    // TODO Auto-generated catch block
	    out.println(e.getMessage());
	    e.printStackTrace();
	  }

	  try {
	    if (st != null) {
	      st.close();
	      con.close();
	    }
	  } catch (SQLException e) {
	    // TODO Auto-generated catch block
	    out.println(e.getMessage());
	    e.printStackTrace();
	  }
	%>

	<%-- use jstl tag to connect and retrieve data --%>
	<sql:setDataSource var="snapshot"
		driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
		url="jdbc:sqlserver://localhost ;instance=SQLEXPRESS;databaseName=DIEM;integratedSecurity=true;" />


	<%-- insert --%>
	<sql:update dataSource="${snapshot}" var="result">
	INSERT INTO Employee (ACCOUNT,FIRSTNAME,LASTNAME, EMAIL) VALUES ('3', '4','3','3');
	</sql:update>

	<%-- delete --%>

	<%-- <c:set var="firstName" value="Ha" />
	<sql:update dataSource="${snapshot}" var="count">
	  DELETE FROM Employees WHERE FirstName = ?
	  <sql:param value="${firstName}" />
	</sql:update> --%>

	<%-- update --%>
	<c:set var="FirstName" value="1" />
	<sql:update dataSource="${snapshot}" var="count">
 	 UPDATE Employee SET LASTNAME = '2' where FIRSTNAME =?
  	<sql:param value="${FIRSTNAME}" />
	</sql:update>

	<%-- query - show--%>
	<sql:query dataSource="${snapshot}" var="result">
			SELECT * from Employee;
	</sql:query>
	<table width="600" border="1"
		style="overflow: auto; margin-left: 620px;">
		<tr>
			<th width="91">
				<div align="center">EmployeeID</div>
			</th>
			<th width="98">
				<div align="center">LastName</div>
			</th>
			<th width="198">
				<div align="center">FirstName</div>
			</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.ACCOUNT}" /></td>
				<td><c:out value="${row.FIRSTNAME}" /></td>
				<td><c:out value="${row.LASTNAME}" /></td>
				<td><c:out value="${row.EMAIL}" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>