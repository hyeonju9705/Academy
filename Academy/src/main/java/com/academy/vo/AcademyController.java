package com.academy.vo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class AcademyController
 */
@WebServlet("*.do")
public class AcademyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcademyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request,response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
	      //cmd 추출
	      String uri = request.getRequestURI();
	      String ctxPath = request.getContextPath();
	      String cmd= uri.substring(ctxPath.length());
	      AcademyDAO adao = AcademyDAO.getInstance();
	      UserVO uvo;
	      NoticeVO nvo;
	      ArrayList<NoticeVO> nvoList;
	      
	      if(cmd.equals("/signupProc.do")) {
	         //회원가입 후 login.jsp로 이동
	         uvo = new UserVO(request.getParameter("userId"),request.getParameter("userPwd"),request.getParameter("userName"),request.getParameter("email"),
	               request.getParameter("phoneNo"),request.getParameter("subjectName"),Integer.parseInt(request.getParameter("division")));
	         adao.insertUser(uvo);
	         RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	         rd.forward(request, response);
	      } else if (cmd.equals("/loginProc.do")) { //친구분
	          
	          String userId = request.getParameter("userId");
	          String userPwd = request.getParameter("userPwd");

	          if (userId.isEmpty() || userPwd.isEmpty()) {
	             RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	             rd.forward(request, response);
	          }
	          HashMap<String, Object> map = adao.loginCheck(userId, userPwd);
	          if (Integer.parseInt(map.get("key").toString()) == 1) {
	             request.setAttribute("user", map.get("user"));
	          }
	          request.setAttribute("ok", map.get("key"));
	          request.setAttribute("adao", adao.selectBoardAll());

	          RequestDispatcher rd = request.getRequestDispatcher("mainform.jsp");
	          rd.forward(request, response);
	       }

	      else if(cmd.equals("/writeCheck.do")) {
			
			String userId=request.getParameter("userId");
			
			int ok=adao.writeCheck(userId);
			request.setAttribute("ok", ok);
			
			RequestDispatcher rd = request.getRequestDispatcher("write.jsp");
			rd.forward(request, response);
			
		}else if(cmd.equals("/writeProc.do")) {
			
			String userId=request.getParameter("userId");
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			nvo = new NoticeVO(userId,title,content);
			adao.insertNotice(nvo);
			
			RequestDispatcher rd = request.getRequestDispatcher("viewProc.do");
			rd.forward(request, response);
		}else if(cmd.equals("/viewProc.do")) {
			
			nvoList=adao.selectNoticeAll();
			request.setAttribute("nvoList", nvoList);
			
			RequestDispatcher rd = request.getRequestDispatcher("writeView.jsp");
			rd.forward(request, response);
		}else if(cmd.equals("/detailViewProc.do")) {
			int boardNo=Integer.parseInt(request.getParameter("boardNo"));
			
			adao.increaseHit(boardNo);
			request.setAttribute("nvo", adao.selectNotice(boardNo));
			
			RequestDispatcher rd = request.getRequestDispatcher("detailView.jsp");
			rd.forward(request, response);
		}else if(cmd.equals("/updelProc.do")) {
			String threebtn=request.getParameter("threebtn");
			int boardNo= Integer.parseInt(request.getParameter("boardNo"));

			request.setAttribute("nvo", adao.selectNotice(boardNo));
			
			if(threebtn.equals("수정")) {
				RequestDispatcher rd = request.getRequestDispatcher("updateForm.jsp");
				rd.forward(request, response);
			}else if(threebtn.equals("삭제")){
				adao.deleteNotice(boardNo);
				
				RequestDispatcher rd = request.getRequestDispatcher("viewProc.do");
				rd.forward(request, response);
			}
		}else if(cmd.equals("/updateProc.do")) {
			int boardNo= Integer.parseInt(request.getParameter("boardNo"));
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			nvo = new NoticeVO(boardNo,title,content);
			adao.updateNotice(nvo);
			request.setAttribute("boardNo",boardNo);
			
			RequestDispatcher rd = request.getRequestDispatcher("detailViewProc.do");
			rd.forward(request, response);
		} else if (cmd.equals("/mainform.do")) {
	         HttpSession session = request.getSession();
	         String userId = (String) session.getAttribute("userId");
	         String subjectName = request.getParameter("subjectName");
	         
	         System.out.println("aaa:"+subjectName);
	         // C언어 일때
	         /*
	          * if (subjectName.equals("C")) { int ok = adao.checkView(userId, subjectName);
	          * request.setAttribute("ok", ok); System.out.println("cccc"+subjectName);
	          * RequestDispatcher rd = request.getRequestDispatcher("subject_main.jsp");
	          * rd.forward(request, response); }else if(subjectName.equals("JAVA")) { int ok
	          * = adao.checkView(userId, subjectName); request.setAttribute("ok", ok);
	          * System.out.println("bbb"+subjectName); RequestDispatcher rd =
	          * request.getRequestDispatcher("subject_main.jsp"); rd.forward(request,
	          * response); }else if(subjectName.equals("Python")) { int ok =
	          * adao.checkView(userId, subjectName); request.setAttribute("ok", ok);
	          * System.out.println("dddd"+subjectName); RequestDispatcher rd =
	          * request.getRequestDispatcher("subject_main.jsp"); rd.forward(request,
	          * response); }else { out.
	          * println("<script>alert('수강중인 과목이 아닙니다.\n -관리자에게 문의해주세요.-'); location.href='history.back()';</script>"
	          * ); }
	          */
	      }

		
	}

}
