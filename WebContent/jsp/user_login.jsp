<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Register</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/styleUserRegister.css">
</head>
<body onload="getCookie();">
	<c:if test="${msg != null}">
		<script type="text/javascript">
			alert("${msg}");
		</script>
	</c:if>
	<div class="dWRAP">
		<div class="dLabel3">Please Sign-In</div>
		<div class="dFORM">
			<form name="user_signin"
				action="${pageContext.request.contextPath}/ServletLogin"
				method="post">
				<div class="dValue2">
					<input type="text" name="email" class="iStyleInit"
						placeholder="E-mail">
				</div>
				<div class="dValue2">
					<input type="password" name="password" class="iStyleInit"
						placeholder="Password">
				</div>
				<div>
					<input type="checkbox" name="remember">Remember Me
				</div>
				<div>
					<input type="submit" value="Login" class="bRegister">
				</div>

				<div class="dValue3">
					<a
						href="${pageContext.request.contextPath}/jsp/user_registration.jsp?status=register"
						class="aLogin">Click here to Register</a>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function getCookie() {
			if (document.cookie) {
				var theCookies = document.cookie;
				var pos = theCookies.indexOf("username=");
				if (pos != -1) {
					var cookiesArr = theCookies.split("=");
					var value = cookiesArr[1];
					window.document.cookiesform.username.value = value;
					window.document.cookiesform.persist.checked = true;
				}
			}
		}
	</script>
</body>
</html>