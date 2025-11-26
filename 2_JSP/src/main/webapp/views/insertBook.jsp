<%@page import="com.kh.controller.BookDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String resultStr=null;
		
	if("POST".equals(request.getMethod())){
		
		String title = request.getParameter("bookTitle");
		String author = request.getParameter("author");
		String category = request.getParameter("category");
		int price = Integer.parseInt(request.getParameter("price"));
	
		//resultStr = new BookDao().insertBook(title,author,category,price);
	}
		
		// POST 요청일 때만 DB 로직 수행
		if("POST".equals(request.getMethod())){
			
			String title = request.getParameter("bookTitle");
			String author = request.getParameter("author");
			String category = request.getParameter("category");
			// 가격이 빈 문자열일 경우를 대비한 방어 코드는 생략됨 (input value="0" 덕분에 일단 안전)
			int price = Integer.parseInt(request.getParameter("price"));
			
			String sql = "INSERT INTO BOOK VALUES(SEQ_BNO.NEXTVAL,?,?,?,?)";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			int result = 0; // 초기값 0
			
			try{
				// 1. 드라이버 로딩 (필수는 아니지만 권장)
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC", "JDBC");
				conn.setAutoCommit(false); // 수동 커밋 모드
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, title);
				pstmt.setString(2, author);
				pstmt.setString(3, category);
				pstmt.setInt(4, price);
				
				// [중요] 실행 결과를 result 변수에 담아야 합니다!
				result = pstmt.executeUpdate();
				
				if(result > 0){
					conn.commit();
					resultStr = "등록 성공";
				} else {
					conn.rollback();
					resultStr = "등록 실패";
				}
				
			} catch(Exception e){
				e.printStackTrace();
				// 에러 발생 시에도 롤백 처리
				if(conn != null) try { conn.rollback(); } catch(Exception ex) {}
				resultStr = "오류 발생";
			} finally {
				// 자원 반납 (Null 체크 포함)
				try{
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch(Exception e){
					e.printStackTrace();					
				}
			}
		}

	%>

	<h1>책 정보 등록 페이지</h1>
	
	<form action="" method="post">
	 	책 제목 : <input type="text" name="bookTitle"> <br>
	 	저자 : <input type="text" name="author"> <br>
	 	카테고리 :
	 		<select name="category">
				<option>코믹</option>
				<option>멜로</option>
				<option>판타지</option>
			</select> <br>
	 	가격 : <input type="number" name="price" value="0"><br>
	 	
	 	<input type="submit" value="등록">
	</form>
	
	<% if(resultStr != null){ %>
		<h2 style="color: blue;">결과 : <%= resultStr %></h2>
	<% } %>
</body>
</html>