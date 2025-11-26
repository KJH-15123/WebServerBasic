<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립팅 원소</title>
</head>
<body>
	<h1>스크립팅 원소</h1>
	<!-- HTML 주석 : 개발자 도구에서 보인다 - 자바코드에서 읽혀질 수 있음 -->
	<%-- JSP 주석 : 개발자 도구에서 보이지 않고 코드로 인식되지 않는다. --%>
	
	<%
		//스크립틀릿 : 이 안에 일반적인 자바코드를 작성한다(변수 선언, 제어문 등등)
		int sum =0;
		for(int i=0;i<10;i++){
			sum += 1;
		}
	%>
	
	<p>
		화면으로 출력하고자 한다면<br>
		스크립틀릿을 이용하여 출력하는 방법 : <%out.println(sum); %><br>
		표현식(출력식을 이용하여 출력하는 방법) : <%=sum %>
	</p>
	
	<%
		//배열 사용해보기
		String[] name = {"김사원","박사원","최사원"};
	%>
	
	<h5>배열의 길이 : <%=name.length %></h5>
	<br>
	
	<!-- 반복문을 이용하여 배열에 담긴 데이터 출력 -->
	<ul>
		<%for(int i=0 ; i<name.length; i++){ %>
			<li><%=name[i] %></li>
		<%} %>
	</ul>

</body>
</html>