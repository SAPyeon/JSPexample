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
		int bno = (Integer)session.getAttribute("bno");
		String title =  request.getParameter("title");
		String content =  request.getParameter("content");
		
		//DB 연결
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement("update board set title= ?, content= ? where bno = ?");
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, bno);
			
			int result = pstmt.executeUpdate(); //쿼리에 반환된 결과를 자바의 변수 rs에 저장함
			
			if (result != 0) {
				out.println("<script>");
				out.println("location.href='boardcontent.jsp?bno="+bno+"'"); //게시판 목록 화면으로 이동
				out.println("</script>");
				//System.out.println("성공");
			} else {//그렇지 않으면
				out.println("<script>");
				out.println("location.href='replaceform.jsp'"); //글쓰기 화면으로 이동
				out.println("</script>");
			}
		} catch (Exception e) {
			//System.out.println("DB연결 실패");
			e.printStackTrace();
		} finally { //메모리를 썼으면 닫아야함
			conn.close();
			pstmt.close();
		}
	%>

</body>
</html>