package com.academy.vo;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		// cmd 추출
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());
		AcademyDAO adao = AcademyDAO.getInstance();
		UserVO uvo;
		NoticeVO nvo;
		CommentsVO cvo;
		ANoticeVO avo;
		FileVO fvo;
		List<NoticeVO> nvo2;
		ArrayList<NoticeVO> nvoList;
		List<ANoticeVO> avoList;
		ArrayList<FileVO> fvoList;
		PrintWriter out = null;

		if (cmd.equals("/signupProc.do")) {// 회원가입 후 login.jsp로 이동
			uvo = new UserVO(request.getParameter("userId"), request.getParameter("userPwd"),
					request.getParameter("userName"), request.getParameter("email"), request.getParameter("phoneNo"),
					request.getParameter("subjectName"), Integer.parseInt(request.getParameter("division")));
			adao.insertUser(uvo);
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} else if (cmd.equals("/loginProc.do")) { // 로그인 후 mainform.jsp로 이동
			String userId = request.getParameter("userId");
			String userPwd = request.getParameter("userPwd");
			System.out.println("Controller userId "+ userId);

			if (userId.isEmpty() || userPwd.isEmpty()) {
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			HashMap<String, Object> map = adao.loginCheck(userId, userPwd);
			System.out.println(" Controller  map : " +  map.get("key"));
			if (Integer.parseInt(map.get("key").toString()) == 1) {
				request.setAttribute("user", map.get("user"));
			}
			request.setAttribute("ok", map.get("key"));
			request.setAttribute("adao", adao.selectBoardAll());
			request.setAttribute("Aadao", adao.AselectBoardAll()); //전체공지사항의 제목만 보이는거

			RequestDispatcher rd = request.getRequestDispatcher("mainform.jsp");
			rd.forward(request, response);
			// 공지사항
		} else if (cmd.equals("/goHome.do")) {   //홈버튼 클릭시 메인폼으로
	         request.setAttribute("adao", adao.selectBoardAll());
	         request.setAttribute("Aadao", adao.AselectBoardAll());
	         RequestDispatcher rd = request.getRequestDispatcher("mainform.jsp");
	         rd.forward(request, response);
	         
	      } else if (cmd.equals("/writeCheck.do")) {
			String userId = request.getParameter("userId");

			int ok = adao.writeCheck(userId);
			request.setAttribute("ok", ok);

			RequestDispatcher rd = request.getRequestDispatcher("write.jsp");
			rd.forward(request, response);

		} else if (cmd.equals("/writeProc.do")) {
			String userId = request.getParameter("userId");
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			nvo = new NoticeVO(userId, title, content);
			adao.insertNotice(nvo);

			RequestDispatcher rd = request.getRequestDispatcher("viewProc.do");
			rd.forward(request, response);
		} else if (cmd.equals("/viewProc.do")) {

			nvoList = adao.selectNoticeAll();
			request.setAttribute("nvoList", nvoList);

			RequestDispatcher rd = request.getRequestDispatcher("writeView.jsp");
			rd.forward(request, response);
		} else if (cmd.equals("/detailViewProc.do")) {
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));

			adao.increaseHit(boardNo);
			request.setAttribute("nvo", adao.selectNotice(boardNo));
			request.setAttribute("cvoList", adao.selectComments(boardNo));
			request.setAttribute("commentCount", adao.commentCount(boardNo));
			System.out.println("commentCount : "+adao.commentCount(boardNo));
			RequestDispatcher rd = request.getRequestDispatcher("detailView.jsp");
			rd.forward(request, response);
		} else if (cmd.equals("/updelProc.do")) {
			String threebtn = request.getParameter("threebtn");
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));

			request.setAttribute("nvo", adao.selectNotice(boardNo));

			if (threebtn.equals("수정")) {
				RequestDispatcher rd = request.getRequestDispatcher("updateForm.jsp");
				rd.forward(request, response);
			} else if (threebtn.equals("삭제")) {
				adao.deleteNotice(boardNo);

				RequestDispatcher rd = request.getRequestDispatcher("viewProc.do");
				rd.forward(request, response);
			}
		} else if (cmd.equals("/updateProc.do")) {
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			nvo = new NoticeVO(boardNo, title, content);
			adao.updateNotice(nvo);
			request.setAttribute("boardNo", boardNo);

			RequestDispatcher rd = request.getRequestDispatcher("detailViewProc.do");
			rd.forward(request, response);
		} else if (cmd.equals("/mainform.do")) { // 메인폼에서 수강과목 클릭시 subject_main.jsp로 이동
			HttpSession session = request.getSession();
			//	         String userId = (String) session.getAttribute("userId");
			String userId = request.getParameter("userId");
			String subjectName = request.getParameter("subjectName");
			//	         uvo =adao.checkView(userId, subjectName);
			nvo2 = adao.selectBoard(subjectName);
			// C언어 일때

			/*
			 * if (subjectName.equals("C")) { int ok = adao.checkView(userId, subjectName);
			 * request.setAttribute("ok", ok); RequestDispatcher rd =
			 * request.getRequestDispatcher("subject_main.jsp"); rd.forward(request,
			 * response); } else if (subjectName.equals("JAVA")) { int ok =
			 * adao.checkView(userId, subjectName); request.setAttribute("ok", ok);
			 * RequestDispatcher rd = request.getRequestDispatcher("subject_main.jsp");
			 * rd.forward(request, response); } else if (subjectName.equals("Python")) { int
			 * ok = adao.checkView(userId, subjectName); request.setAttribute("ok", ok);
			 * RequestDispatcher rd = request.getRequestDispatcher("subject_main.jsp");
			 * rd.forward(request, response); } else { out.println(
			 * "<script>alert('수강중인 과목이 아닙니다.\n -관리자에게 문의해주세요.-'); location.href='history.back()';</script>"
			 * ); }
			 */

			request.setAttribute("test", nvo2);

			System.out.println("size " + nvo2.size());
			RequestDispatcher rd = request.getRequestDispatcher("subject_main.jsp");
			rd.forward(request, response);
		} else if (cmd.equals("/cWriteProc.do")) {
			int btn=Integer.parseInt(request.getParameter("btn"));
			int boardNo=Integer.parseInt(request.getParameter("boardNo"));

			if(btn==0) { //확인 버튼 눌렀을 때
				String userId=request.getParameter("userId");
				String comment= request.getParameter("comment");

				cvo = new CommentsVO(userId,comment,boardNo);
				adao.insertComment(cvo);

				RequestDispatcher rd = request.getRequestDispatcher("detailViewProc.do");
				rd.forward(request, response);

			} else { // 삭제 버튼 눌렀을 때
				adao.deleteComment(btn);

				RequestDispatcher rd = request.getRequestDispatcher("detailViewProc.do");
				rd.forward(request, response);
			}

		} else if (cmd.equals("/mypage.do")) { // mypage에서 출력 //head or 퀵메뉴에서 받아오면 됨.
			HttpSession session = request.getSession(); // 마이페이지
			String userId = (String) session.getAttribute("userId");

			uvo = adao.selectUser(userId);

			request.setAttribute("item", uvo);

			RequestDispatcher rd = request.getRequestDispatcher("/mypage.jsp");
			rd.forward(request, response);

		} else if (cmd.equals("/myProc.do")) { // mypage.jsp에서 받아옴

			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("userId");

			System.out.println("userId >>" + userId);
			uvo = adao.selectUser(userId);
			request.setAttribute("item", uvo);

			RequestDispatcher rd = request.getRequestDispatcher("/mypageUpdate.jsp");
			rd.forward(request, response);

		} else if (cmd.equals("/mypageUpdateProc.do")) {

			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("userId");
			System.out.println("userId : " + userId);

			String userName = request.getParameter("userName");
			String userPwd = request.getParameter("userPwd");
			String phoneNo = request.getParameter("phoneNo");
			String email = request.getParameter("email");

			System.out.println(adao.mypageUpdate(new UserVO(userId, userName, userPwd, phoneNo, email)));

			RequestDispatcher rd = request.getRequestDispatcher("mypage.do");
			rd.forward(request, response);

			// response.sendRedirect(request.getContextPath() + "/mypage.jsp");
		} else if (cmd.equals("/deleteProc.do")) {
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("userId");

			adao.deleteUser(userId);
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/login.jsp");

			// 희수 전체 글보기
		} else if (cmd.equals("/AwriteCheck.do")) {

			String userId = request.getParameter("userId");

			int ok = adao.AwriteCheck(userId);
			request.setAttribute("ok", ok);

			RequestDispatcher rd = request.getRequestDispatcher("/Awrite.jsp");
			rd.forward(request, response);

		} else if (cmd.equals("/AwriteProc.do")) {
			String userId = request.getParameter("userId");
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			avo = new ANoticeVO(userId, title, content);
			adao.AinsertNotice(avo);

			RequestDispatcher rd = request.getRequestDispatcher("AviewProc.do");
			rd.forward(request, response);
		} else if (cmd.equals("/AviewProc.do")) {
			avoList = adao.AselectNoticeAll();
			request.setAttribute("avoList", avoList);

			RequestDispatcher rd = request.getRequestDispatcher("AwriteView.jsp");
			rd.forward(request, response);
		} else if (cmd.equals("/AdetailViewProc.do")) {
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));

			adao.AincreaseHit(boardNo);
			request.setAttribute("avo", adao.AselectNotice(boardNo));

			RequestDispatcher rd = request.getRequestDispatcher("AdetailView.jsp");
			rd.forward(request, response);
		} else if (cmd.equals("/AupdelProc.do")) {
			String threebtn = request.getParameter("threebtn");
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));

			request.setAttribute("avo", adao.AselectNotice(boardNo));

			if (threebtn.equals("수정")) {
				RequestDispatcher rd = request.getRequestDispatcher("AupdateForm.jsp");
				rd.forward(request, response);
			} else if (threebtn.equals("삭제")) {
				adao.deleteNotice(boardNo);

				RequestDispatcher rd = request.getRequestDispatcher("AviewProc.do");
				rd.forward(request, response);
			}
		} else if (cmd.equals("/AupdateProc.do")) {
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			avo = new ANoticeVO(boardNo, title, content);
			adao.AupdateNotice(avo);
			request.setAttribute("boardNo", boardNo);

			RequestDispatcher rd = request.getRequestDispatcher("AdetailViewProc.do");
			rd.forward(request, response);
		} else if (cmd.equals("/Logout.do")) {
			HttpSession session = request.getSession();
			session.invalidate();

			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} else if (cmd.equals("/goHome.do")) {   //홈버튼 클릭시 메인폼으로
			request.setAttribute("adao", adao.selectBoardAll());
			request.setAttribute("Aadao", adao.AselectBoardAll());
			RequestDispatcher rd = request.getRequestDispatcher("mainform.jsp");
			rd.forward(request, response);
			//------------------과제(하다 맒)---------------------
		}else if (cmd.equals("/hwViewProc.do")) { 
			
			RequestDispatcher rd = request.getRequestDispatcher("homeworkView.jsp");
			rd.forward(request, response);
		}else if (cmd.equals("hwWriteCheck.do")) {
			String userId = request.getParameter("userId");

			int ok = adao.writeCheck(userId);
			request.setAttribute("ok", ok);

			RequestDispatcher rd = request.getRequestDispatcher("hwWrite.jsp");
			rd.forward(request, response);
			//-------------------자료실----------------------
		}else if(cmd.equals("/dataViewProc.do")) {
			
			fvoList = adao.selectFileAll();
			request.setAttribute("fvoList", fvoList);
			
			RequestDispatcher rd = request.getRequestDispatcher("dataView.jsp");
			rd.forward(request, response);
		}else if(cmd.equals("/dataWriteCheck.do")) {
			String userId = request.getParameter("userId");

			int ok = adao.writeCheck(userId);
			request.setAttribute("ok", ok);

			RequestDispatcher rd = request.getRequestDispatcher("dataWrite.jsp");
			rd.forward(request, response);
		}else if (cmd.equals("/dataWriteProc.do")) {
			int size = 1024* 1024*10; //10m
			ServletContext application =request.getServletContext(); 
			String path= application.getRealPath("/upload"); 
			
			try{
				MultipartRequest multi = new MultipartRequest(
				request,path,size,"UTF-8", new DefaultFileRenamePolicy()); 
				
				Enumeration files = multi.getFileNames(); 
				String name=(String)files.nextElement();
				String fileName = multi.getFilesystemName(name); //파일명
				String userId = multi.getParameter("userId");
				String title = multi.getParameter("title");
				String content = multi.getParameter("content");
				
				fvo = new FileVO(userId, title, content, fileName);
				adao.insertFile(fvo);
				
				RequestDispatcher rd= request.getRequestDispatcher("/dataViewProc.do");
				rd.forward(request, response);
			}catch(Exception e){
				System.out.print("업로드 오류 발생");
			}
		}else if(cmd.equals("/downloadProc.do")) { //file download
			// ① 파일명 가져오기
			String fileName=request.getParameter("fileName");
			// ② 경로 가져오기
			String saveDir = this.getServletContext().getRealPath("upload");
			File file = new File(saveDir + "/" + fileName);
			// ③ MIMETYPE 설정하기
			String mimeType = getServletContext().getMimeType(file.toString());
			if(mimeType == null)
			{
				response.setContentType("application/octet-stream");
			}
			// ④ 다운로드용 파일명을 설정
			String downName = null;
			if(request.getHeader("user-agent").indexOf("MSIE") == -1)
			{
				downName = new String(fileName.getBytes("UTF-8"), "8859_1");
			}
			else
			{
				downName = new String(fileName.getBytes("EUC-KR"), "8859_1");
			}
			// ⑤ 무조건 다운로드하도록 설정
			response.setHeader("Content-Disposition","attachment;filename=\"" + downName + "\";");
			
			// ⑥ 요청된 파일을 읽어서 클라이언트쪽으로 저장한다.
			FileInputStream fileInputStream = new FileInputStream(file);
			ServletOutputStream servletOutputStream = response.getOutputStream();
			
			byte b [] = new byte[1024];
			int data = 0;
			
			while((data=(fileInputStream.read(b, 0, b.length))) != -1)
			{
				servletOutputStream.write(b, 0, data);
			}
			
			servletOutputStream.flush();
			servletOutputStream.close();
			fileInputStream.close();
		}else if(cmd.equals("/dataDetailViewProc.do")) {
			
			int boardNo=Integer.parseInt(request.getParameter("boardNo"));		
			request.setAttribute("fvo", adao.selectFile(boardNo));
	
			RequestDispatcher rd = request.getRequestDispatcher("dataDetailView.jsp");
			rd.forward(request, response);
		}else if(cmd.equals("/dataUpdelProc.do")) {
			//자료실 수정 삭제 판별
		}
	}
}
