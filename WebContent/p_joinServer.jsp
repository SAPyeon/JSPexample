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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();

			pstmt = conn.prepareStatement("insert into member(id,password,name, addr) values(?,?,?,?)");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, addr);

			int result = pstmt.executeUpdate();

			if (result !=0) {
				out.println("<script>");
				out.println("location.href='p_login.jsp'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("location.href='p_join.jsp'");
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