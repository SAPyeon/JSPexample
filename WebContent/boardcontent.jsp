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
		session.setAttribute("bno", bno);
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//db연결
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // DB -> java로 보내는 객체

		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select title,id,content,cnt from board where bno=?");
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if (rs.next()) { //resultSet에 데이터가 있으면, next() : 커서를 아래로 내려가게함, 여기서는 데이터 필드를 내려가면서 확인
	%>
	<div>
			<label>제목</label> <input type="text" name="title" value=<%=rs.getString("title")%> disabled>
		</div>
		<div>
			<label>작성자</label> <span><%=rs.getString("id")%></span>
		</div>
		<textarea rows="10px" cols="30px" name="content" disabled><%=rs.getString("content")%></textarea>
	<div>조회수 : <%=rs.getInt("cnt")+1 %></div>
	
	<%	
		session.setAttribute("title", rs.getString("title"));
		session.setAttribute("content", rs.getString("content"));
		//System.out.println(rs.getString("id"));
		//System.out.println(session.getAttribute("id"));
		if (rs.getString("id").equals((String) session.getAttribute("id"))) {
	%>

	<a href="replaceform.jsp?bno=<%=session.getAttribute("bno")%>">수정</a>
	<a href="delete.jsp">삭제</a>
	<div>
	<a href="boardlist.jsp">뒤로가기</a>
	</div>
	<%
		} else {
	%>
	<span>수정</span>
	<span>삭제</span>
	<div>
	<a href="boardlist.jsp">뒤로가기</a>
	</div>
	<%
		}
		pstmt.close();
		pstmt = conn.prepareStatement("update board set cnt=cnt+1 where bno = ?");
		pstmt.setInt(1, bno);
		int rs2 = pstmt.executeUpdate();
		session.setAttribute("bno", bno);
			} else { //그렇지 않으면
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
