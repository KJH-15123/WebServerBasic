<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request.getAttribute("키");로 자료 담기
	String name = (String)request.getAttribute("name");
	String phone = (String)request.getAttribute("phone");
	String address = (String)request.getAttribute("address");
	String message = (String)request.getAttribute("message");
	String pizza = (String)request.getAttribute("pizza");
	String payment = (String)request.getAttribute("payment");
	int price = (int)request.getAttribute("price");
	String[] topping = (String[])request.getAttribute("topping");
	String[] side = (String[])request.getAttribute("side");
	
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피자 결제 페이지</title>
</head>
<body>
	<h1>피자 결제 페이지</h1>
	
	<h2>주문 내역</h2>
	<h3>주문 정보</h3>
	
	<ul>
		<li>성함 : <%=name%></li>
		<li>전화번호 : <%=phone%></li>
		<li>주소 : <%=address %></li>
		<li>요청사항 : <%=message %></li>
	</ul>
	
	<br><br>
	
	<h3>주문 정보</h3>
	<ul>
		<li>피자 : <%=pizza %></li>
		<li>토핑 : <%= (topping == null) ? "없음" : String.join(", ", topping) %></li>
		<li>사이드 : <%= (side == null)? "없음" : String.join(",",side) %></li>
		<li>결제방식 : <%=payment %></li>
	</ul>
	
	<h3>위와 같이 주문하셨습니다.</h3>
	
	<h1>총 가격 : <%=price %></h1>

</body>
</html>