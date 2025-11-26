<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- ELOPcontroller를 만들어서 해당 페이지로 이동시키기 -->
	<h2>EL 연산자</h2>
	
	<h3>1.산술 연산</h3>
	
	<p>
		*기존 방식 (표현식)<br>
		10+3 = <%=(int)request.getAttribute("big")+ (int)request.getAttribute("small") %>
	</p>
	
	<p>
		*EL 연산 <br>
		10+3 = ${big+small }<br>
		10-3 = ${big-small }<br>
		10*3 = ${big*small }<br>
		10/3 = ${big/small } 또는 ${big div small }<br>
		10%3 = ${big% small } 또는 ${big mod small } <br>
	</p>
	
	<h3>2.숫자간 대소 비교 연산</h3>
	
	<p>
		*기존 방식 <br>
		10>3 : <%=(int)request.getAttribute("big")>(int)request.getAttribute("small") %>
		<br><br>
		
		*EL 방식 <br>
		10>3 : ${big > small }또는 ${big gt small }<br>
		10&lt;3 : ${big < small }또는 ${big lt small }<br>
		10>=3 : ${big >= small }또는 ${big ge small }<br>
		10&lt;=3 : ${big <= small }또는 ${big le small }<br>
	</p>
	
	<h3>3.동등 비교 연산</h3>
	<p>
		*기존 방식<br>
		10과 3이 일치합니까? : <%=(int)request.getAttribute("big")==(int)request.getAttribute("small") %><br>
		sOne과 sTwo가 일치합니까? : <%=(String)request.getAttribute("sOne")==(String)request.getAttribute("sTwo") %><br>
		sOne과 sTwo가 일치합니까? : <%=((String)request.getAttribute("sOne")).equals((String)request.getAttribute("sTwo"))%> <br>

	</p>
	
	<p>
		*EL연산 <br>
		10과 3이 일치합니까? : ${big == small } or ${big eq small } <br>
		big에 담긴 값과 10이 일치합니까? : ${big--10 } or ${big eq 10 }<br>
		<!--EL 구문에서 문자열 비교에 대한 처리는 ==과 eq로 자바에서의 equals메서드와 동일한 처리를 한다.(값자체 비교) -->
		sOne과 sTwo가 일치합니까? ${sOne ==sTwo} or ${sOne eq sTwo }<br>
		<!-- EL 구문에서 문자열 표기는 ""와 '' 모두 가능하다. -->
		sOne과 "안녕"이 일치합니까? : ${sOne=="안녕" } or ${sOne eq "안녕" }<br>
		<!--EL 구문에서 문자열이 일치하지 않는지 확인하는 연산자 != 를 ne 표현 가능하다. -->
		sOne과 "안녕하세요"가 일치하지 않습니까? : ${sOne !="안녕하세요"} or ${sOne ne "안녕하세요" } <br>
	</p>
	
	<hr>
	
	<h3>4.객체가 null인지 리스트가 비어있는지 확인 연산</h3>
	
	<p>
	
		*EL 연산 <br>
		student가 null인지 확인 : ${student ==null } 또는 ${empty studnet }<br>
		student2가 null인지 확인 : ${student2 ==null } 또는 ${empty studnet2 }<br>
		student1가 null이 아닌지 확인 : ${student1 !=null } 또는 ${not empty studnet2 }<br>
		<br>
		list가 비어있나요? : ${empty list };
		list2가 비어있나요? : ${empty list2 };
	</p>
	
	<h3>5.논리연산자</h3>
	<p>
		AND 연산 : ${true&& true }또는 ${true and true }<br>
		OR 연산 : ${false|| true }또는 ${ false or true }<br>
	</p>
	
	<P>
		big이 small보다 크고 list는 비어있나요?
		${big gt small and empty list}<br>
		
		big과 small의 곱은 4의 배수인가요?
		${big*small mod 4 eq 0 }<br>
		
		list2가 비어있지 않거나 또는 sOne에 담긴 값이 안녕하세요와 일치하나요?
		${empty list2 or sOne eq "안녕하세요"}<br>

	</P>
	

</body>
</html>