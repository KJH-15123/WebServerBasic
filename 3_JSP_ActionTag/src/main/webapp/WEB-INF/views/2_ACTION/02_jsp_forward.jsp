<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSP foward 페이지</h3>
	
	<jsp:forward page="dateFooter.jsp">
		<jsp:param value="Param Test!!" name="test"/>
	</jsp:forward>
	

</body>
</html>