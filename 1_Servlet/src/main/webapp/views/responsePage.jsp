<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//해당 영역은 스크립틀릿이라고 하여 jsp문서 내에 자바코드를 사요할 수 있는 영역이다.
	//현재 jsp에서 필요한 데이터는 servlet에서 request객체의 attribute영역에 담아놨고
	//해당 데이터를 추출하여 원하는 html요소 사이에 넣어서 출력 형식을 만들어주어야 한다.
	//request.getAttribute("키");
	//이때 반환되는 value 값의 자료형은 Object이기 때문에 형변환을 해서 사용한다.
	
	String name = (String)request.getAttribute("name");
	String gender = ((String)request.getAttribute("gender")).equals("m")?"남자":"여자";
	int age = (int)request.getAttribute("age");
	String address = (String)request.getAttribute("address");
	double height = (double)request.getAttribute("height");
	String[] food = (String[])request.getAttribute("food");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>개인 정보 응답 화면</h2>
	
	<span><%=name %>님은</span>
	<span><%=age %>살이고</span>
	<span>사는 지역은<%=address %> 이고</span>
	<!-- 성별을 남자 또는 여자로 출력해보기 -->
	<span>성별은<%=gender %>이고</span>
	<span>키는 <%=height %>cm 이고</span>
	<span>좋아하는 음식은</span>
	<% if(food==null){ %>
	선택하지 않았습니다.
	<%}else{ %>
	
	<ul>
		<%for(int i=0;i<food.length;i++){ %>
		<li><%=food[i] %></li>
		<%} %>
	</ul>
	
	<%} %>

</body>
</html>