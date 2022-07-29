<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="p_joinServer.jsp" id = "form">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" id="id"></td>
				<td><span id="s_id"></span></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pw" id="pw"></td>
				<td><span id="s_pw"></span></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name"></td>
				<td><span id="s_name"></span></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" id="addr"></td>
				<td><span id="s_addr"></span></td>
			</tr>
			<tr>
				<td><button id="btn_join">가입하기</button></td>
			</tr>
		</table>
	</form>
	<script>
		const id = document.querySelector('#id');
		id.addEventListener('blur', function checkid() {

			const spanid = document.querySelector('#s_id');
			const regExp = /^[a-z]{1}[a-z0-9-_]{3,19}$/g;
			if (regExp.test(id.value)) {
				spanid.innerHTML = "사용가능한 아이디입니다."
				spanid.style.color = 'green'

			} else {
				spanid.innerHTML = "5~20글자로 입력하세요"
				spanid.style.color = 'red'
				id.value = ''
			}
		})
		const pw = document.querySelector('#pw');
		pw.addEventListener('blur', function checkpw() {
			const spanpw = document.querySelector('#s_pw');
			const regExp = /^[a-zA-Z0-9\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]{4,16}$/g;
			if (regExp.test(pw.value)) {
				spanpw.innerHTML = "사용가능한 비밀번호 입니다."
				spanpw.style.color = 'green'

			} else {
				spanpw.innerHTML = "4글자 이상 16글자 이하로 입력하세요"
				spanpw.style.color = 'red'
				pw.value = ''
			}
		})
		const name = document.querySelector('#name');
		name.addEventListener('blur', function checkname() {
			const spanname = document.querySelector('#s_name');
			const regExp = /^[가-힣a-zA-Z]{1,10}/g;
			if (regExp.test(name.value)) {
				spanname.innerHTML = "사용가능한 이름입니다."
				spanname.style.color = 'green'

			} else {
				spanname.innerHTML = "한글자 이상 입력하세요"
				spanname.style.color = 'red'
				name.value = ''
			}
		})
		const addr = document.querySelector('#addr');
		addr.addEventListener('blur', function checkaddr() {
			const spanaddr = document.querySelector('#s_addr');
			const regExp = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]{1,50}/g;
			if (regExp.test(addr.value)) {
				spanaddr.innerHTML = "사용가능한 주소입니다."
				spanaddr.style.color = 'green'
				
			} else {
				spanaddr.innerHTML = "한글자 이상 입력하세요"
				spanaddr.style.color = 'red'
				addr.value = ''
			}
		})
		
		const submit = document.querySelector('#btn_join')
		submit.addEventListener('click',function(e){
			if(id.value ===''|| pw.value ===''||name.value ===''||addr.value ===''){
				e.preventDefault();
				alert('제대로 입력하세요');
			}
		})
	
	
	</script>
</body>
</html>