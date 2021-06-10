<!-- modify.jsp -->
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
	  		<h5>공지사항 수정</h5>
	  		<%-- form start --%>
			<form name="noticeForm" method="post" action="modifyDb.jsp">
				<div class="form-group">
					<label for="writer">작성자</label> 
					<input type="text" class="form-control" id="writer" name="writer" value="이름1">
				</div>
				<div class="form-group">
					<label for="title">제목</label> 
					<input type="text" class="form-control" id="title" name="title" value="제목1">
				</div>
				<div class="form-group">
					<label for="content">내용</label> 
					<textarea class="form-control" id="content" name="content" rows="10" >내용1내용1내용1내용1내용1내용1내용1내용1내용1</textarea>
				</div>
			</form>
			<div class="text-right">
				<a class="btn btn-secondary" href="view.jsp" role="button">돌아가기</a>
				<a class="btn btn-success" id="modifyNotice" role="button">수정</a>
			</div>
			<%-- form end --%>
		</div>
  		</div>
  		<!-- col end -->
  	</div>
  	<!-- container end -->
<%@ include file="../inc/footer.jsp" %>