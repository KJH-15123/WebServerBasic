<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL이란?</h1>
	
	<p>
		JSP Standard Tag Library의 약자로 JSP에서 사용되는 커스텀 액션 태그 <br>
		공통적으로 사용되는 코드들의 집합을 보다 쉽게 사용할 수 있도록 <br>
		태그화 하여 표준을 제공하는 라이브러리
	</p>
	
	<hr>
	
	<h3>라이브러리 다운로드 후 추가하기</h3>
	
	1) <a href="https://tomcat.apache.org/download-taglibs.cgi">톰캣 사이트(jstl)</a> 접속 <br>
	2) 하단에 있는 라이브러리 4개 모두 다운 받기(standard jar 파일 4개) <br>
	3) WEB-INF/lib 폴더에 넣어주기 <br>
	
	<h3>JSTL선언 방법</h3>
	
	<p>
		JSTL을 사용하고자 하는 해당 jsp 페이지 상단에 <br>
		taglib 지시어 사용하여 선언 <br><br>
		
		<!--  uri : 자원 식별자 -->
		&lt;@ taglib prefix="접두어" uri="라이브러리 파일상의 uri 구조"%&gt;"
	</p>
	
	<hr>
	
	<h3>*JSTL 분류</h3>
	<h4>1.JSTL Core Library</h4>
	
	<p>
		 변수와 조건문,반복문 등의 로직과 관련된 문법을 제공
	</p>
	<a href="/action/core.do">1_core library</a>
	
	<h4>2.JSTL Formatting Library</h4>
	
	<hr>
	<p>
		숫자,날짜 및 시간 데이터의 출력 형식을 지정할 때 사용하는 문법을 제공
	</p>
	<a href="/action/format.do">2_formatting library</a>
	
	<hr>
	
	<h4>3. JSTL Function Library</h4>
	<p>
		EL 구문안에서 사용할 수 있는 메서드 제공
	</p>
	<a href="/action/function.do">3_function library</a>

</body>
</html>