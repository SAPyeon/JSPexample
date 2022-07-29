<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
메인입니다.
<a href="boardlist.jsp">게시판으로 Go</a>
<%if(session.getAttribute("id")!=null){ %>
<a href="logoutServer.jsp">로그아웃</a>
<%}else{%>
<a href="login.jsp">로그인</a> <%}%>
</body>
</html>