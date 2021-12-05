<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!-- be included to login.jsp / join.jsp / modify.jsp / myFeed.jsp -->
<header>
	<section id="headerArea">
		<a href="timeline.do" class="logo">
			<img src="img/dowitter.png" alt="" />
		</a>
		
		<c:if test="${not empty id}">
			<a href="logout.do" class="logout">·Î±×¾Æ¿ô</a>
		</c:if>
	</section>
</header>