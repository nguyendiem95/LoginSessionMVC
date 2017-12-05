<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/home.css">
<style type="text/css">
#borderimg {
	border: 10px solid transparent;
	padding: 15px;
	-webkit-border-image: url("img/border.PNG") 20% round;
	border-image: url(img/border.PNG) 20% round;
}
</style>
</head>

<body>
	<div id="left">
		<ul>
			<li><a href="jsp/form.jsp">FORM AND DB</a></li>
			<li><a href="table_member.html">JAVA SCRIPT</a></li>
			<li><a href="cookies.jsp">JAVA SCRIPT- COOKIE</a></li>
			<li><a href="jquery.jsp">JQUERRY</a></li>
			<li><a href="ajax.jsp">AJAX</a></li>
			<li><a href="jsp.jsp">JSP</a></li>
			<li><a href="">SERVLET</a></li>
			<li><a href="">MVC & JSP MODELS</a></li>
			<li><a href="">SPRING MVC</a></li>
			<li><a href="">UNIT TESTING</a></li>
			<li><a href="${pageContext.request.contextPath}/ServletLogout">LOGOUT</a></li>
		</ul>
	</div>
	<div id="menu">
		<ul>
			<li><a href="">HTML & CSS</a></li>
			<li><a href="">JAVA SCRIPT</a></li>
			<li><a href="">JQUERRY</a></li>
			<li><a href="">AJAX</a></li>
			<li><a href="">JSP</a></li>
			<li><a href="">SERVLET</a></li>
			<li><a href="">SPRING</a></li>
			<li><a href="">HIBERNATE</a></li>
		</ul>
	</div>
	<div id="logo">
		<p id="borderimg"></p>
		<div id="img">
			<img name="globe" src="${pageContext.request.contextPath}/img/cmcLogo.PNG"
				onMouseOver="swap('${pageContext.request.contextPath}/img/cmcglobal2.png');"
				onMouseOut="swap('${pageContext.request.contextPath}/img/cmcLogo.PNG');" />
		</div>
		<div id="text_img">CHAMP GLOBAL DEVELOPER PASSPORT</div>
	</div>
	<div id="main">
		<div id="text_olumn">
			<div id="column">
				<h3>Lorem ipsum dolor sit amet</h3>
				<img align="left" src="${pageContext.request.contextPath}/img/cmcLogo.PNG" />
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Donec maximus eros sit amet laoreet venenatis. Vestibulum in
					maximus arcu. Donec hendrerit vel ex at dictum. Curabitur lobortis,
					nisi sed hendrerit pretium, nulla nunc hendrerit leo, sit amet
					euismod purus metus varius tortor.</p>
			</div>
			<div id="column">
				<h3>Lorem ipsum dolor sit amet</h3>
				<img align="left" src="${pageContext.request.contextPath}/img/cmcLogo.PNG" />
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Donec maximus eros sit amet laoreet venenatis. Vestibulum in
					maximus arcu. Donec hendrerit vel ex at dictum. Curabitur lobortis,
					nisi sed hendrerit pretium, nulla nunc hendrerit leo, sit amet
					euismod purus metus varius tortor.</p>
			</div>
			<div id="column">
				<h3>Lorem ipsum dolor sit amet</h3>
				<img align="left" src="${pageContext.request.contextPath}/img/cmcLogo.PNG" />
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Donec maximus eros sit amet laoreet venenatis. Vestibulum in
					maximus arcu. Donec hendrerit vel ex at dictum. Curabitur lobortis,
					nisi sed hendrerit pretium, nulla nunc hendrerit leo, sit amet
					euismod purus metus varius tortor.</p>
			</div>
		</div>
	</div>
	<div id="align" style="clear: both;"></div>
	<div id="footer">Copyright @ 2017- Learn HTML & CSS at CMC</div>
	<div id="map"
		style="width: 100%; height: 600px; background: white; padding-top: 70px"></div>

	<script>
		function myMap() {
			var mapCanvas = document.getElementById("map");
			var myCenter = new google.maps.LatLng(20.980428, 105.787444);
			var mapOptions = {
				center : myCenter,
				zoom : 7
			};
			var map = new google.maps.Map(mapCanvas, mapOptions);
			var marker = new google.maps.Marker({
				position : myCenter
			});
			marker.setMap(map);
			var infowindow = new google.maps.InfoWindow({
				content : "Ha Noi"
			});
			infowindow.open(map, marker);
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQtU5NDMbzdD3JT0pDw1i8yYATBfiUF3k&callback=myMap"></script>
	<script language="javascript">
		function swap(file) {
			document.globe.src = file;
		}
	</script>
</body>
</html>