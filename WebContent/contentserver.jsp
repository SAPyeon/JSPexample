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
	<%
		int bno = Integer.parseInt(request.getParameter("bno"));

		//db연결
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // DB -> java로 보내는 객체

		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select * from board where bno=?");
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if (rs.next()) { //resultSet에 데이터가 있으면, next() : 커서를 아래로 내려가게함, 여기서는 데이터 필드를 내려가면서 확인
	%>
	<h1><%=rs.getString("title")%></h1>
	<div><%=rs.getString("content")%></div>
	
	<%
		} else { //그렇지 않으면
						//로그인폼 화면으로 이동
				out.println("<script>");
				out.println("location.href='boardlist.jsp'");
				out.println("</script>");
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
</body>
</html>