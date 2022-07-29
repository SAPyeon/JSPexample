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
<h1>회원목록리스트</h1>
	<table>
	<tr><td>아이디</td><td>주소</td><td>폰번호</td><td>이메일</td><td>이름</td>
	</tr>
<%
		//DB연결
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // DB -> java로 보내는 객체 

		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();
			//로그인을 하기 위한 sql문장
			//prepareStatement : java -> DB에 쿼리를 보내기 위해 사용하는 객체
			pstmt = conn.prepareStatement("select * from member");
			//executeQuery() : select(select된 결과를 ResultSet라는 공간에 저장해서 반환)
			//executeUpdate() : insert, update, delete
			rs = pstmt.executeQuery(); //모든 데이터 반환된 결과를 자바의 변수 rs에 저장함
			while(rs.next()){ //resultSet에 데이터가 있으면, next() : 커서를 아래로 내려가게함, 여기서는 데이터 필드를 내려가면서 확인
%>			
		<tr>
			<td><%=rs.getString("id") %></td>
			<td><%=rs.getString("addr") %></td>
			<td><%=rs.getString("phone") %></td>
			<td><%=rs.getString("email") %></td>
			<td><%=rs.getString("name") %></td>
		</tr>							

<%			
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

</body>
</html>