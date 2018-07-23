<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 리스트</title>
</head>
<body>

 <div class="panel-body">
      <table class="table">
	    <thead>
	      <tr>
	        <th>이름</th>
	        <th>아이디</th>
	        <th>나이</th>
	        <th>주소</th>
	        <th>회원등급</th>
	        <th>보유금액</th>
	      </tr>
	    </thead>
	    <tbody>
	    <!-- 데이터 만큼 반복 시작 -->
	    <c:forEach items="${list }" var="dto">
	      <tr class="data">
	        <td>${dto.name }</td>
	        <td>${dto.email }</td>
	        <td>${dto.age }</td>
	        <td>${dto.addr }</td>
	        <td>${dto.grade }</td>
	        <td>${dto.money }</td>
	      </tr>
	    </c:forEach>
	    <!-- 데이터 만큼 반복 끝 -->
	    </tbody>
	    <tfoot>
	    	<tr>
	    		<td colspan="5">
		    		<ul class="pagination">
		    		<c:if test="${cri.prev }">
					  <li>
					  	<a href="list.do?page=${cri.startPage-1 }&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">
					  		<i class="glyphicon glyphicon-step-backward"></i>
					  	</a>
					  </li>
					</c:if>
		    		<c:forEach begin="${cri.startPage }"
		    		 end="${cri.endPage }" var="idx">
					  <li ${cri.page==idx?" class='active' ":"" }>
					  	<a href="list.do?page=${idx }&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx }</a>
					  </li>
					</c:forEach>
					<c:if test="${cri.next }">
					  <li>
					  	<a href="list.do?page=${cri.endPage+1 }&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">
					  		<i class="glyphicon glyphicon-step-forward"></i>
					  	</a>
					  </li>
					 </c:if>
					</ul>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td colspan="5">
	    			<button id="reloadBtn">새로고침</button>
	    		</td>
	    	</tr>
	    </tfoot>
	  </table>
    </div>

</body>
</html>