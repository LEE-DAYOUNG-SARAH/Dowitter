<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Login</title>
</head>
<jsp:include page="head.jsp" />
<body>
	<jsp:include page="header.jsp" />
	<div id="wrap">
		<div class="contentBox contentBoxLogin">
			<form action="">
			<div id="content" class="contentLogin">
				<div class="title">로그인</div>
				<div class="row">
					<div class="inputBox">
						<label for="idInput">ID</label>
						<input type="text" id="idInput" name="id" title="ID" />
					</div>
				</div>
				<div class="row">
					<div class="inputBox">
						<label for="pwInput">PW</label>
						<input type="password" id="pwInput" name="pw" title="PASSWORD"/>
					</div>
				</div>
				<div class="btns alone">
					<div class="confirm" onclick="document.getElementById('confirmButton').click()">
						로그인
						<input id="confirmButton" type="button" onclick="doWhat(this.form, 'login.do', true)" />
					</div>
				</div>
				<div class="textButton">
					<a href="join.do">회원가입</a>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>