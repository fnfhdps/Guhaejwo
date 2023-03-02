<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
<title>입양 목록 조회</title>
</head>
<style>
 .adopt_img{
 	width: 40px;
 	height: 40px;
 }
 .pageInfo{
	list-style : none;
	display: inline-block;
	margin: 50px 0 0 100px;      
 }
 .pageInfo li{
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
 }
 .active{
	background-color: #cdd5ec;
 }
 .search_area{
	display: inline-block;
	margin-top: 30px;
	margin-left: 260px;
 }
 .search_area input{
	height: 30px;
	width: 250px;
 }
 .search_area button{
	width: 100px;
	height: 36px;
 }
 
 .adoptSize{
 	width: 70px;
 }
 
 #gnb-root ._1knjz49b {
    line-height: 1.4;
    font-size: 1.4rem;
    background-color: var(--seed-scale-color-gray-100);
    box-sizing: border-box;
    height: 4rem;
    padding: 0.9rem 1.2rem;
    border: none;
    border-radius: 0.6rem;
    width: 100%;
    color: var(--seed-scale-color-gray-900);
}
.search_wrap, .pageInfo_wrap {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

/* 검색부분 */
.section {
  margin-bottom: 40px;
}
.hero {
  background-position: center;
  background-size: cover;
  height: 300px;
  padding: 0 20px;
  text-align: center;
  width: 100%;
  background-color: blanchedalmond;
}
.hero-inner {
  position: relative;
  top: 50%;
  transform: translateY(-50%);
  max-width: 610px;
  margin: 0 auto;
}
.search {
  position: relative;
}
.search input{
  line-height: normal;
  font-size: 14px;
  font-weight: 300;
  max-width: 100%;
  box-sizing: border-box;
  outline: none;
  transition: border .12s ease-in-out;
}
.search input[type="search"] {
  border: 1px solid #ddd;
  border-radius: 30px;
  box-sizing: border-box;
  color: #999;
  height: 40px;
  padding-left: 40px;
  padding-right: 20px;
  /* -webkit-appearance: none; */
  width: 100%;
}
.search-full input[type="search"] {
  border: 1px solid #fff;
}
.search::before {
  line-height: 1em;
  vertical-align: middle;
  -webkit-font-smoothing: antialiased;
  top: 50%;
  transform: translateY(-50%);
  background-color: #fff;
  color: #777;
  content: "\1F50D";
  font-size: 18px;
  position: absolute;
  left: 15px;
}
</style>
<body>

	
<div class="wrap">

	<jsp:include page="../fix/header.jsp"></jsp:include>
	
	  <section class="hero">
	    <div class="hero-inner">
	      <form role="search" class="search search-full">
	       <!--  <input name="keyword" type="hidden" value="✓" autocomplete="off"> -->
	        <input type="search"
	        		name="keyword"
	        		id="query"
	        		placeholder="검색"
	        		autocomplete="off"
	        		aria-label="검색"
	        		value="${pageMaker.cri.keyword}">
	      </form>
	    </div>
	  </section>
	
	<section class="container-xxl py-5">
		<div class="search_wrap adopt_list_interface" style="vertical-align:middle; text-align:middle;">
	       	<div class="container px-4 px-lg-5 mt-5">
				<input class="form-check-input mx-2 p-3" type="checkbox" id="flexCheckDefault" style="float:left;" name="keyword2" value="WAIT">
				<label class="form-check-label my-2" for="flexCheckDefault">입양대기만 보이기</label>
				
		       <select class="form-select" id="select-search" name="keyword3" aria-label="Default select example" style="float:right; margin-left:10px; width:30%" value="${pageMaker.cri.keyword3 }">
					<option selected>지역을 선택하세요</option>
					<option value="수도권">수도권</option>
					<option value="강원권">강원권</option>
					<option value="충청권">충청권</option>
					<option value="전라권">전라권</option>
					<option value="경상권">경상권</option>
					<option value="제주권">제주권</option>
			   </select>
			</div>
	   	</div>   
		
	    <div class="container px-4 px-lg-5 mt-5">
	        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

	            <c:forEach items="${list}" var="list">

	            <div class="col mb-5" >
	                <div class="card h-100">
		                <c:choose>
		                  <c:when test="${list.adoptState eq 'WAIT'}">
			                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">입양대기</div>
		                  </c:when>
		                  <c:otherwise>
		                  	<div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">입양완료</div>
		                  </c:otherwise>
		                </c:choose>
	                    <a class="loginCheck" href="/adopt/detail/${list.boardCategory}/${list.boardSeq}/${login.userSeq}">
	                    	<img class="card-img-top" style="height: 200px" alt="" src="/resources/image/adopt/${list.adoptImg}">
	                    </a>
	                    <div class="card-body p-3">
							<div class="text-center">
								<h5 class="fw-bolder">${list.boardTitle}</h5>
								<p>${list.adoptKind}</p>
								<p class="m-0">${list.adoptAddr}</p>
							</div>
						</div>
	                </div>
	            </div>

	            </c:forEach>

	        </div>
	    </div>
	    
	    <div>
		    <div class="container px-4 px-lg-5 mt-1 text-end">
				<a href="/adopt/new" style="width:150px; height:40px;" class="btn btn-outline-dark pt-2">글쓰기</a>
			</div>
		     
		    <div class="pageInfo_wrap" >
	        	<div class="pageInfo_area">
	        		<ul id="pageInfo" class="pageInfo">
		                <!-- 이전페이지 버튼 -->
		                <c:if test="${pageMaker.prev}">
		                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
		                </c:if>
		        		<!-- 각 번호 페이지 버튼 -->
		                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
		                </c:forEach>
		                <!-- 다음페이지 버튼 -->
		                <c:if test="${pageMaker.next}">
		                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
		                </c:if>    
	        		</ul>
	        	</div>
	    	</div>
    	</div>
    	
	</section>	
	
    <jsp:include page="../fix/footer.jsp"></jsp:include>

	<form id="moveForm" method="get">
	    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
        <input type="hidden" name="keyword2" value="${pageMaker.cri.keyword2}">
        <input type="hidden" name="keyword3" value="${pageMaker.cri.keyword3}">
	</form>
	<input type="hidden" id="userSeq" value="${login.userSeq}">
	
</div>

<script>
let moveForm = $("#moveForm");

$(".move").on("click", function(e){
	e.preventDefault();
	moveForm.append("<input type='hidden' name='boardSeq' value='"+$(this).attr("href")+ "'>");
	moveForm.attr("action", "/adopt/get");
	moveForm.submit();
});

$(".pageInfo a").on("click", function(e){
       e.preventDefault();
       moveForm.find("input[name='pageNum']").val($(this).attr("href"));
       moveForm.attr("action", "/adopt/list");
       moveForm.submit();
   });

// 검색 js
$("input[type='search']").on("keyup", function(e){
    // 엔터키 눌렀을 때 이벤트 실행
	if(key.keyCode==13) {
       e.preventDefault();
       let val = $("input[name='keyword']").val();
       moveForm.find("input[name='keyword']").val(val);
       moveForm.find("input[name='pageNum']").val(1);
       moveForm.submit();
    }
   });

$("#select-search").on("change", function(e){
	alert('fffffffffff');
   });

// 로그인 체크후 게시글 상세 이동
const loginCkeck2 = $("#userSeq").val();
$("a.loginCheck").click(function () {
	if (loginCkeck2 == 0) {
		alert("로그인 후 열람 가능");
		return false;
	}
});

$("input:checkbox").click(function(e) {
	if($(this).is(":checked")){
		alert('aa');
	}else {
		alert('bb');
	}
});
</script>
</body>

</html>