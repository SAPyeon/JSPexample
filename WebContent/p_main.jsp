<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	메인
	<a href="p_boardlist.jsp">게시판으로</a>
	<%
		if (session.getAttribute("id") != null) {
	%>
	<a href="p_logout.jsp">로그아웃</a>
	<%
		}else{
	%><a href="p_login.jsp">로그인</a>
	<%} %>
</body>
</html>
