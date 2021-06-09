<%-- error.jsp --%>
<%@ page pageEncoding="utf-8" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>ERROR</title>
	</head>
	<body>
		<h1>에러 페이지</h1>
		<%= exception.getMessage() %>
	</body>
</html>
