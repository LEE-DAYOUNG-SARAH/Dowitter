<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Feed</title>
</head>
<!-- head.jsp -->
<jsp:include page="head.jsp" />
<body>
	<!-- 헤더 include -->
	<jsp:include page="header.jsp" />
	<div id="wrap">
		<section id="myFeedBody">
			<div class="myProfile">
				<p class="myProfileId">@${id}</p>
				<form>
					<div class="myProfileModify" onclick="document.getElementById('modifyButton').click()">
					회원정보수정
					<input id="modifyButton" type="button" name="modify" onclick="doWhat(this.form, 'modify.do')" />
					<input type="hidden" name="id" value="${id}" />
				</div>
				</form>
			</div>
			<div class="myTimeline">
				<form>
				<div class="writeFeed">
					<textarea name="content" id="" cols="30" rows="10" placeholder="아무말이나 적어보세요..!"></textarea>
					<div class="write" onclick="document.getElementById('writeButton').click()">
						글쓰기
						<input type="button" id="writeButton" onclick="doWhat(this.form, 'insertDocF.do', true)" />
						<input type="hidden" name="id" value="${id}" />
					</div>
				</div>
				</form>
				<div class="readFeeds">
					<ul class="feeds">
						<c:forEach items="${list}" var="doc">
							<li class="feed">
							<form name="${doc.num}">
								<div class="feedTitle">
								<a class="feedId" href="">${doc.id}</a>
								<span class="feedDate">${doc.date}</span>
							</div>
							
							<div class="feedContent">${doc.content}</div>
							<div class="feedBtns">
								<div class="feedModify" onclick="showModifier(${doc.num});">
									수정
								</div>
								<div class="feedDelete" onclick="document.getElementById('feedDeleteButton').click()">
									삭제
									<input type="hidden" name="num" value="${doc.num}"/>
									<input type="hidden" name="id" value="${id}" />
									<input id="feedDeleteButton" type="button" onclick="doWhat(this.form, 'deleteDocF.do')" />
								</div>
							</div>
							</form>
							</li>
						</c:forEach>
					</ul>
					<p class="nomore">더 이상 표시할 두윗이 없습니다..! (;ㅅ;)</p>
				</div>		
			</div>
		</section>
	</div>
	<div id="modifierWrap">
		<div class="modifier">
			<div class="modifyWindow">
			<form>
			<input type="hidden" name="num" />
			<input type="hidden" name="id" value="${id}" />
			<div class="writeFeed">
				<textarea name="content" placeholder="아무말이나 적어보세요..!"></textarea>
				<div class="cancelModify" onclick="hideModifier()">
					취소
				</div>
				<div class="modify" onclick="document.getElementById('modifyButton2').click()">
					수정
					<input type="button" id="modifyButton2" onclick="doWhat(this.form, 'updateDocF.do',true)" />
				</div>
			</div>
			</form>
		</div>
		</div>
	</div>
</body>
</html>