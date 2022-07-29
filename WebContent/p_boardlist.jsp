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
<style>
table, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
<form action="p_boardwrite.jsp">
<h1>게시글 목록 리스트</h1>	
	<table>
		<tr>
			<td>글번호</td>
			<td>글쓴이</td>
			<td>글제목</td>
			<td>조회수</td>
			
		</tr>
		<%
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				Context init = new InitialContext();
				DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
				conn = ds.getConnection();

				pstmt = conn.prepareStatement("select * from member m join board b on m.id = b.id");

				rs = pstmt.executeQuery();
				int i = 1;
				while (rs.next()) {
		%>
		<tr>
			<td><%=i%></td>
			<td><%=rs.getString("name")%></td>
			<td><a href="p_boardDetail.jsp?bno=<%=rs.getInt("bno")%>"><%=rs.getString("title")%></a></td>
			<td><%=rs.getInt("cnt") %></td>
		</tr>

		<%
			i++;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn.close();
				rs.close();
				pstmt.close();
			}
		%>	
	</table>
	<%if(session.getAttribute("id")!=null){%>
	<button>글쓰기</button>
	<%} %>
	</form>
</body>
</html>