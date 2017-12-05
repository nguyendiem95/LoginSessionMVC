<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.4.2.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery("#ajaxButton").click(function() {
			jQuery.ajax({
				type : "POST",
				url : "ajax.html",
				success : function(html) {
					jQuery("#responseDiv").html(html);
				}
			});
		});
	});
</script>
</head>
<body>
	<div>
		<input type="button" value="ajax" id="ajaxButton" />
	</div>
	<div id="responseDiv"></div>
</body>
</html>