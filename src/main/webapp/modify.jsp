<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Modify</title>
</head>
<jsp:include page="head.jsp" />
<body>
	<jsp:include page="header.jsp" />
	<div id="wrap">
		<div class="contentBox contentBoxModify">
			<form name="joinForm">
			<div id="content" class="contentModify">
				<div class="title">회원정보 수정</div>
				<div class="row">
					<div class="inputBox">
						<label for="idInput">ID</label>
						<input type="text" id="idInput" name="id" title="ID" readonly="readonly" value="${id}"/>
					</div>
				</div>
				<div class="row">
					<div class="inputBox">
						<label for="pwInput">PW</label>
						<input type="password" id="pwInput" name="pw" title="PASSWORD" value="" />
					</div>
				</div>
				<div class="row">
					<div class="inputBox">
						<label for="pwInput">RE</label>
						<input type="password" id="reInput" name="re" title="RETRY" value="" />
					</div>
				</div>
				<div class="btns">
					<div class="confirm" onclick="document.getElementById('confirmButton').click()">
						저장
						<input id="confirmButton" type="button" onclick="doWhat(this.form, 'updateUser.do', true, true)" />
					</div>
					<div class="cancel">
						<a href="myFeed.do?id=${id}">취소</a>
					</div>
				</div>
				<div class="withdraw" onclick="document.getElementById('withdrawButton').click()">
					회원 탈퇴
					<input id="withdrawButton" type="button" onclick="doWhat(this.form, 'withdraw.do')"  />
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>