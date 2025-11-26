package com.kh.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class BookDao {
	
	public String insertBook(String title,String author,String category,int price) {
		
		String resultStr = null;// 결과 변수

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
		return resultStr;
	}
}
	


