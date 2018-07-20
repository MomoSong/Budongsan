<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글보기</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- <link href="/resources/css/carousel.css" rel="stylesheet"> -->


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>게시판 뷰</title>



<script type="text/javascript">
	$(document).ready(function() {

		// 버튼 이벤트 처리
		// 수정 버튼
		$("#updateBtn").click(function() {
			$("#dataForm").attr("action", "update.do");
			// form.submit() 넘긴다.
			$("#dataForm").submit();
		});

		// 삭제 버튼
		$("#deleteBtn").click(function() {
			if (confirm("정말 삭제하시겠습니까?"))
				location = "delete.do?id=${dto.id}";
		});

		// 리스트 버튼
		$("#listBtn").click(function() {
			// 			location="list.do";
			// 폼에서 글번호 제거
			$("#id").attr("disabled", "disabled");
			$("#dataForm").attr("action", "list.do");
			$("#dataForm").submit();
		});

		//글 수정 후 경고
		$
		{
			msg == "updateOK" ? "alert('수정이 완료되었습니다.')" : ""
		}

		$('.carousel').carousel()

	});
</script>
</head>
<body>
	<!-- 넘겨야할 데이터를 uri 뒤에 붙이지 않고 form 태그 사용해서 넘기기 :update, list
		update : 글번호, 한페이지의 데이터 갯수, 페이지, 검색 타입, 검색어
		list : 한페이지의 데이터 갯수, 페이지, 검색 타입, 검색어
-->
	<form id="dataForm">
		<input name="id" value="${param.id }" type="hidden" id="id"> <input
			name="page" value="${param.page }" type="hidden"> <input
			name="perPageNum" value="${param.perPageNum }" type="hidden">
		<input name="searchType" value="${param.searchType }" type="hidden">
		<input name="keyword" value="${param.keyword }" type="hidden">
	</form>

	</br>
	</br>

		<div class="container">
		<h3><strong>${dto.title} </strong></h3>
		<hr>
		</div>
<!-- 	<div class="row"> -->
<!-- 		<div class="col-xs-12 col-md-8"></div> -->
<!-- 		<div class="col-xs-6 .col-md-4"> -->
<!-- 			<h1 class="my-4">사용자 아이디</h1> -->
<!-- 			           <div class="list-group">  -->
<!-- 			<p>사용자 정보가 들어올 공간</p> -->
<!-- 			<button id="updateBtn" class="btn btn-success mr-auto">결제</button> -->
<!-- 			<button id="listBtn" class="btn btn-danger mr-auto">뒤로가기</button> -->

<!-- 			<!--             <a href="#" class="list-group-item active">Category 1</a>  -->
<!-- 			<!--             <a href="#" class="list-group-item">Category 2</a>  -->
<!-- 			<!--             <a href="#" class="list-group-item">Category 3</a>  -->
<!-- 			<!--         -->   -->
<!-- 			</div>  -->
<!-- 		</div>  -->
<!-- 	</div> -->
	

	<div class="container">
		<h1> </h1>
		
	
	
		<div class="col-xs-12 col-sm-6 col-md-8">
			<div class="card mt-4">


				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="/resources/saveImage/식탁입니다4.jpg" alt="Chania">
						</div>
						<div class="item">
							<img src="/resources/saveImage/식탁입니다4.jpg" alt="Chania">	
						</div>
						<div class="item">
							<img src="/resources/saveImage/식탁입니다4.jpg" alt="Flower">
						</div>
						<div class="item">
							<img src="/resources/saveImage/식탁입니다4.jpg" alt="Flower">
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
				
				

				<div class="card-body">
					<h1 class="card-title">
						<strong>${dto.makecp } </strong>
					</h1>
					<hr>
					<h2 class="card-title">
						판매가: <span class='text-danger'>${dto.price }원</span>
					</h2>
					<span class="text-warning">&#9733; &#9733; &#9733; &#9733;
						&#9734;</span> 4.0 stars
					<h3>
						상품 정보: <span class='text-muted'>${dto.content }</span>
					</h3>
					<h3>
						모델명: <span class='text-muted'>${dto.model_id }</span>
					</h3>
					</br>

				</div>
			</div>


			<div class="card card-outline-secondary my-4">
				<div class="card-header">
					<hr>
					<h4>구매자의 상품 평가</h4>
				</div>

				<div class="card-body">
					<p>구매자의 상품평</p>
					<small class="text-muted">아이디, 2018.07.18</small>
					<hr>
				</div>
			</div>

			<button id="updateBtn" class="btn btn-success">수정</button>
			<button id="deleteBtn" class="btn btn-warning">삭제</button>
			<button id="listBtn" class="btn btn-danger">뒤로가기</button>
		</div>
	</div>
	
	
	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2017</p>
		</div>
		<!-- /.container -->
	</footer>
</body>
</html>