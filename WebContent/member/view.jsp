<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp" %>
	<!-- breadcrumb start -->
  	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="/index.jsp">홈</a></li>
	    <li class="breadcrumb-item">회원정보 보기</li>
	 </ol>
	</nav>
	<!-- breadcrumb end -->
  	
  	<!-- container start -->
	<div class="container">
		<!-- col start -->
		<div class="row">
			<div class="col-md-12">
				<h3>회원정보 보기</h3>
	        	<form method="post" name="f" action="save.jsp">
				  <div class="form-group">
	                <input type="text" class="form-control" id="email" name="email" placeholder="Your Email *" value="abc@email.com" readonly />
	              	<div class="invalid-feedback" id="errorEmail">
				       이메일을 입력하세요.
				    </div>
				    <div class="valid-feedback">
				        Looks good!
				    </div>
	              </div>
	              <div class="form-group">
	                <input type="password" class="form-control" id="pwd" name="pwd"  placeholder="Your Password *" value="" />
	              	<div class="invalid-feedback" id="errorPwd">
				    	비밀번호를 입력하세요.
				    </div>
				    <div class="valid-feedback">
				        Looks good!
				    </div>
	              </div>
	              <div class="form-group">
	                <input type="password" class="form-control" id="newpwd" name="newpwd"  placeholder="Your New-Password *" value="" />
	              	<div class="invalid-feedback" id="errorNewPwd">
				    	새로운 비밀번호를 입력하세요.
				    </div>
				    <div class="valid-feedback">
				        Looks good!
				    </div>
	              </div>
	              <div class="form-group">
	                <input type="text" class="form-control" id="name" name="name" placeholder="Your Name *" value="이름1" />
	              	<div class="invalid-feedback" id="errorName">
				       이름을 입력하세요.
				    </div>
				    <div class="valid-feedback">
				        Looks good!
				    </div>
	              </div>
	              <div class="form-group">
	                 <select class="form-control" id="status" name="status">
				      <option value="1">가입</option>
				      <option value="2">탈퇴</option>
				    </select>
	              </div>
				</form>
				<div class="text-right" style="margin-bottom : 20px;">
					<a href="list.jsp" class="btn btn-outline-success">리스트</a>
					<a href="" id="updateCustomer" class="btn btn-outline-success">회원수정</a>
				</div>
			</div>
		</div>
		<!-- col end -->
	</div>
	<!-- container end -->
	
	
	<script>
		$(function(){
			let email = $('#email').val();
			let pwd = $('#pwd').val();
			let repwd = $('#repwd').val();
			let name = $('#name').val();
			
			
		});
	</script>
	
	
<%@ include file="../inc/footer.jsp" %>