<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//한글깨짐
	request.setCharacterEncoding("UTF-8");

	//데이터수집
	String title = request.getParameter("title"); 
	
	String content = request.getParameter("content");
	
	String id = request.getParameter("id");
	
	//콘솔창에 로그인폼에서 입력한 title,content가 나오는지 확인
	//System.out.println(title); //기본 null값
	//System.out.println(content); //기본 null값
	
	//DB 연결
	Connection conn = null;
	PreparedStatement pstmt = null; 
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("insert into board(title, content, id) values(?,?,?)");
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3,(String)session.getAttribute("id"));
		
		int result = pstmt.executeUpdate(); //쿼리에 반환된 결과를 자바의 변수 rs에 저장함, 저장 성공시 1, 실패시 0이 나옴
		
		if(result==1){
			out.println("<script>");
			out.println("location.href='boardlist.jsp'");  //게시판 목록 화면으로 이동
			out.println("</script>");   
		}else{//그렇지 않으면
			out.println("<script>");
			out.println("location.href='boardwrite.jsp'"); //글쓰기 화면으로 이동
			out.println("</script>"); 
		}
	}catch(Exception e){
		//System.out.println("DB연결 실패");
		e.printStackTrace();
	}
	finally{ //메모리를 썼으면 닫아야함
		conn.close();
		pstmt.close();		
	}
	
	
%>
</body>
</html>