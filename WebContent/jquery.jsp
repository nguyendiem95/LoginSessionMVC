<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("button").click(function() {
				$("p").hide(1000, function() {
					alert("The paragraph is now hidden");
				});
			});
		});
	</script>
</head>
<button>Hide</button>
<p>This is a paragraph with little content.</p>
</body>


</html>