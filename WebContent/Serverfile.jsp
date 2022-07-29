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
	//login.jsp에 있는 데이터 수집
	String id = request.getParameter("id"); //id값 변수에 저장
	String pw = request.getParameter("pw"); //pw값 변수에 저장
	
	//콘솔창에 로그인폼에서 입력한 id,pw가 나오는지 확인
	//System.out.println(id); //기본 null값
	//System.out.println(pw); //기본 null값
	
	//DB 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; // DB -> java로 보내는 객체 
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
		conn = ds.getConnection();
			
		//로그인을 하기 위한 sql문장
		//prepareStatement : java -> DB에 쿼리를 보내기 위해 사용하는 객체
		pstmt = conn.prepareStatement("select * from member where id = ? and password = ?");
		//첫번째 물음표에는 사용자가 입력한 id값(request.getParameter("id"))을 설정
		pstmt.setString(1, id);
		//두번째 물음표에는 사용자가 입력한 password값(request.getParameter("pw"))을 설정
		pstmt.setString(2, pw);
			// 위 sql문장을 실행(workbench : ctrl + enter 로 실행한 것과 동일)
			//executeQuery() : select(select된 결과를 ResultSet라는 공간에 저장해서 반환)
			//executeUpdate() : insert, update, delete
		rs = pstmt.executeQuery(); //쿼리에 반환된 결과를 자바의 변수 rs에 저장함
		
		if(rs.next()){ //resultSet에 데이터가 있으면, next() : 커서를 아래로 내려가게함, 여기서는 데이터 필드를 내려가면서 확인
			//login을 해라.
			//session영역에 id값을 유지시킴으로 로그인 된 채로 서비스를 이용
			session.setAttribute("id", id); // 로그인이 된 채로
			//메인페이지로 이동
			out.println("<script>");
			out.println("location.href='main.jsp'");
			out.println("</script>");
		}else{ //그렇지 않으면
			//로그인폼 화면으로 이동
			out.println("<script>");
			out.println("location.href='login.jsp'");
			out.println("</script>");
		}
					
	}catch(Exception e){
		//System.out.println("DB연결 실패");
		e.printStackTrace();
	}
	finally{ //메모리를 썼으면 닫아야함
		conn.close();
		rs.close();
		pstmt.close();		
	}
	
%>
</body>
</html>