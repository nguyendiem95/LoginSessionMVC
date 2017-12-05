<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Register</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styleUserRegister.css">
</head>
<body onload="getCookie();">
    <div class = "dWRAP">
        <div class = "dLabel3">
            Please Sign-In
        </div>
        <div class = "dFORM">
            <form name="user_signin" action="${pageContext.request.contextPath}/ServletLogin" method="post">
                <div class = "dValue2">
                    <input type="text" name="email" class = "iStyleInit" placeholder = "E-mail">
                </div>
                <div class = "dValue2">
                    <input type="password" name="password" class = "iStyleInit" placeholder = "Password">
                </div>
                <div>
                    <input type="checkbox" name="remember">Remember Me
                </div>
                <div>
                    <input type="submit" value="Login" class = "bRegister">
                </div>

                <%-- <div class = "dValue3">
                    <a href="${pageContext.request.contextPath}/js/user_registration.jsp?status=register" class = "aLogin">Click here to Register</a>
                </div> --%>
            </form>
        </div>
    </div>
</body>
</html>