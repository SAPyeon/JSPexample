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
<%
	//사용자가 입력한 id값을 id변수에 저장
	String id = request.getParameter("id");
	//사용자가 입력한 password값을 pw변수에 저장
	String pw = request.getParameter("pw");
	//사용자가 입력한 address값을 addr변수에 저장
	String addr = request.getParameter("addr");
	
	//DB 연결
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();
				
			//회원가입을 하기 위한 sql문장
			//prepareStatement : java -> DB에 쿼리를 보내기 위해 사용하는 객체
			pstmt = conn.prepareStatement("insert into member(id,password,addr) values(?,?,?)");
			//첫번째 물음표에는 사용자가 입력한 id값(request.getParameter("id"))을 설정
			pstmt.setString(1, id);
			//두번째 물음표에는 사용자가 입력한 password값(request.getParameter("pw"))을 설정
			pstmt.setString(2, pw);
			//세번째 물음표에는 사용자가 입력한 addr값(request.getParameter("addr"))을 설정
			pstmt.setString(3, addr);
				//위 sql문장을 실행(workbench : ctrl + enter 로 실행한 것과 동일)
				//executeQuery() : select(select된 결과를 ResultSet라는 공간에 저장해서 반환)
				//executeUpdate() : insert, update, delete
			int result = pstmt.executeUpdate(); //업데이트는 반환값이 없음, 즉, 결과값을 나타낼 필요가 없다. 
		                                       //insert가 되었으면 1, 안되었으면 0으로 result값을 저장
			//insert가 되었으면(회원가입이 되었으면)
			if(result !=0){
				out.println("<script>");
				out.println("location.href='login.jsp'");  //로그인 화면으로 이동
				out.println("</script>");   
			}else{//그렇지 않으면
				out.println("<script>");
				out.println("location.href='member.jsp'"); //회원가입 화면으로 이동
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
		//클라이언트는 회원가입이 안되었을 때 어느 것이 문제인지 알 수 없다.
		//따라서 가입하기 버튼을 누르기 전에 검증을 하기 위해 자바스크립트로 정규식을 설정
		
%>
</head>
<body>

</body>
</html>