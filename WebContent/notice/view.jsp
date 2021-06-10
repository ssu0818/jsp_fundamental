<!-- view.jsp -->
<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp" %>
	<!-- breadcrumb start -->
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/index.jsp">홈</a></li>
			<li class="breadcrumb-item">공지사항</li>
		</ol>
	</nav>
	<!-- breadcrumb end -->
	
	<!-- container start -->
  	<div class="container">
  		<!-- col start -->
  		<div class="row">
	  		<div class="col-md-12">
	  		<h5>공지사항 보기</h5>
	  		<%-- form start --%>
			<form name="noticeForm" method="post" action="savdDb.jsp">
				<div class="form-group">
					작성자 : 이름1
				</div>
				<div class="form-group">
					제목 : 제목1
				</div>
				<div class="form-group">
					내용 : 내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1
				</div>
			</form>
			<div class="text-right">
				<a class="btn btn-secondary" href="list.jsp" role="button">목록</a>
				<a class="btn btn-success" href="modify.jsp" role="button">수정</a>
				<a class="btn btn-danger" id="deleteNotice" role="button">삭제</a>
			</div>
			<%-- form end --%>
		</div>
  		</div>
  		<!-- col end -->
  	</div>
  	<!-- container end -->
<%@ include file="../inc/footer.jsp" %>