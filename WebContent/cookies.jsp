<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
W<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body onload="readCookies();">
	<form name="cookiesform" onsubmit="return setCookies();" method="Post">
		<table>
			<tr>
				<td>UserName:</td>
				<td><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="pwd" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="checkbox" name="persist" />Remember</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="submit"></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		function setCookies() {
			if (window.document.cookiesform.persist.checked) {
				var erxpDate = new Date();
				erxpDate.setFullYear(erxpDate.getFullYear() + 1);
				var who = window.document.cookiesform.username.value;
				document.cookie = "username=" + who + ";" + "expires="
						+ erxpDate.toGMTString();
			} else {
				deleteCookies();
			}
			return true;
		}

		function deleteCookies() {
			if (document.cookie) {
				var erxpDate = new Date();
				erxpDate.setFullYear(erxpDate.getFullYear() - 1);
				document.cookie = "username=" + "" + ";" + "expires="
						+ erxpDate.toGMTString();
			}
		}

		function readCookies() {
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