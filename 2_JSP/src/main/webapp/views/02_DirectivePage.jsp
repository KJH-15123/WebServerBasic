<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page 지시어</title>
</head>
<body>
	<h1>Page 지시어</h1>
	
	<% 
		ArrayList<String> list = new ArrayList<>();
		list.add("하하하");
		list.add("호호호");
		
		//Date 클래스도 이용하고 싶다면?
		//여러개의 클래스를 import하고자 한다면 , 를 이용하여 나열한다.
		Date today = new Date();
	%>
	
	<p>
		리스트의 길이 : <%=list.size() %> <br>
		0번 인덱스의 값 : <%=list.get(0) %> <br>
		현재 날짜 및 시간 : <%=today %><br>
	</p>

</body>
</html>