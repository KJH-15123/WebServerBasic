<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>include</h3>
	<p>또다른 페이지를 포함하고자 할때 사용하는 방식 </p>
	
	<h4>1.기존의 include 지시어를 이용한 방식(정적 include방식 == 컴파일시 포함되는 형태)</h4>
	
	<%--
	
	
	<%@include file="dateFooter.jsp"%>
	
	<br><br>
	<p>
		특징 : include하고 있는 페이지에 선언되어 있는 자바 변수를 현재 페이지에서도 사용 가능하다. <br>
		include한 페이지에 있는 date 불러오기 <br>
		불러온 날짜 : <%= date %>
		
		단 현재 페이지에서 같은 이름의 변수를 선언할 수 없다(중복 선언)
		
		<%
			String date = "0000-00-00";
		%>
	</p>
	
	--%>
	
	<hr>
	<h4>2.JSP 표준 액션 태그를 이용한 방식(동적 include 방시 == 런타임시에 포함)</h4>
	
	<!-- 
		시작태그와 종료태그를 같이 사용해야 한다 (XML형식)
		만약 시작태그와 종료태그 사이에 전달값이 없다면 시작 태그 끝에 /를 작성하여 닫힘 처리도 가능하다.
	 -->
	
	<jsp:include page="dateFooter.jsp"></jsp:include>
	<jsp:include page="dateFooter.jsp"/>
	
	<P>
		특징 1 : include하고 있는 페이지에 선언된 변수를 공유하지 않는다.<br>
<%--    <%=date>사용 불가   --%>
		<%String date = "데이트";%> <!-- 동일한 이름의 변수 사용 가능 -->
		
		<br>
		새로 선언한 date :<%=date %><br><br>
		
		특징 2 : include시 해당 페이지로 값을 전달 할 수 있음. <br>
		
		<jsp:include page="dateFooter.jsp">
			<jsp:param value="param Test!" name="test"/>
		</jsp:include>

</body>
</html>