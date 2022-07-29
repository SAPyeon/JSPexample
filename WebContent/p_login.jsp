<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#container {
	margin: 0 auto;
}

form {
	width: 20%;
	margin: 0 auto;
}

input {
	width: 80%;
	margin-bottom: 10px;
}


</style>
</head>
<body>
	<div id="container">
		<form action="p_loginServer.jsp">
			<h1>게시판 이용하기</h1>
			<input type="text" name="id" placeholder="ID">
			<div>
				<input type="password" name="pw" placeholder="PASSWORD">
			</div>
			<button id="button">로그인</button>
			<a href="p_join.jsp">회원가입</a>
		</form>
	</div>
</body>
</html>
