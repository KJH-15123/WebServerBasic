<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSP(Java Server Page)</h1>
	
	<p>
		JSP란 HTML 형식내에 자바코드를 사요할 수 있는 형식으로 <br>
		서블릿(자바코드내)에서 응답화면을 구현했던 복잡함을 보다 간단하게 해결 가능하다.<br>
		-JSP의 가장 큰 장점은 Servlet에서는 비지니스 로직처리(컨트롤러 역할)에만 집중하고 <br>
		프레젠테이션 로직처리(응답화면을 만들어내는 뷰 역할)은 JSP에서 집중할 수 있게 분리하는 것
	</p>
	
	<hr>
	
	<h2>JSP Element 표현법</h2>
	
	<h3>1.JSP 스크립팅 원소(Script Element)</h3>
	
	<p>
		JSP 페이지에서 자바코드를 기술 할 수 있도록 하는 기능
	</p>
	
	<ol>
		<li>
			선언문 : &lt;%! %&gt; <br>
			멤버 변수와 메서드를 선언하기 위해 사용
		</li>
		<li>
			스크립틀릿 : &lt;% %&gt; <br>
			JSP에서 자바코드를 기술하기 위한 기본적인 표현법
		</li>
		<li>
			표현식(출력식) : &lt;%= %&gt; <br>
			자바에서 작성한 값(또는 메서드 호출)을 출력하기 위해 사용
		</li>
	</ol>
	
	<a href ="views/01_ScriptingElement.jsp">01_ScriptingElement</a>
	
	<h3>2.지시어(Directive) &lt;%@ page/include/taglib 속성 ="속성값"%gt;</h3>
	
	<p>
		JSP 페이지 전체에 영향을 미치는 정보를 기술할 때 사용한다.
	</p>
	
	<ol>
		<li>
			page 지시어 : 현재 jsp 페이지를 처리하는데 필요한 각 속성을 기술하는 부분 <br>
			<ul>
				<li>language : 사용할 스크립트 언어 유형을 지정</li>
				<li>contentType : 웹 브라우저가 받아볼 해당 페이지의 형식,인코딩 방식지정</li>
				<li>pageEncoding : jsp 파일에 기록된 자바코드의 인코딩 방식을 지정</li>
				<li>import : 자바의 import와 같음</li>
				<li>errorPage : 해당 jsp 상에서 오류가 발생했을때 보여줄 에러페이지 경로 지정</li>
			</ul>
			<a href ="views/02_DirectivePage.jsp">02_DirectivePage</a>
		</li>
		<li>
			include 지시어 : jsp 파일에 또 다른 jsp를 포함시키고자 할때 사용하는 지시어 <br>
			<a href="views/03_DirectiveInclude.jsp">03_DirectiveInclude</a>
		</li>
		<li>
			taglib 지시어 : jsp기능을 좀 더 확장할 수 있는 인자로 추가적인 라이브러리 등록 구문 <br>
		</li>
	</ol>
	
	<br><br>
	
	<a href="views/04_pizzaOrder.jsp">피자 주문 페이지로</a>

</body>
</html>