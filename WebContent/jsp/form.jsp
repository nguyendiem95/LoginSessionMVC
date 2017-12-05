<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/form.css">
<style type="text/css">
#borderimg {
	border: 10px solid transparent;
	padding: 15px;
	-webkit-border-image: (img/border.PNG) 20% round;
	border-image: url(img/border.PNG) 20% round;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<form action="insert" name="myForm"
		onsubmit="return checkPhoneAndImages()" method="post">
		<p id="borderimg"></p>
		<fieldset>
			<legend>Form đăng kí học</legend>
			<div id="name">
				<div>First name:</div>
				<input id="firstname" type="text" name="firstname"
					value="${emp.firstName}" required>
				<div style="clear: both;"></div>
				<div>Last name:</div>
				<input id="lastname" type="text" name="lastname"
					value="${emp.lastName}" required>
				<div>Phone number:</div>

				<div id="phone">
					(<input type="text" name="age1" size="3" maxlength="3"
						value="${age1}" required>)<input type="text" name="age2"
						size="3" maxlength="3" value="${age2}" required>-<input
						type="text" size="4" maxlength="4" name="age3" value="${age3}"
						required />
				</div>

				<input type="radio" name="gender" value="male" checked="checked">
				Male<br> <input type="radio" name="gender" value="female">
				Female<br>
			</div>
			<div id="img">
				<input type="file" id="file_up" name="fileup" accept="image/*"
					size="30" onchange="file_change(this)" value="${emp.fileUp}"/>
				<p>
					<img id="imgs" name="img" alt="this is cmc logo"
						src="img/${emp.fileUp}" />
				</p>
			</div>
			<textarea rows="6" cols="80" name="description"
				value="${emp.description}">Description</textarea>
			<input type="checkbox" name="vehicle" value="Bike"
				value="${emp.vehicle}"> By bike<br> <input
				type="checkbox" name="vehicle" value="Car" value="${emp.vehicle}"
				checked>By car<br> <select name="select"
				value="${emp.skill}">
				<option value="meter">Meter</option>
				<option value="a">A</option>
				<option value="b">B</option>
				<option value="c">C</option>
			</select> </br> </br> <input id="submit" type="submit" value="Insert">
		</fieldset>
	</form>
	<script type="text/javascript" src="js/validate.js"></script>
	<center>
		</br/> <a href="insert">Show All Employee</a>
	</center>

</body>
</html>