package com.kh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 요청 경로를 받아 응답할 수 있도록 하는 어노테이션 : @WebServlet("요청경로")
 * 요청 경로 : url 패턴
 * 요청할때 contextRoot 기준으로 뒤에 작성되어 요청되는 url 경로(패턴)이고
 * 항상 /로 시작하여 작성할 것
 * 중복된 url 패턴이 있으면 오류 발생 - 각 서블릿에는 고유한 url 패턴이 있어야 한다.
 * */
@WebServlet("/test")
public class RequestGetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestGetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * Get 방식으로 요청하면 doGet 메서드가 응답한다.
		 * 
		 * 첫번째 매개변수인 HttpServletRequest resquest에는 요청시 전달된 내용들이 담긴다.
		 * ex) 사용자가 입력한 값,요청전송 방식,요청한 사용자의 ip등등
		 * 두번째 매개변수인 HttpsServletResponse response에는 요청 처리 후 응답을 할 때 사용하는 객체가 담긴다.
		 * 
		 * 요청시에 전달된 값을 추출하는 방법
		 * request 객체의 parameter 영역 안에 존재하며 이는 key-value 세트로 담겨있다.
		 * 이때 key는 전달할때의 name 속성값이 담겨있고 value는 그 input요소가 가지고 있던 value값이 담겨있음.
		 * 
		 * 해당 key값으로 value를 추출하는 메서드
		 * request.getParameter("키") : String(해당 Key에 담긴값(value)
		 * - 해당 메서드로 추출하면 문자열로 반환되기 때문에 다른 자료형이라면 파싱(형변환)처리를 해야한다.
		 * 
		 * request.getParameterValues("키") : String[] (해당 key로 묶여 담긴 value들)
		 * - 하나의 key(name속성값)으로 여러개의 value를 받을 경우 (체크박스)문자열 배열 형태로 반환 받게 된다.
		 * 
		 */
		//전달받은 데이터 추출하여 자바 변수에 담아서 출력해보기
		
		String name = request.getParameter("userName");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address");
		double height = Double.parseDouble(request.getParameter("height"));
		String[] food = request.getParameterValues("food");
		
		System.out.println("이름: "+name);
		System.out.println("성별: "+gender);
		System.out.println("나이: "+age);
		System.out.println("주소: "+address);
		System.out.println("키: "+height);
		System.out.println("음식 종류: "+ Arrays.toString(food));
		
		//service->dao-db
		//DB등록 작업을 수행하고 응답을 받았다고 가정하고 진행
		
		//위 데이터를 응답화면으로 구성하여 보여주기
		
		//응답할 페이지의 형식과 인코딩을 설정
		response.setContentType("text/html; charset=UTF-8");
		
		//응답하고자 하는 사용자와의 연결통로 준비(스트림)
		//응답 객체 response에서 응답 스트림 추출
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>Servlet</title>");
		pw.println("</head>");
		pw.println("<body>");

		pw.println("<h2>개인정보 응답 화면");
		pw.println("<span>"+name+"님은</span>");
		pw.println("<span>"+age+"살이고</span>");
		pw.println("<span>"+address+"에 사는 사람이고</span>");
		pw.println("<span>성별은 "+gender+"이고</span>");
		pw.println("<span>키는 "+height+"cm</span>");
		pw.println("<span>좋아하는 음식류는");
		if(food==null) {
			pw.println("<span>없습니다.</span>");
		}else {
			pw.println("<ul>");
			for (int i = 0; i < food.length; i++) {
				if(food[i]!="") {
				pw.println("<li>"+food[i]+"</li>");
				}
			}
			pw.println("</ul>");
		}
		pw.println("</body>");
		pw.println("</html>");

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
