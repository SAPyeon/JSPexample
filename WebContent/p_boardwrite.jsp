<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="p_boardServer.jsp">
		<h1>글쓰기</h1>
		<div>
			<label>제목 :</label> <input type="text" placeholder="제목" name="title">
		</div>
		<label>내용 :</label>
		<textarea rows="20px" cols="50px" name="content"></textarea>
		<div>
			<button type="submit">글쓰기</button>
			<button type="button" id="btn">목록으로</button>
		</div>
	</form>
	<script>
		const btn = document.querySelector("#btn");
		btn.addEventListener("click", function(e) {
			e.preventDefault();
			location.href = "p_boardlist.jsp"

		})
	</script>
</body>
</html>