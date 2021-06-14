<!-- saveDb.jsp -->
<%@page import="kr.or.kpc.dto.NoticeDto"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@ page pageEncoding="utf-8" %>

<%
	request.setCharacterEncoding("utf-8");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	NoticeDao dao = NoticeDao.getInstance();
	int num = dao.getMaxNum(); //가장 큰 값+1
	NoticeDto dto = new NoticeDto(num, writer, title, content, null);
	boolean success = dao.insert(dto);
	if(success){
%>
	<script>
		alert('글쓰기 완료!');
		location.href="list.jsp?page=1";
	</script>
<%}else { %>
	<script>
		alert('ERROR');
		history.back(-1); //이전페이지
	</script>
<%} %>






