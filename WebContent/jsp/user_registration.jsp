<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Register</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/CSS/styleUserRegister.css">
</head>
<body>
	<div class="dWRAP">
		<div class="dLabel3">Register</div>
		<c:if test="${msg != null}">
			<script type="text/javascript">
				alert("${msg}");
			</script>
		</c:if>
		<div class="dFORM">
			<form name="user_registration"
				action="${pageContext.request.contextPath}/ServletRegister"
				method="post" onsubmit="return userValidate();">
				<div class="dValue2">
					<input type="text" name="user_name" class="iStyleInit"
						placeholder="User name">
				</div>
				<div class="dValue2">
					<input type="password" name="password" class="iStyleInit"
						placeholder="Password">
				</div>
				<div class="dValue2">
					<input type="password" name="repassword" class="iStyleInit"
						placeholder="Re-Password">
				</div>
				<div>
					<input type="submit" value="Register" class="bRegister">
				</div>
				<div class="dValue3">
					<a href="${pageContext.request.contextPath}/jsp/user_login.jsp"
						class="aLogin">Click here to Login</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>