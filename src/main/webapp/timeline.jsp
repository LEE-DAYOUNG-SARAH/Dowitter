<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Timeline</title>
</head>
<!-- head.jsp -->
<jsp:include page="head.jsp" />
<body>
	<section id="timelineHeader">
		<div class="safeArea">
			<a href="timeline.do" class="logo">
				<img src="img/dowitter.png" alt="" />
			</a>
			<div class="searchArea">
				<div class="inputArea">
					<label for="">@</label>
					<input type="text" id="search" placeholder="ID" />
					<ul class="selectUserArea">
						<li class="searchedUser">
							<a href="userID">
								@userA
							</a>
						</li>
						<li class="searchedUser">
							<a href="userID">
								@userB
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="userArea">
				
				<!-- 로그인 상태 -->
				<div class="loggedInNow">
					<a href="myFeed.do?id=${id}">@${id}</a>
					<a href="logout.do">로그아웃</a>
				</div>
				
				<!-- 로그아웃상태 -->
				<!-- <div class="loggedOUtNow">
					<a href="goLogin.do">로그인</a>
					<a href="goJoin.do">회원가입</a>
				</div> -->
			</div>
		</div>
	</section>
	<div id="wrap">
		<section id="timelineBody">
			<div class="timeline">
				<form>
				<div class="writeFeed">
					<textarea name="content" id="" cols="30" rows="10" placeholder="아무말이나 적어보세요..!"></textarea>
					<div class="write" onclick="document.getElementById('writeButton').click()">
						글쓰기
						<input type="hidden" name="id" value="${id}" />
						<input type="button" id="writeButton" onclick="doWhat(this.form, 'insertDocT.do',true)" />
					</div>
				</div>
				</form>
				<div class="readFeeds">
					<ul class="feeds">
						<c:forEach items="${list}" var="doc">
							<li class="feed">
							<form name="${doc.num}">
								<div class="feedTitle">
									<a class="feedId">@${doc.id }</a>
									<span class="feedDate">${doc.date }</span>
								</div>
								<div class="feedContent">${doc.content }</div>
								<c:if test="${doc.id eq id}">
									<div class="feedBtns">
										<div class="feedModify" onclick="document.getElementById('feedModifyButton').click()">
											수정
											<input id="feedModifyButton" type="button" onclick="showModifier(${doc.num});" />
										</div>
										<div class="feedDelete" onclick="document.getElementById('feedDeleteButton').click()">
											삭제
											<input type="hidden" name="num" value="${doc.num }"/>
											<input id="feedDeleteButton" type="button" onclick="doWhat(this.form, 'deleteDocT.do')" />
										</div>
									</div>				
								</c:if>
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
			<form name="modifyForm">
			<input type="hidden" name="num" />
			<div class="writeFeed">
				<textarea name="content" placeholder="아무말이나 적어보세요..!"></textarea>
				<div class="cancelModify" onclick="document.getElementById('cancelModifyButton').click()">
					취소
					<input type="button" id="cancelModifyButton" onclick="hideModifier(this.form)" />
				</div>
				<div class="modify" onclick="document.getElementById('modifyButton').click()">
					수정
					<input type="button" id="modifyButton" onclick="doWhat(this.form, 'updateDocT.do',true)" />
				</div>
			</div>
			</form>
		</div>
		</div>
	</div>
</body>
</html>