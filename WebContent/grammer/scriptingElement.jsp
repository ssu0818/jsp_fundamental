<%-- scriptingElement.jsp --%>
<%@ page pageEncoding="utf-8" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>scripting element</title>
	</head>
	<body>
		<h1>Scripting Element </h1>
		<%!
			private int age;
			public int getAge(){
				return age;
			}
			public void setAge(int age){
				this.age = age;
			}
			
		%>
		<%
			int a = 10;
			/* request.getParameter(""); request사용가능*/
			out.println(a);
		%>
		
		<%= a %>
		
		<ul>
		<%
			for(int i=0; i<10; i++){
				out.println("<li>" +i+ "</li>");	
			}
		%>
		</ul>
		
		<ul>
		<%for(int i=0; i<10; i++){ %>
			<li><%=i %></li>
		<%} %>
		</ul>
		
		
	</body>
</html>
