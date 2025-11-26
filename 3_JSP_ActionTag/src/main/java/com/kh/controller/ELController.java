package com.kh.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.model.vo.Student;

/**
 * Servlet implementation class ELController
 */
@WebServlet("/el.do")
public class ELController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ELController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//01_el.jsp 페이지로 요청 위임
		/*
		 * 데이터를 담을 수 있는 JSP 내장 객체 종류 (scope == 영역)
		 * 1. ServletContext(Application Scope)
		 * - 한 어플리케이션당 1개만 존재하는 객체,해당 영역에 데이터를 담으면 어플리케이션 전역에서 사용가능
		 * (공우 범위가 가장 크다
		 * 
		 * 2. HttpSession(Session Scope)
		 * - 한 브라우저당 1개 존재하는 객체
		 * 해당 영역에 데이터를 담으면 모든 jsp/모든 servlet에서 사용 가능하다.
		 * 값이 한번 담기면 서버가 멈추거나 브라우저가 닫히기 전까지 사용 가능
		 * 
		 * 3. HttpServletRequest(request Scope)
		 * - 요청 및 응답시 매번 갱신되는 객체
		 * 	해당 영역에 데이터를 담으면 해당 request객체를 포워딩 받는 응답 jsp에서만 사용 가능하다(1회성)
		 * - 공유 범위가 해당 요청에 대한 응답 JSP뿐이다.
		 * 
		 * 4. PageContext(page Scope)
		 * - 현재 jsp 페이지에서만 사용 가능
		 * 공유 범위가 가장 작다
		 * 
		 * 위 객체들을 사용하는 공통 메서드
		 * 데이터 담기 : .setAttribute(키,값);
		 * 데이터 추출 : .getAttribute(키);
		 * 데이터 지우기 : .removeAttribute(키);
		 * */
		
		//각 영역에 데이터 담아서 확인하기
		//requestScope에 담기
		
		request.setAttribute("classRoom","S강의장");
		request.setAttribute("student",new Student("김학생",20,"남성"));
		
		//sessionScope에 담기
		HttpSession session = request.getSession();
		session.setAttribute("academy","KH정보 교육원");
		session.setAttribute("student2", new Student("이학생",25,"여자"));
		
		//request와 session에 동일한 키값으로 데이터 담아보기
		request.setAttribute("scope", "request Scope!");
		session.setAttribute("scope", "session Scope!");
		
		//applicationScope에 담기
		ServletContext application = request.getServletContext();
		application.setAttribute("scope", "application Scope!");
		
		
		//01_el.jsp 페이지로 요청
		request.getRequestDispatcher("/WEB-INF/views/1_EL/01_el.jsp").forward(request, response);
		
		
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
