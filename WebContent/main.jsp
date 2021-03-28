<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="test/html; charset=UTF-8">
<%--해당 문서의 인코딩 방식--%>
<meta name="viewport" content="width=device-width" initial-scale="1">
<%--viweport는 아이폰에서 페이지를 표시할 때 사용, 뷰포트의 너비는 기기에 맞춰서, 초기 배율은 100%--%>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/Custom.css">
<%--rel은 link태그의 필수 속성.속성값"스타일시트"로 사용할 외부 리소스 "css/bootstrap.css"를 불러온다. --%>
<title>JSP로 웹사이트 만들기</title>
<style type="text/css">
nav {
	position: sticky;
	top: 0;
	/* width: 100% */
	left: 0;
	right: 0;
}
</style>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>



	<nav class="navbar navbar-default navbar-fixed-top">
		<%--navigation태그, 메뉴를 만들때 주로 쓰인다. --%>
		<div class="navbar-header">
			<%--로고를 담는 부분 --%>
			<a class="navbar-brand" href="main.jsp">JSP로 웹사이트 만들기</a>
			<!-- <button type="button" data-target="#bs-example-navbar-collpse-1"
			aria-expanded="false">버튼</button> -->
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">홈</a></li>
				<li><a href="bbs.jsp">목록</a></li>
			</ul>
			<%
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logout.jsp">로그아웃</a></li>
					</ul>
			</ul>
			<%
				}
			%>
		</div>
	</nav>

	<div class="container"
		style="text-align: center; width: 100%; padding: 0px;">
		<div class="jumbotron">
			<h1>JSP Website</h1>
			<p>with bootstrap</p>
			<p>
				<a class="btn btn-primary btn-pull"
					href="https://github.com/qoalstn" target="blank" role="button">more</a>
			</p>
		</div>
		<div class="container "
			style="padding: 0px; display: block; margin: 0px auto;">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner"
					style="width: 1100px; height: 500px; margin: 0px; padding: 0px;">
					<div class="item active">
						<img src="images/1.jpg" style="width: 1100px; height: 500px;">
					</div>
					<div class="item">
						<img src="images/2.jpg" style="width: 1100px; height: 500px;">
					</div>
					<div class="item">
						<img src="images/3.jpg" style="width: 1100px; height: 500px;">
					</div>
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>

			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>

