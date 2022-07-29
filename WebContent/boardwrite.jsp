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
		//DB연결
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // DB -> java로 보내는 객체 
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();

			pstmt = conn.prepareStatement("select * from board");

			rs = pstmt.executeQuery(); //모든 데이터 반환된 결과를 자바의 변수 rs에 저장함
		} catch (Exception e) {
			//System.out.println("DB연결 실패");
			e.printStackTrace();
		} finally { //메모리를 썼으면 닫아야함
			conn.close();
			rs.close();
			pstmt.close();
		}
	%>

	<form action="boardserver.jsp" >
		<div>
			<label>제목</label> <input type="text" name="title">
		</div>

		<div>
			<label>작성자</label> <span><%=session.getAttribute("id")%></span>
		</div>
		<textarea rows="10px" cols="30px" name="content"></textarea>
		<div>
			<button>작성</button>
		</div>
	</form>
</body>
</html>

