<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table,tr,td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<form action="boardcontent.jsp" method="post" >
		<h1>게시판</h1>
		<c:if test="${id!=null}" >
		<a href="boardwrite.jsp">글쓰기</a>
		</c:if>
		<table>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>내용</td>
				<td>날짜</td>
				<td>조회수</td>
				<td>id</td>
			</tr>
			<%
			
				//DB연결
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null; //select문 사용

				try {
					Context init = new InitialContext();
					DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
					conn = ds.getConnection();

					pstmt = conn.prepareStatement("select * from board");
					
					rs = pstmt.executeQuery(); //데이터값을 rs에 저장
					
					int i = 1;
					while (rs.next()) { //resultSet에 데이터가 있으면, next() : 커서를 아래로 내려가게함, 여기서는 데이터 필드를 내려가면서 확인
			%>		

			<tr>
				<td><%=i%></td>
				<td><%=rs.getString("title")%></td>
				<td><a href="boardcontent.jsp?bno=<%=rs.getString("bno")%>"><%=rs.getString("content")%></a></td>
				<td><%=rs.getString("regdate")%></td>
				<td><%=rs.getString("cnt")%></td>
				<td><%=rs.getString("id")%></td>
			</tr>

			<%
			i++;
				}
				} catch (Exception e) {
					//System.out.println("DB연결 실패");
					e.printStackTrace();
				} finally { //메모리를 썼으면 닫아야함
					conn.close();
					rs.close();
					pstmt.close();
				}
			%>
			

		</table>
	</form>
</body>
</html>