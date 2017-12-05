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
	
	<%-- use jstl tag to connect and retrieve data --%>
	<sql:setDataSource var="snapshot"
		driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
		url="jdbc:sqlserver://localhost ;instance=SQLEXPRESS;databaseName=DIEM;integratedSecurity=true;" />

	<%
		String firstname = request.getParameter("id");
	%>
	<%-- insert --%>
	<sql:update dataSource="${snapshot}" var="result">
	DELETE FROM Customer WHERE firstname='<%=firstname %>' 
	</sql:update>
	<script type="text/javascript" src="js/validate.js"></script>
	<sql:query dataSource="${snapshot}" var="result">
			SELECT * from Customer;
	</sql:query>
	<table width="600" border="1"
		style="overflow: auto; margin-left: 420px;">
		<tr>
			<th width="91">
				<div align="center">firstname</div>
			</th>
			<th width="98">
				<div align="center">LastName</div>
			</th>
			<th width="198">
				<div align="center">Phone</div>
			</th>
			<th width="198">
				<div align="center">gender</div>
			</th>
			<th width="198">
				<div align="center">fileup</div>
			</th>
			<th width="198">
				<div align="center">vehicle</div>
			</th>
			<th width="198">
				<div align="center">selects</div>
			</th>
			<th width="198">
				<div align="center">description</div>
			</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.firstname}" /></td>
				<td><c:out value="${row.lastname}" /></td>
				<td><c:out value="${row.phone}" /></td>
				<td><c:out value="${row.gender}" /></td>
				<td><c:out value="${row.img}" /></td>
				<td><c:out value="${row.goby}" /></td>
				<td><c:out value="${row.skill}" /></td>
				<td><c:out value="${row.description}" /></td>
				<td><a href="delete.jsp?id=${row.firstname}">DELETE</a></td>
			</tr>
		</c:forEach>
	</table>
	<center><a href="form.jsp">Return</a></center>
</body>
</html>