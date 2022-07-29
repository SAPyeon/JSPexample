<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="MemberServer.jsp">
		<h1>회원가입</h1>
		<table>
			<tr>
				<td>ID:</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>PW:</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td>ADDR:</td>
				<td><input type="text" name="addr"></td>
			</tr>
			<tr>
				<td colspan="2"><button>회원가입</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
