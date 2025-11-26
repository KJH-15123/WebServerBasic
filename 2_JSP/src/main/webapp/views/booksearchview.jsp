<%@page import="com.kh.controller.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ArrayList<Book> list = new ArrayList<>();

	list = (ArrayList<Book>)request.getAttribute("list");
	
	for(int i=0; i<list.size(); i++){
		list.get(i).getBook_no();
	}
%>
<!DOCTYPE html>
<html>
<head>
<style>
	*{
	border: 1px solid black;
	}
</style>
<meta charset="UTF-8">
<title>책 조회</title>
</head>
<body>
	<table>
		<tr>
			<td>책번호</td>
			<td>책제목</td>
			<td>저자</td>
			<td>카테고리</td>
			<td>가격</td>
		</tr>
			<%for(int i=0; i<list.size(); i++){ %>
			<tr>
				<td><%=list.get(i).getBook_no() %></td>
				<td><%=list.get(i).getBook_title() %></td>
				<td><%=list.get(i).getAuthor() %></td>
				<td><%=list.get(i).getCategory() %></td>
				<td><%=list.get(i).getPrice() %></td>
			</tr>
			<%} %>
	</table>

</body>
</html>