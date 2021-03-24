<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="test/html; charset=UTF-8"> <%--해당 문서의 인코딩 방식--%>
<meta name="viewport" content="width=device-width", initial-scale="1"> <%--viweport는 아이폰에서 페이지를 표시할 때 사용, 뷰포트의 너비는 기기에 맞춰서, 초기 배율은 100%--%>
<link rel="stylesheet" href="css/bootstrap.css"> <%--rel은 link태그의 필수 속성.속성값"스타일시트"로 사용할 외부 리소스 "css/bootstrap.css"를 불러온다. --%>
<title>JSP로 웹사이트 만들기</title>
</head>
<body>
	<nav class="navbar navbar-default"><%--navigation태그, 메뉴를 만들때 주로 쓰인다. --%>
		<div class="navbar-header"> <%--로고를 담는 부분 --%>
			<a href="https://www.naver.com">NAVER</a>
			<a class="navbar-brand" href="main.jsp">JSP로 웹사이트 만들기</a>
				<!-- <button type="button" data-target="#bs-example-navbar-collpse-1"
				aria-expanded="false">버튼</button> -->
		</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">홈</a></li>
					<li><a href="bbs.jsp">목록</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="active"><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul>
				</ul>
				</div>
	</nav>
	<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<div class="jumbotron" style="padding-top:20px;">
		<form method="post" action="loginAction.jsp">
			<h3 style="text-align: center;">회원가입 화면</h3>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="비밀번호" name="password" maxlength="20">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
			</div>
			<div class="form-group" style="text-align:center;">
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-primary active">
						<input type="radio" name="userGender" autocomplete=off value="남자" checked>남자
					</label>
					<label class="btn btn-primary active">
						<input type="radio" name="userGender" autocomplete=off value="여자" checked>여자
					</label>
				</div>
			</div>
			<div class="form-group">
				<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
			</div>
				<input type="submit" class="btn btn-primary form-control" value="회원가입">
		</form>
		</div>
	</div>
	
	
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>

<%--https://www.youtube.com/watch?v=MtxFWczSFqU&list=PLRx0vPvlEmdAZv_okJzox5wj2gG_fNh_6&index=2 --%>