<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
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
	<center>
		<h3 style="color: red">${msg}</h3>
		<a href="form.jsp">Insert</a>
	</center>
	<table width="800" border="1"
		style="overflow: auto; margin-left: 220px;">
		<tr>
			<th width="91">
				<div align="center">FirstName</div>
			</th>
			<th width="98">
				<div align="center">LastName</div>
			</th>
			<th width="400">
				<div align="center">Phone</div>
			</th>
			<th width="198">
				<div align="center">Gender</div>
			</th>
			<th width="198">
				<div align="center">Vehicle</div>
			</th>
			<th width="198">
				<div align="center">Skill</div>
			</th>
		</tr>
		<c:forEach var="item" items="${arrEmployee}">
			<tr>
				<td>${item.firstName}</td>
				<td>${item.lastName}</td>
				<td>${item.phone}</td>
				<td>${item.gender}</td>
				<td>${item.skill}</td>
				<td>${item.vehicle}</td>
				<td><a href="delete?id=${item.phone}">DELETE</a></td>
				<td><a href="edit?id=${item.phone}">EDIT</a></td>
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>