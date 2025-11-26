<%@page import="com.kh.model.vo.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1.기존 방식대로 스크립틀릿과 표현식을 이용하여 각 영역에 담겨있는 값을 출력해보기</h1>
	
	<%
		//requestScope에 담긴 값을 뽑아보기
		String classRoom = (String)request.getAttribute("classRoom");
		Student kim = (Student)request.getAttribute("student");
		
		//sessionScope에 담긴 값 뽑기
		String academy = (String)session.getAttribute("academy");
		Student lee = (Student)session.getAttribute("student2");

	%>
	
	<p>
		학원명 : <%=academy %><br>
		강의장 : <%=classRoom %><br>
		
		학생1 : <%=kim %>
		<ul>
			<li>이름 : <%=kim.getName() %></li>
			<li>나이 : <%=kim.getAge() %></li>
			<li>성별 : <%=kim.getGender() %></li>
		</ul>
		학생2 : <%=lee %>
		<ul>
			<li>이름 : <%=lee.getName() %></li>
			<li>나이 : <%=lee.getAge() %></li>
			<li>성별 : <%=lee.getGender() %></li>
		</ul>
	</p>
	
	<hr>
	
	<h3>2. EL 이용하여 보다 쉽게 해당 Scope에 저장된 값들을 출력하기</h3>
	
	<p>
		EL은 getXXX을 통해 값을 추출할 필요 없이 해당 키값만 제시하면 접근이 가능하다. <br>
		내부적으로 해당 Scope 영역에 해당 키값에 담긴 벨류를 반환받을 수 있다. <br>
		기본적으로 EL은 JSP 내장 객체를 구분하지 않고 자동적으로 모든 내장 객체에 <br>
		키값을 검색하여 존재하는 경우 값을 가져온다.
		표현법 : \${키 }
	</p>
	
	<p>
		학원명 : ${academy }<br>
		강의장 : ${classRoom }<br>
		
		학생 1 : $(student)<br>
		<ul>
			<li>이름 : ${student.name}</li>
			<li>나이 : ${student.age}</li>
			<li>성별 : ${student.gender}</li>
		</ul>
		학생2 : ${student2}
		<ul>
			<li>이름 : ${student2.name}</li>
			<li>나이 : ${student2.age}</li>
			<li>성별 : ${student2.gender}</li>
		</ul>
	
	</p>
	
	<h3>3.EL 사용시 내장 객체들에 저장된 키값이 동일할 경우</h3>
	scope 값 : ${Scope }
	
	<!-- EL표기법으로 키값을 찾을땐 작은 범위의 Scope부터 찾아서
	먼저 찾게된 값을 반환한다.
	page->request->session->application 순으로 찾는다.
	만약 모든 영역에서 찾지 못했다면 아무것도 출력되지 않는다(오류 발생하지 않음) -->
	
	<h3>4.Scope를 지정하여 각 영역에 있는 키값에 접근하기</h3>
	<%
		//페이지 스코프에 담아주기
		pageContext.setAttribute("scope","page Scope!");
	%>
	
	<%--표현법 : [영역Scope.키값] --%>
	pageScope에 담긴 값 : ${scope }또는 ${pageScope.scope }<br>
	requestScope에 담긴 값 : ${requestScope.scope }<br>
	sessionScope에 담긴 값 : ${sessionScope.scope }<br>
	applicationScope에 담긴 값 : ${applicationScope.scope }<br>
	
<!-- 존재하지 않는 키값에 대한 접근 -->
	존재하지 않는 키값 접근해보기 : ${test }<br>
	존재하지 않는 키값에 접근해보기 표현식으로 : <%=request.getAttribute("test") %>
	
	

</body>
</html>