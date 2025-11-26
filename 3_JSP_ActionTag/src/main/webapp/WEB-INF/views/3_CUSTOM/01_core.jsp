
<%@page import="com.kh.model.vo.Student"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1.변수(속성)</h1>
	
	<pre>
		*변수 선언 (&lt; c:set var="변수병" value="리터럴" scope="스코프영역지정(생략가능)"&gt;)
		- 변수를 선언하고 초기값을 대입해두는 기능을 제공
		-해당 변수를 어떤 scope에 담을 것인지 지정 가능하다(생략시 기본값으로 pageScope 영역에 할당)
		- 해당 scope 영역에 setAttribute 메서드를 이용하여 key+value 를 담아놓는 것과 같음
		- c:set을 통해 선언된 변수는 EL로 접근하여 사용 가능(스크립팅 원소는 접근 불가)
		
		*주의 사항
		- 변수 타입을 지정하지 않음
		-반드시 해당 변수에 담아두고자 하는 값을 초기값(value)을 넣어야한다.(선언과 동시에 초기화)
	
	</pre>
	
	<c:set var="num" value="20"></c:set> <!-- 스코프 없이 선언하면 pageScope로 지정 -->
	<c:set var="num2" value="30" scope="request"/> <!-- 태그 사이에 작성할 것이 없다면 /로 닫기 가능 -->
	
	<hr>
	num 변수값 : ${num }<br>
	num2 변수값 : ${num2}<br>
	
	<br>
	<!-- session 영역에 result라는 이름의 변수로 num과 num2를 더한 값 선언 후 아래에서 출력하기 -->
	<c:set var="result" value="${num+num2}" scope="session"/>
	result : ${result}<br>
	
	<!-- 
		변수명(키)만 제시하면 공유 범위가 작은 곳부터 큰 곳까지 모두 순회하며 해당 키값을 찾기 때문에 속도 저하가 생길 수 있다.
		때문에 필요한 변수는 스코프.변수명을 이용하여 처리하기
	 -->
	 
	 <br>
	 각 영역 값 추출 <br>
	 page : ${pageScope.num }<br>
	 request : ${requestScope.num2 }<br>
	 session :${sessionScope.result }<br>
	 request : ${requestScope.result }<br>
	 <!-- 영역을 지정하면 해당 영역에서만 찾기 때문에 없으면 나오지 않음 -->
	 
	 <c:set var="result" scope="request">
	 	9999
	 </c:set>
	 
	 requestScope.result: ${requestScope.result } <br>
	 
	 <hr>
	 
	 <pre>
	 	변수 삭제 : &lt;c:remove var="제거하고자 하는 변수명" scope="스코프영역 지정(생략가능)"&gt;
	 	- 해당 변수를 scope에서 찾아 삭제하는 태그
	 	-scope 지정 생략시 모든 scope에서 해당 변수 찾아서 삭제함
	 	- 영역.removeAttribute()메서드와 같은 역할 수행
	 </pre>
	 
	 삭제전 result : ${result }<br><br>
	 1)특정 scope 지정하여 삭제 <br>
	 
	 <c:remove var="result" scope="request"/>
	 
	 삭제 후 result : ${result }<br><br>
	 
	 <hr>
	 
	 <pre>
	 	변수(데이터) 출력
	 	&lt;c:out value="출력하고자 하는 값" default="기본값(생략가능)" escapeXml="true/false" &gt;
	 	- 데이터를 출력하고자 할때 사용하는 태그
	 	- 기본값 : value에 출력하고자 하는 값이 없을 경우 기본값으로 출력할 내용을 기술(생략가능)
	 	- secapeXml : 태그로써 해석할지 여부(생략가능)
	 	
	 	result : <c:out value="${result}"></c:out>
	 	
	 	default 설정한 result : <c:out value="${request.result }" default="없음"/>
	 	<!-- 값이 없는 경우에 "없음"이라는 문자열이 나온다. -->
	 	
	 	<c:set var="test" value="<b>오늘은 수요일</b>"/>
	 	
	 	<c:out value="${test }"/>
	 	<c:out value="${test }" escapeXml="true"/> <!-- 기본값 -->
	 	<c:out value="${test }" escapeXml="false"/><!-- 문자열이 아닌 태그로써 인식됨 -->
	 	
	 	<c:set var="test2" value="<script>alert('확인');</script>"/>
	 	
	 	<c:out value="${test2 }" escapeXml="true"/> <!-- 기본값 -->
