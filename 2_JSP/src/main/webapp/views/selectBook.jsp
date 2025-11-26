<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 선택</title>
</head>
<body>
	<h1>책 정보 조회</h1>
	
	<!-- 조회 버튼을 클릭하면 input 상자에 입력한 키워드로 조회한 책 목록을 받아 
		폼태그 하단에 각 책 정보를 테이블의 한 행씩 담아 출력해보기
		
		ex)
		책변호 책제목  저자 카테고리  가격
		1    이런책 김이런  코믹  15000
	 -->
	 
	<form action="/jsp/search.bk" method="post">
		책 조회 하기 : <input type="text" name="search"> <br>

		<input type ="submit" value="조회">
	</form>
	
	

</body>
</html>