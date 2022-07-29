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
		//System.out.println(bno);

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();

			pstmt = conn.prepareStatement("select * from member m join board b on m.id = b.id where bno = ?");

			pstmt.setInt(1, bno);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
	%>
	<form action="p_boardModify.jsp">
	<h1>상세내용보기</h1>
	<input type="hidden" name="bno" value=<%=rs.getInt("bno")%> name="bno">
	<div>
		<label>제목 :</label> <input type="text"
			value=<%=rs.getString("title")%> name="title">
			<label>조회수 : <%=rs.getInt("cnt")+1 %></label>
	</div>
	<div>
		<label>글쓴이 :</label> <input type="text"
			value=<%=rs.getString("name")%> name="name">
	</div>
	<div>
		<label>내용 :</label>
		<textarea rows="10px" cols="28px" name="content"><%=rs.getString("content")%></textarea>
	</div>
	<%if(rs.getString("m.id").equals((String)session.getAttribute("id"))){%>
	<div>
		<button type="submit">수정하기</button>
		<button type="button" id="btn_d">삭제하기</button>
	</div>
	<%}
	
	%>
	<a href="p_boardlist.jsp">뒤로가기</a>
	</form>
	
	<%
	pstmt.close();
	pstmt = conn.prepareStatement("update board set cnt = cnt+1 where bno = ?");
	pstmt.setInt(1, bno); 
	int result = pstmt.executeUpdate();
		} else {
				out.println("<script>");
				out.println("location.href='p_boardDetail.jsp'");
				out.println("</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			rs.close();
			pstmt.close();
		}
	%>
<script>
		const btn = document.querySelector("#btn_d");
		btn.addEventListener("click", function(e) {
			e.preventDefault();
			location.href = "p_boardDelete.jsp?bno=<%=bno%>"

		})
	</script>

</body>
</html>