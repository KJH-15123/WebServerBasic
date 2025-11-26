<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>EL(Expression Language)</h1>
	
	<p>
		기존에 사용했던 표현식(출력식) &lt;%=name%&gt;와 같이<br> 
		JSP상에서 표현하고자 하는 값을 /${name } 의 형식으로 표현해서 작성하는 것
	</p>
	
	<h3>1. EL 기본 구문에 대해서 알아보기</h3>
	<a href="/action/el.do">01_EL표기법</a>

	<h3>2. EL 연산자 알아보기</h3>
	<a href="/action/operation.do">02_EL 연산자</a>
	
	<%--
		JSP를 이루는 구성인자
		1.JSP 스크립트 원소 : JSP 페이지에서 자바코드를 직접 기술할 수 있게 하는 기술
			ex) 선언문,스크립틀릿,표현식
		2.지시어 : JSP 페이지 정보에 대한 내용을 표현한다거나 다른 페이지를 포함할 때 사용
			ex) page지시어 include지시어 taglib지시어(라이브러리 추가시)
		3.JSP : 액션 태그 : XML 기술을 이용하여 기존으 jsp 문법을 확장하는 기술을 제공하는 태그
			- 표준 액션 태그(Standard Action Tag) : JSP 페이지에서 바로 사용 가능
			ㄴ 표준 액션 태그는 모든 태그명 앞에 jsp라는 접두어가 붙는다.
			
			- 커스텀 액션 태그 : (Custom action Tag) : JSP 페이지에서 바로 사용이 불가능하고 별도의 라이브러리를 연동해야한다.
			ㄴ 커스텀 액션 태그는 모든 태그명 앞에 jsp 대신 각각 제공하는 태그 접두어가 붙어야한다.(JSTL)
	--%>
	
	<h3>3.JSP Action Tag</h3>
	<p>
		XML기술을 이용하여 기존의 JSP 문법을 확장시키는 기술을 제공하는 태그들 <br>
		태그 앞에 jsp가 붙는다.
	</p>
	
	<a href="/action/include.do">01_jsp:include</a><br>
	
	<a href="/action/forward.do">02_jsp:forward</a><br>
	
	<h3>커스텀 액션 태그</h3>
	<a href="/action/custom.do">03_JSTL</a><br>
	
</body>
</html>