<%--@page import="com.sun.tools.javac.code.Type.ForAll"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="test/html; charset=UTF-8">
<%--해당 문서의 인코딩 방식--%>
<meta name="viewport" content="width=device-width" initial-scale="1">
<%--viweport는 아이폰에서 페이지를 표시할 때 사용, 뷰포트의 너비는 기기에 맞춰서, 초기 배율은 100%--%>
<link rel="stylesheet" href="css/bootstrap.css">
<%--rel은 link태그의 필수 속성.속성값"스타일시트"로 사용할 외부 리소스 "css/bootstrap.css"를 불러온다. --%>
<title>JSP로 웹사이트 만들기</title>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>



	<nav class="navbar navbar-default">
		<%--navigation태그, 메뉴를 만들때 주로 쓰인다. --%>
		<div class="navbar-header">
			<%--로고를 담는 부분 --%>
			<a href="https://www.naver.com">NAVER</a> <a class="navbar-brand"
				href="main.jsp">JSP로 웹사이트 만들기</a>
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

	<div class="container">
		<table class="table table-striped"
			style="text-align: center; boder: 1px solid #dddddd">
			<thead>
				<tr>
					<th
						style="background-color: #eeeeee; text-align: center; boder: 1px solid #dddddd">번호</th>
					<th
						style="background-color: #eeeeee; text-align: center; boder: 1px solid #dddddd">제목</th>
					<th
						style="background-color: #eeeeee; text-align: center; boder: 1px solid #dddddd">작성자</th>
					<th
						style="background-color: #eeeeee; text-align: center; boder: 1px solid #dddddd">작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					BbsDAO bbsDAO = new BbsDAO();
				ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
				for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getId()%></td>
					<td><a href="view.jsp?bbsID=<%=list.get(i).getId()%>"> <%=list.get(i).getBbsTitle()%>
					</a></td>
					<td><%=list.get(i).getId()%></td>
					<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
		+ list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
				</tr>
				<%
					}
				%>

			</tbody>
		</table>
		<a href="write.jsp" class="btn btn-primary pull-right">글쓰기 </a>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>

