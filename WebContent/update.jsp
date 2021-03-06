<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
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
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 이용이 가능합니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}

	int id = 0;
	if (request.getParameter("id") != null) {
		id = Integer.parseInt(request.getParameter("id"));
	}
	if (id == 0 ) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(id);
	if (!userID.equals(bbs.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없는 계정입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
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

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logout.jsp">로그아웃</a></li>
					</ul>
			</ul>

		</div>
	</nav>

	<div class="container">
		<div class="row">
			<form method="post" action="updateAction.jsp?id=<%=id%>">
				<table class="table table-striped"
					style="text-align: center; boder: 1px solid #dddddd;">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center; boder: 1px solid #dddddd">게시판
								글쓰기 양식</th>
						</tr>
					</thead> 
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="bbsContent" maxlength="2048" style="height: 350px"><%= bbs.getBbsContent() %></textarea></td>
						</tr>
					</tbody>

				</table>
				<input type="submit" class="btn btn-primary pull-right" value="수정완료">
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>

