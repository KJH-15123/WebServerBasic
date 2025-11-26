<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피자 주문 페이지</title>
</head>
<body>
	<h1>피자 주문 페이지</h1>
	
	
	<h2>오늘 날짜 :</h2>
	<!-- 
		pizzaController
		전달받은 데이터 모두 알맞은 변수 처리하기
		console에 출력하여 확인하기
	 -->
	
	<form action="/jsp/order.pz" method="post">
		<fieldset>
			<legend>주문자 정보</legend>
			<table>
				<tr>
					<th>이름</th>
					<td> <input type="text" name="userName" required> </td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td> <input type="text" name="phone" required> </td>
				</tr>
				<tr>
					<th>주소</th>
					<td> <input type="text" name="address" required> </td>
				</tr>
				<tr>
					<th>요청사항</th>
					<td> <textarea rows="3" cols="25" name="message"></textarea> </td>
				</tr>
			</table>
		</fieldset>
	
		<fieldset>
			<legend>주문정보</legend>
			<table>
				<tr>
					<th>피자</th>
					<td>
						<select name="pizza">
							<option>콤비네이션 피자</option>
							<option>불고기 피자</option>
							<option>하와이안 피자</option>
							<option>치즈 피자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>토핑</th>
					<td>
						<input type="checkbox" name="topping" value="치즈크러스트">치즈크러스트
						<input type="checkbox" name="topping" value="치즈바이트">치즈바이트
						<input type="checkbox" name="topping" value="파인애플토핑">파인애플토핑
						<input type="checkbox" name="topping" value="불고기토핑">불고기토핑
						<input type="checkbox" name="topping" value="크림치즈바이트">크림치즈바이트
					</td>
				</tr>
				<tr>
					<th>사이드</th>
					<td>
						<input type="checkbox" name="side" value="콜라">콜라
						<input type="checkbox" name="side" value="사이다">사이다
						<input type="checkbox" name="side" value="갈릭소스">갈릭소스
						<input type="checkbox" name="side" value="핫소스">핫소스
						<input type="checkbox" name="side" value="피클">피클
					</td>
				</tr>
				<tr>
					<th>결제방식</th>
					<td>
						<input type="radio" name="payment" value="card" checked> 카드결제
						<input type="radio" name="payment" value="cash"> 현금결제
					</td>
				</tr>
			</table>
		</fieldset>
		<br>
		<input type="submit" value="주문">
		<input type="reset" value="초기화">
	</form>	
	
</body>
</html>