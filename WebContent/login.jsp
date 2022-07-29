<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Serverfile.jsp">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" placeholder="아이디" name="id"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" placeholder="비밀번호" name="pw"></td>
			</tr>
			<tr>
				<td colspan="2"><button id="btn_login">로그인</button>
				<a href="member.jsp">회원가입</a>
				</td>
			</tr>
		
		</table>
	</form>
</body>
</html>