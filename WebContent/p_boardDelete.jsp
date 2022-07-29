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

		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();

			pstmt = conn.prepareStatement("delete from board where bno = ?");
			pstmt.setInt(1, bno);

			int result = pstmt.executeUpdate();

			if (result !=0) {
				out.println("<script>");
				out.println("location.href='p_boardlist.jsp'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("location.href='p_boardlist.jsp'");
				out.println("</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			pstmt.close();
		}
	%>
</body>
</html>