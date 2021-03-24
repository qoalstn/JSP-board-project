<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="password"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="test/html; charset=UTF-8"> <%--해당 문서의 인코딩 방식--%>
<title>JSP로 웹사이트 만들기</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getuserID(), user.getPassword());
		if(result == 1) {
			 PrintWriter script = response.getWriter();
		     script.println("<script>");
		     script.println("location.href = 'main.jsp'");
		     script.println("</script>");
		} else if(result == 0) {
			 PrintWriter script = response.getWriter();
		     script.println("<script>");
		     script.println("alert('비밀번호가 틀립니다.')");
		     script.println("history.back()");
		     script.println("</script>");
		} else if(result == -1) {
			 PrintWriter script = response.getWriter();
		     script.println("<script>");
		     script.println("alert('존재하지 않는 아이디 입니다.')");
		     script.println("history.back()");
		     script.println("</script>");
		} else if(result == -2) {
			 PrintWriter script = response.getWriter();
		     script.println("<script>");
		     script.println("alert('데이터베이스에 오류가 발생했습니다.')");
		     script.println("history.back()");
		     script.println("</script>");
		}
	%>
</body>
</html>

<%--https://www.youtube.com/watch?v=MtxFWczSFqU&list=PLRx0vPvlEmdAZv_okJzox5wj2gG_fNh_6&index=2 --%>