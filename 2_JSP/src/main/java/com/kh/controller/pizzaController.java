package com.kh.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/order.pz")
public class pizzaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public pizzaController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String message = request.getParameter("message");
		String pizza = request.getParameter("pizza");
		String[] topping = request.getParameterValues("topping");
		String[] side = request.getParameterValues("side");
		String payment = request.getParameter("payment");
		
		
		System.out.println(name);
		System.out.println(phone);
		System.out.println(address);
		System.out.println(message);
		System.out.println(pizza);
		System.out.println(Arrays.toString(topping));
		System.out.println(Arrays.toString(side));
		System.out.println(payment);
		
		//선택에 따라서 메뉴 결제 가격 처리하기
		
		int price = 0;
		
		//피자 메뉴에 따른 가격 처리
		
		switch(pizza){
			case "콤비네이션 피자" : price += 15000;break;
			case "불고기 피자" : price +=13000;break;
			case "하와이안 피자" : price += 12400;break;
			case "치즈 피자" : price += 11500; break;
		}
		
		//토핑 가격 추가(null값 처리)
		
		if(topping!=null){
			for(String top : topping) {
				switch(top) {
					case "치즈크러스트" : price += 3000;break;
					case "치즈바이트" : price += 2700;break;
					case "파인애플토핑" : price += 7000;break;
					case "불고기토핑" : price += 8000;break;
					case "크림치즈바이트" : price += 7500;break;
				}
			}
		}
		
		//사이드 가격 추가
		
		if(side!=null){
			for(String s : side) {
				switch(s) {
					case "콜라" :
					case "사이다" : price += 2000;break;
					case "갈릭소스" :
					case "핫소스" :
					case "피클" : price += 500;break;
				}
			}
		}
		
		//응답 페이지로 데이터 전달하기
		request.setAttribute("name",name);
		request.setAttribute("phone",phone);
		request.setAttribute("address",address);
		request.setAttribute("message",message);
		request.setAttribute("pizza",pizza);
		request.setAttribute("topping",topping);
		request.setAttribute("side",side);
		request.setAttribute("payment",payment);
		request.setAttribute("price",price);
		
		//응답하는 jsp를 선택해서 전달
		RequestDispatcher view = request.getRequestDispatcher("/views/pizzaView.jsp");
		
		//응답 페이지로 이동(위임-포워딩)
		view.forward(request, response);

		
		
		
	
	}

}
