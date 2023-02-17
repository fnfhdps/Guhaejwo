<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>내 입양 신청 목록</title>
</head>

<body>
	<jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>

	<div class="main">
	  <div class="">
	    <div class="sideNavGap row">
		  <!-- 마이페이지 목록 -->
		  <jsp:include page="../fix/aside.jsp"></jsp:include>
	
	      <aside class="sidebarNav col-lg-3 col-md-3 col-sm-12 col-xs-12">
	        <div class="list-group sidebar">
	          <a class="list-group-item current" href="#">내정보</a>
	          <a class="list-group-item " href="#">내입양글</a>
	          <a class="list-group-item " href="#">신청목록</a>
	          <a class="list-group-item " href="#">희망자목록</a>
	          <a class="list-group-item " href="#">주문</a>
	          <a class="list-group-item " href="#">비밀번호</a>
	        </div>
	      </aside>
	
	      <section class="sidebarContent col-lg-9 col-md-9 col-sm-12 col-xs-12">
	        <div>
	          <h1 class="pageH1">신청목록</h1>
	
	          <article class="pageBody">
	            <form action="">
	              <!-- 파일 업로드 -->
	              <div class="formGroup">
	                  <table class="table table-bordered">
	                    <thead>
	                    <tr>
	                      <!-- <th class="index">번호</th> -->
	                      <th class="date">신청일</th>
	                      <!-- 제목 일정글자 넘으면 어쩌고...라고 뜨게하기 -->
	                      <th class="title">제목</th>
	                      <th class="person">작성자</th>
	                      <th class="status">상태</th>
	                    </tr>
	                    </thead>
	                    
	                    <tbody>
				          	<c:choose>
				       		  <c:when test="${!empty mysign}">
							    <c:forEach items="${mysign}" var="mysign">
							      <tr>
							        <td class="text-center">${mysign.rownum}</td>
							        <td class="text-center"><fmt:formatDate value="${mysign.boardDate}" pattern="yyyy-MM-dd"/></td>
							        <td class="text-center"><a href="/adopt/detail/ADOPT/${mysign.boardSeq}/${login.userSeq}">${mysign.boardTitle}</a></td>							        
							        <td class="text-center">${mysign.userName}(${mysign.userId})</td>
							        <td class="text-center">${mysign.adoptState}</td>
							      </tr>
							    </c:forEach>
					          </c:when>
						   	  <c:otherwise>
					   		  	<td colspan="4" class="text-center">작성된 게시글이 없습니다.</td>
					   		  </c:otherwise>        
				     	    </c:choose>
	                    </tbody>
	                  </table>
	              </div>
	            </form>
	          </article>
	        </div>
	      </section>
	
	    </div>
	  </div>
	</div>
    
    <jsp:include page="../fix/footer.jsp"></jsp:include>

</body>
</html>