<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Withdraw</title>
</head>
<!-- head.jsp -->
<jsp:include page="head.jsp" />
<body>
	<jsp:include page="header.jsp" />
	<div id="wrap">
		<div class="contentBox contentBoxWithdraw">
			<form action="">
			<div id="content" class="contentWithdraw">
				<div class="title">회원탈퇴</div>
				<p class="contentBoxText">
					회원탈퇴시 회원님의 모든 정보는 삭제되며,<br>
					복구될 수 없습니다.
				</p>
				<div class="btns">
					<div class="confirm" onclick="document.getElementById('confirmButton').click()">
						탈퇴
						<input id="confirmButton" type="button" onclick="doWhat(this.form, 'deleteUser.do')" />
						<input type="hidden" name="id" value="${id}" />
					</div>
					<div class="cancel">
						<a href="modify.do?id=${id}">취소</a>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>