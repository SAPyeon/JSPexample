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
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("select * from member where id = ? and password = ?");
		pstmt.setString(1,id);
		pstmt.setString(2,pw);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			session.setAttribute("id", id);
			out.println("<script>");
			out.println("location.href='p_main.jsp'");
			out.println("</script>");
		}else{
			out.println("<script>");
			out.println("location.href='p_login.jsp'");
			out.println("</script>");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
		rs.close();
		pstmt.close();
	}






%>
	
	

</body>
</html>