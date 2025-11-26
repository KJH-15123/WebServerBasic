<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//현재 날짜 변수처리 해놓기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());

	%>
	
	<h3>오늘 날짜는 <%=date %></h3>
	
	<br>
	
	전달 받은 값 : ${param.test }
	
	<br>
	<!--  
		전달값은 내장객체 param에 담겨 전달되기 때문에 (jsp:param value="param Test!" name="test")
		키 : name 값 value 로 담겨 전달된다.
		el표기법 이용하여 param.value으로 설정한값을 추출할 수 있다.
	 -->

</body>
</html>