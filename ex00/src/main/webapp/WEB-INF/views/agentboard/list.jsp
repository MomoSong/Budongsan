<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 리스트</title>

<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->


<style type="text/css">
.col-md-4 {
	border: 1px solid gray;
}
.data:hover {
	background: #eee; cursor: pointer;
}
fieldset {
	color: white; background-color:black; font-size: 30pt; font-style: italic;
}
th {
	color: white; background-color:black; font-size: 13pt;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		// 버튼 이벤트 처리
		// 글쓰기 버튼
		$("#writeBtn").click(function(){
			location = "write.do";
		});
		
		// 새로고침 버튼
		$("#reloadBtn").click(function(){
			location.reload();
		});
		
		// 게시글에 대한 tr 이벤트 처리
		$(".data").click(function(){
			var no = $(this).find("div:first").text();
			location = "view.do?no="+no // 글번호 전달
					+"&page=${cri.page}" // 페이지 전달한다.
					+"&perPageNum=${cri.perPageNum}"
					+"&searchType=${cri.searchType}"
					+"&keyword=${cri.keyword}"
					; // 페이지 당 글수 전달
		});
		
		// 표시하는 글수를 바꾸면 이벤트 처리를 해서 다시 리스트를 불러온다.
		$("#perPageNum").change(function(){
// 			alert("select change!");
			location="list.do?"
				+"page=1" // 1페이지 전달한다.
				+"&perPageNum="+$("#perPageNum").val()
				+"&searchType=${cri.searchType}"
				+"&keyword=${cri.keyword}"
				; // 페이지 당 글수 전달
		});
		
		// 글등록 후 경고
		${(msg == "writeOK")?"alert('글등록이 완료되었습니다.');":""}
		// 글삭제 후 경고
		${msg == "deleteOK"?"alert('글삭제가 완료되었습니다.');":""}
	});
</script>
</head>
<body>
<div class="container">
  <div class="panel panel-default">
  <fieldset align="center">
	<strong>지역별 추천방</strong>
</fieldset>
    <div class="panel-heading">
    	<span>게시판 리스트</span>
    	<select name="perPageNum" id="perPageNum">
    		<option ${cri.perPageNum == 9?"selected='selected'":"" }>9</option>
    		<option ${cri.perPageNum == 12?"selected='selected'":"" }>12</option>
    		<option ${cri.perPageNum == 15?"selected='selected'":"" }>15</option>
    	</select>
    	<form class="navbar-form" >
			 <div class="form-group navbar-left">
				 <select class="form-control navbar-left list-group"
				  name="searchType">
					 <option value="n">----</option>
					 <option value="t" 
					 ${cri.searchType == "t"?"selected='selected'":"" } 
					 >보증금/월세</option>
					 <option value="c"
					 ${cri.searchType == "c"?"selected='selected'":"" } 
					 >내용</option>
					 <option value="a"
					 ${cri.searchType == "a"?"selected='selected'":"" } 
					 >주소</option>
					 <option value="tc"
					 ${cri.searchType == "tc"?"selected='selected'":"" } 
					 >보증금/월세+내용</option>
					 <option value="ca"
					 ${cri.searchType == "ca"?"selected='selected'":"" } 
					 >내용+주소</option>
					 <option value="tca"
					 ${cri.searchType == "tca"?"selected='selected'":"" } 
					 >보증금/월세+내용+주소</option>
				 </select> 
				 <input type="text" class="form-control navbar-left "
				  placeholder="Search" name="keyword"
				  value="${cri.keyword }">
			 </div>
			 <button type="submit" class="btn btn-default">
			 <i class="glyphicon glyphicon-search"></i>
			 </button>
		</form>
    </div>
    
    <div class="panel-body">
     <p class = "allPost" align="right" style="background-color:black; color: white; font-size: large;"> 
     	전체 글: &nbsp; <strong> <c:out value ="${cri.totalCount} " /> </strong> 개 </p>
      <table class="table">
	    <!-- 데이터 만큼 반복 시작 -->
	    <c:forEach items="${list }" var="dto">
	      <div class="col-md-4">
	        <div class="data">
	          <div>${dto.no } </div><br>
	          <div style="font-weight: bold; color: red">보증금/월세-${dto.title } </div><br>
	          <div style="font-weight: bold">방구조-${dto.type }</div><br>
	          <div>주소-${dto.addr1 }</div><br>
	          <div>조회수-${dto.hit }</div><br>
	        </div>
	      </div>
	    </c:forEach>
	    
	    
	    <!-- 데이터 만큼 반복 끝 -->
<!-- 	    </tbody> -->
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
	    			<button id="writeBtn">글쓰기</button>
	    			<button id="reloadBtn">새로고침</button>
	    		</td>
	    	</tr>
	    </tfoot>
	  </table>
    </div>
  </div>
 </div>


</body>
</html>