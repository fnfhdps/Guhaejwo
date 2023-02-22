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

<title>관리자: 주문관리</title>
</head>

<!-- 관리자 role인지 확인하기 -->
<body>
  <!-- 관리자페이지 헤더 -->
  <jsp:include page="../fix/admin_header.jsp"></jsp:include>
  
  <div class="container-fluid">
    <div class="row">
    <!-- 관리자페이지 목록 -->
    <jsp:include page="../fix/admin_nav.jsp"></jsp:include>
  
      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-5 mt-4">
        <div class="chartjs-size-monitor">
          <div class="chartjs-size-monitor-expand">
            <div class=""></div>
          </div>
          <div class="chartjs-size-monitor-shrink">
            <div class=""></div>
          </div>
        </div>
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">주문관리</h1>
        </div>

        <section class="member_container">
          <article class="member_content member_size pageBody">
            <div class="mb-4">
              <input class="form-control" type="text" placeholder="Search" type="text" name="" id="">
            </div>
  
            <div class="d-flex comment_title tbl_caption">
              <div class="mt-2">
                <span>주문수</span>
                <span>${totalCnt}</span>
              </div>
              
              <nav aria-label="Page navigation example">
                <ul class="pagination">
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav>
            </div>
  
            <div class="table_content">
              <table class="table">
                <thead>
                  <tr>
                    <th class="">주문번호</th>
                    <th class="">주문자</th>
                    <th class="">상품명</th>
                    <th class="">갯수</th>
                    <th class="">결제금액</th>
                    <th class="">결제일시</th>
                    <th class="">주문상태</th>
                  </tr>
                </thead>
                
                <tbody>
	          	<c:choose>
	       		  <c:when test="${!empty sponsorList}">
				    <c:forEach items="${sponsorList}" var="sponsor">
	                  <tr>
	                    <td class="text-center">${sponsor.num}</td>
	                    <td class="text-center">${sponsor.sponsorItemName}</td>
	                    <td class="text-center">${sponsor.sponsorItemName}</td>
	                    <td class="text-center">${sponsor.sponsorAmount}</td>
	                    <td class="text-center">${sponsor.sponsorTotalPrice}</td>
	                    <td class="text-center"><fmt:formatDate value="${sponsor.sponsorDate}" pattern="yyyy.MM.dd HH:mm"/></td>
	                    <!-- 셀렉트랑 드롭다운중에 뭐할지 -->
	                    <td class="text-center dropdown">
	                      <span class="fw-bold"
	                            id="dropdownMenuButton1"
	                            data-bs-toggle="dropdown"
	                            aria-expanded="false">
	                            	${sponsor.sponsorState}
	                      </span>
	                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	                        <li><a class="dropdown-item" href="#">상품준비중</a></li>
	                        <li><a class="dropdown-item" href="#">배송대기중</a></li>
	                        <li><a class="dropdown-item" href="#">배송중</a></li>
	                        <li><a class="dropdown-item" href="#">배송완료</a></li>
	                      </ul>
	                    </td>
	                  </tr>
				    </c:forEach>
		          </c:when>
			   	  <c:otherwise>
		   		  	<td class="text-center" colspan="4">1:1 문의 내역이 없습니다.</td>
		   		  </c:otherwise>        
	     	    </c:choose>
                </tbody>
                
              </table>
            </div>
          </article>

          <article class="sponsor_art member_content member_size pageBody css-y8viq9 ezu2kv83">
            <div class="css-py8xgp ezu2kv82">
              <div>배송지 정보</div>
            </div>
            <div class="css-1h47j8n ezu2kv80">
              <div class="css-zjik7 eukl7io4">
                <div class="css-17fh4sh eukl7io3">
                  <div class="css-k8dhob e1fwbpos2">
                    <div class="css-xlcpif e1fwbpos1">받는 사람</div>
                    <div class="css-cqduba e1fwbpos0">${sponsorDetail.sponsorName}</div>
                  </div>
                  <div class="css-k8dhob e1fwbpos2">
                    <div class="css-xlcpif e1fwbpos1">연락처</div>
                    <div class="css-cqduba e1fwbpos0">${sponsorDetail.sponsorPhone}</div>
                  </div>
                    <div class="css-k8dhob e1fwbpos2">
                      <div class="css-xlcpif e1fwbpos1">주소</div>
                      <div class="css-cqduba e1fwbpos0">${sponsorDetail.sponsorShippingAddr}</div>
                    </div>
                    <div class="css-k8dhob e1fwbpos2">
                      <div class="css-xlcpif e1fwbpos1">배송메모</div>
                      <div class="css-cqduba e1fwbpos0">${sponsorDetail.memo}</div>
                    </div>
                  </div>
                </div>
              </div>
          </article>
    
          <article class="sponsor_art member_content member_size pageBody  css-y8viq9 ezu2kv83">
            <div class="css-py8xgp ezu2kv82">
              <div>결제정보</div>
            </div>
            <div class="css-1h47j8n ezu2kv80">
              <div class="css-vqaf4p ekrx5n62">
                <div class="css-17fh4sh ekrx5n61">
                  <div class="css-k8dhob e1fwbpos2">
                    <div class="css-xlcpif e1fwbpos1">상품금액</div>
                    <div class="css-17qztlv e1fwbpos0">${sponsorDetail.sponsorTotalPrice}원</div>
                  </div>
                  <div class="css-k8dhob e1fwbpos2">
                    <div class="css-xlcpif e1fwbpos1">배송비</div>
                    <div class="css-17qztlv e1fwbpos0">(+) 0원</div>
                  </div>
                  <div class="css-k8dhob e1fwbpos2">
                    <div class="css-xlcpif e1fwbpos1">결제금액</div>
                    <div class="css-17qztlv e1fwbpos0">${sponsorDetail.sponsorTotalPrice}원</div>
                  </div>
                  <div class="css-k8dhob e1fwbpos2">
                    <div class="css-xlcpif e1fwbpos1">결제방법</div>
                    <div class="css-17qztlv e1fwbpos0">${sponsorDetail.payment}</div>
                  </div>
                </div>
                <div class="css-17fh4sh ekrx5n61">
                  <div class="css-k8dhob e1fwbpos2">
                    <div class="css-xlcpif e1fwbpos1">주문자</div>
                    <div class="css-17qztlv e1fwbpos0">김지수</div>
                  </div>
                  <div class="css-k8dhob e1fwbpos2">
                    <div class="css-xlcpif e1fwbpos1">연락처</div>
                    <div class="css-17qztlv e1fwbpos0">010-1111-2222</div>
                  </div>
                  <div class="css-k8dhob e1fwbpos2">
                    <div class="css-xlcpif e1fwbpos1">이메일</div>
                    <div class="css-17qztlv e1fwbpos0">sffdg12@naver.com</div>
                  </div>
                </div>
              </div>
            </div>
          </article>

        </section>

      </main>
    </div>
  </div>
</body>
</html>