<!-- list.jsp -->
<%@page import="kr.or.kpc.dto.NoticeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp" %>
<%
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage==null || tempPage.length()==0){
		cPage = 1;
	}
	try{
		cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage = 1;		
	}
	/*
		cPage = 1 ---> 0, 10
		cPage = 2 ---> 10, 10
		cPage = 3 ---> 20, 10
		start 0, 10, 20,   displayCount=10
		An = a1+(n-1)*d ===> a1->0, n->cpage, d->displayCount)
	*/
	
	////////★
	int displayCount = 3; //페이지에 보여줄 리스트 개수
	int totalRows = 0; //dao.getRows(); //총 rows
	int currentBlock = 0;
	int totalBlock = 0;
	int totalPage = 0; 
	int startPage = 0;
	int endPage = 0;
	int pageDisplayCount = 5; // 5--> previous 1 2 3 4 5 next
	int start = (cPage-1)*displayCount; //a+(n-1)d
	NoticeDao dao = NoticeDao.getInstance();
	ArrayList<NoticeDto> list = dao.select(start, displayCount);
%>
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
				<%-- table start --%>
				<h5>공지사항 목록</h5>
				<div class="table-responsive">
					<table class="table table-hover">
						<colgroup>
							<col width="15%">
							<col width="25%">
							<col width="40%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">작성자</th>
								<th scope="col">제목</th>
								<th scope="col">날짜</th>
							</tr>
						</thead>
						<tbody>
						<%
						if(list.size() != 0){
							for(NoticeDto dto : list){
						%>
							<tr>
								<th scope="row"><%=dto.getNum() %></th>
								<td><%=dto.getWriter() %></td>
								<td><a href="view.jsp?num=<%=dto.getNum()%>&page=<%=cPage%>"><%=dto.getTitle() %></a></td>
								<td><%=dto.getRegdate() %></td>
							</tr>
						<%
							} 
						}else{
						%>
						<tr>
							<td colspan='4'>등록된 글이 없습니다.</td>
						</tr>
						<%} %>
						</tbody>
					</table>
					<%-- pagination start --%>
					
					
					<%
					/*   
						총 rows 128개, displayCount 10개 가정
						Previous 1 2 3 4 5 6 7 8 9 10 Next  => currentBlock : 1block
						Previous 11 12 13 Next 				=> currentBlock : 2block
					*/
					totalRows = dao.getRows(); //128
					
					
					//총 페이지수
					if(totalRows % displayCount==0){
						totalPage = totalRows/displayCount;
					}else{
						totalPage = totalRows/displayCount +1;
					}
					/* 같은 사용 
					totalPage = totalRows%displayCount==0? totalRows/displayCount : totalRows/displayCount+1; */
					//처리
					if(totalPage == 0){
						totalPage = 1;
					}
					
					/*
						cPage : 1-10 --> currentBlock : 1
						cPage : 11-20 --> currentBlock : 2
						...
					*/
					//현재 BLOCK
					if(cPage%pageDisplayCount == 0){
						currentBlock = cPage/pageDisplayCount;
					}else {
						currentBlock = cPage/pageDisplayCount +1;
					}
					//총 BLOCK
					if(totalPage%pageDisplayCount == 0){
						totalBlock = totalPage/pageDisplayCount;
					}else {
						totalBlock = totalPage/pageDisplayCount +1;
					}
					
					/*
						startPage : 1, 11, 21
						endPage : 10, 20, 30
					*/
					//start숫자, end숫자 
					startPage = 1 + (currentBlock -1)*pageDisplayCount;
					endPage = pageDisplayCount + (currentBlock -1)*pageDisplayCount;
					//BLOCK내에서 끝 처리 -- 안하게되면 데이터없는 페이지까지 보여줌
					if(currentBlock == totalBlock){
						endPage = totalPage;
					}
					%>
					
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
						<%-- 
							<%if(currentBlock==1){ %>
								<li class="page-item disabled">
									<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
								</li>
							<%}else{ %>
								<li class="page-item <%if(currentBlock==1){ %> disabled">
									<a class="page-link" href="list.jsp?page=<%=startPage-1%>"tabindex="-1" aria-disabled="true">Previous</a>
								</li>
							<%} %> 
							아래와 같이 간단하게 가능.
						--%>
							<li class="page-item <%if(currentBlock==1){%> disabled <%}%>">
								<a class="page-link" href="list.jsp?page=<%=startPage-1%>"tabindex="-1" aria-disabled="true">Previous</a>
							</li>
							<% for(int i=startPage; i<=endPage; i++){%>
							<li class="page-item"><a class="page-link" href="list.jsp?page=<%=i%>"><%=i %></a></li>
							<%} %>
						<%-- 
							<%if(totalBlock==currentBlock){ %>
								<li class="page-item disabled">
									<a class="page-link" href="#">Next</a>
								</li>
							<%}else{ %>
								<li class="page-item">
									<a class="page-link" href="list.jsp?page=<%=endPage+1%>">Next</a>
								</li>
							<%} %> 
						아래와 같이 간단하게 가능.
						--%>
						<li class="page-item<%if(totalBlock==currentBlock){%> disabled <%}%>">
							<a class="page-link"href="list.jsp?page=<%=endPage + 1%>">Next</a>
						</li>

					</ul>
					</nav>
					<%-- pagination end --%>
					<div class="text-right">
						<a class="btn btn-primary" href="write.jsp?page=<%=cPage %>" role="button">글쓰기</a>
					</div>
				</div>
				<%-- table end --%>
			</div>
  		</div>
  		<!-- col end -->
  	</div>
  	<!-- container end -->
<%@ include file="../inc/footer.jsp" %>