<%--	 	<c:out value="${test2 }" escapeXml="false"/><!-- 문자열이 아닌 태그로써 인식됨 -->     --%>
	</pre>
	 
	 <hr>
	 
	 <h3>2.조건문 - if(&lt;c:if test="조건식"&gt;)</h3>
	 
	 <pre>
	 	- JAVA의 단일if문과 비슷한 역할을 하는 태그
	 	- 조건식은 test라는 속성에 작성(단, EL구문으로 작성해야함)
	 </pre>
	 
	 <%-->
	 <%
	 	if(10>3){
	 		System.out.println("확인");
	 	}
	 %>
	  --%>
	  
	  <c:if test="${num gt num2 }">
	  	<b>num이 num2보다 큽니다.</b>
	  </c:if>
	  
	  <c:if test="${num lt num2 }">
	  	<b>num이 num2보다 작습니다.</b>
	  </c:if>
	  
	  <br>
	  
	  <h3>3.조건문 -choose(&lt;c:choose&gt; &lt;c:when&gt; &lt;c:otherwise&gt;)</h3>
	  
	  - java의 if-else,if else if문 또는 switch문과 비슷한 역할을 수행하는 태그 <br>
	  - 각 조건을 c:choose의 하위요소 c:when을 통해서 작성 <br>
	  
	  <%--
	  	자바 구문
	  	if(num==25){
	  	
	  	}else if(num2==30){
	  	
	  	}else{
	  	
	  	}
	   --%>
	   
	   
	<c:choose>
		<c:when test="${num eq 25 }"> <!-- 하나의 if 문 -->
			<b>안녕하세요</b>
		</c:when>
		<c:when test="${num2 eq 30 }">
			<b>반갑습니다.</b>
		</c:when>
		<c:otherwise> <!-- else구문이므로 조건 작성x -->
			<b>다 아니네요</b>
		</c:otherwise>
	</c:choose>
	<!-- 문법과 문법 사이(태그와 태그 사이)에는 다른 <br> 이나 <!-- -->주석등을 달면 안된다. 오직 <%-- --%>(jsp주석)만 허용한다. -->
	
	<h3>4.반복문 - forEach</h3>
	
	<pre>
		for loop문 - &lt;c:forEach var="변수명" begin="초기값" end="끝값" step="증가시킬값(생략가능)" &gt;
		향상된 for문 = &lt;c:forEach var="변수명" items="순차적으로 접근할 배열 또는 컬렉션"
								varStatus="현재 접근된 요소의 상태값을 보관할 변수명(생략가능)"&gt;
								
		step : 지정하지 않을시 기본값
		varStatus : 현재 접근된 요소의 상태값을 보관할 변수명(생략가능)
		varStatue의 속성들
			- count : 1부터 카운트
			- index : 0부터 카운트
			- first : 반복이 처음인지 여부(true/false)
			- last : 반복이 마지막인지 여부(true/false)
			- current : 현재 반복중인 요소
	</pre>

	<c:forEach var="i" begin="1" end="5" step="1">
		반복확인 : ${i } <br>
	</c:forEach>
	
	<hr>
	
	<c:forEach var="i" begin="0" end="10" step="2">
		반복확인 : ${i } <br>
	</c:forEach>
	
	<!-- 태그 안에도 el로 값사용 가능 -->
	<c:forEach var="i" begin="1" end="6">
		<h${i}>태그에 i 넣기</h><br>
	</c:forEach>
	
	<!-- 향상된 for문 해보기 -->
	
	<%
		ArrayList<Student> list = new ArrayList<>();
		list.add(new Student("김학생",20,"남자"));
		list.add(new Student("박학생",22,"여자"));
		list.add(new Student("최학생",23,"여자"));
		list.add(new Student("이학생",26,"남자"));
		list.add(new Student("하학생",21,"여자"));
		
		//servlet에서 처리했다고 가정
		request.setAttribute("list", list);
		
	%>

	<table border="1">
		<thead>
			<tr>
				<th>순번</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
		
		<%-- 고전적인 방식
			<%if(list.isEmpty()){%>
			<tr>
				<td colspan="4">조회된 정보가 없습니다.</td>
			</tr>
			<%} else { %>
				<%for(int i=0;i<list.size();i++) { %>
					<tr>
						<td><%=i+1%></td>
						<td><%=list.get(i).getName() %></td>
						<td><%=list.get(i).getAge() %></td>
						<td><%=list.get(i).getGender() %></td>
					</tr>
				<%} %>
			<%} %>
		--%>
		
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="4">조회된 정보가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="s" items="${list}" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${s.name }</td>
						<td>${s.age }</td>
						<td>${s.gender }]</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
			
		</tbody>
	</table>
	
	<hr>
	
	<h3>5.반복문 -forTokens</h3>
	<pre>
		&lr;forTokens var="각 값을 보관할 변수" items="분리시킬 문자열" delims="구분자"&gt;
		
		- 구분자를 통해서 분리된 각각의 문자열에 순차적으로 접근하여 반복수정
		- JAVA의 split("구분자") 또는 StringTokenizer과 비슷한 역할
		- 구분자를 여러개 넣어서 구분시킬 수 있음
	</pre>
	
	<c:set var="device" value="컴퓨터,휴대폰,노트북,에어컨/세탁기.냉장고.청소기"/>
	
	<ul>
		<c:forTokens items="${device }" delims=",/." var="d">
			<li>${d }</li>
		</c:forTokens>
	</ul>
	
	<h3>6.쿼리스트링 관련 - url,param</h3>
	
	<pre>
		&lt; c:url var="변수명" value="요청할 url" &gt;
			&lt; c:param name="키값" value="벨류" &gt;
			&lt; c:param name="키값" value="벨류" &gt;
			...
			
			&lt;/c:uls&gt;
			
			- url 경로를 생성하고 쿼리스트링을 정의할 수 있는 태그
			- 전달할 쿼리스트링이 길어질 경우 사용하면 편리하다.
	</pre>
	
	
	<a href="/action/search.do?where=${location }&keyword=날씨&category=검색">검색</a>
	<!-- 위와같이 전달해야되는 쿼리스트링이 길어지면 가독성이 나쁠뿐만 아니라 유지보수에도 용이하지 않음 -->
	
	<!-- 이때 사용하면 좋은 c:url 태그 형식 -->
	<c:url var="queryUrl" value="search.do">
		<c:param name="where">nexearch</c:param>
		<c:param name="sm">top_hty</c:param>
		<c:param name="fbm">0</c:param>
		<c:param name="ie">utf8</c:param>
		<c:param name="query" value="날씨"/>	<!-- value에 값을 넣는 방식도 가능 -->
	</c:url>
	
	
	<br>
	생성된 url : ${queryUrl }<br>
	<a href = "${queryUrl }">주소창과 비교하기</a>
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>