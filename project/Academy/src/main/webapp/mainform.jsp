<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="css/mainform.css" rel="stylesheet" type="text/css">
<style>
.cal-box {
	border: 2px pink;
	border-style: dashed;
	padding: 30px;
}
</style>
</head>
<script type="text/javascript">
<%String userId = session.getId();
if (request.getHeader("referer").equals("http://192.168.0.16:9000/Academy/login.jsp")) {
	int ok = (Integer) request.getAttribute("ok");
	if (ok == 1) { //아이디 비번 일치, 회원이면서 비번 일치
		session.setAttribute("user", request.getAttribute("user"));
		session.setAttribute("userId", request.getParameter("userId"));%>
		debugger;
       alert('환영합니다. 아카데미 홈페이지에 방문해주셔서 감사합니다.');
    //   
 
<%} else if (ok == 2) {%> //회원이면서 비번 불일치
alert('비밀번호가 틀렸습니다. 확인 후 로그인 바랍니다.');

    location.href='<%=request.getContextPath()%>/login.jsp'; 
<%} else {%>
      alert('아이디가 틀렸습니다. 확인 후 로그인 바랍니다.'); //비회원임
       location.href='<%=request.getContextPath()%>
	/login.jsp';
<%}
}%>
	
</script>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%-- OKOKOK : <c:out value="${ok}"/>
	<c:if/>+ --%>
	<div class="total_content" >
		<!-- 컨텐츠 왼쪽 -->
		<div class="content">

			<div class="cal-box">
				<jsp:include page="calendar.jsp" />
			</div>
			<!-- 전체 공지사항 -->
			<div style="width: 600px;" class="first-box">
				<div class="subject">
					<div class="bar site-background-color"></div>
					<span class="welcome-font">ACADEMY 공지사항</span>
					<div class="whole" style="float: right; margin-top: 8px;">
						<div>
							<a href='AviewProc.do?userId=${userId}'> <img
								src="projectImages/btn_all.gif" alt="공지사항">
							</a>
						</div>
					</div>
				</div>
				<ol>
					<c:forEach var="Aitem" items="${Aadao }">
						<li
							style="padding-left: 10px; background: url('projectImages/ul_dot.png') no-repeat 0 49%">
							<a href='AdetailViewProc.do?boardNo=${Aitem.boardNo }'>[전체]
								${Aitem.title} </a>
						</li>
					</c:forEach>
					<li style="border-bottom: 1px dotted #E6E6E6;"></li>
				</ol>
			</div>

			<!-- 수강 과목 -->
			<div style="width: 600px;" class="first-box">
				<div class="subject">
					<div class="bar site-background-color"></div>
					<span class="welcome-font">수강과목</span>
				</div>
				<ol>
					<li class="term_info" style="color: #ff3385;">정규 수업</li>
					<li
						style="padding-left: 10px; background: url('projectImages/ul_dot.png') no-repeat 0 49%">
						<a name="subjectName" type="button"
						onclick="location.href='mainform.do?subjectName=C'">C언어
							(1017-01)</a> <!-- <a href="mainform.do">C언어 (1017-01)</a> -->
					</li>
					<li
						style="padding-left: 10px; background: url('projectImages/ul_dot.png') no-repeat 0 49%">
						<a name="subjectName" type="button"
						onclick="location.href='mainform.do?subjectName=JAVA'"> JAVA
							(1008-01)</a>
					</li>
					<li
						style="padding-left: 10px; background: url('projectImages/ul_dot.png') no-repeat 0 49%">
						<a name="subjectName" type="button"
						onclick="location.href='mainform.do?subjectName=Python'">
							Python (1010-01)</a>
					</li>
					<li style="border-bottom: 1px dotted #E6E6E6;"></li>
				</ol>
			</div>

			<!-- 공지사항 -->
			<div style="width: 600px;" class="first-box">
				<div class="subject">
					<div class="bar site-background-color"></div>
					<span class="welcome-font">과목 공지사항</span>
					<div class="whole" style="float: right; margin-top: 8px;">
						<%-- <a href='viewProc.do?userId=<%=request.getParameter("userId")%>'> --%>
						<a
							href='viewProc.do?userId=${userId}&subjectName=${user.subjectName}'>
							<img src="projectImages/btn_all.gif" alt="공지사항">
						</a>
					</div>
				</div>
				<ol>
					<c:forEach var="item" items="${adao }">
						<li
							style="padding-left: 10px; background: url('projectImages/ul_dot.png') no-repeat 0 49%">
							<a
							href="detailViewProc.do?boardNo=${item.boardNo }&subjectName=${item.subjectName}">[${item.subjectName }]
								${item.title}</a>
						</li>
					</c:forEach>
				</ol>
			</div>

		</div>


		<div class="right_aside">
			<!-- 콘텐트 오른쪽 -->
			<fieldset class="icon-box">
            <div class="title-01" style="margin-left: 19%;">
               <span class="site-font-color" style="color: #ff3385">Quick
                  Menu</span>
               <div class="icon-subject"></div>
            </div>
            
            <div class="icon-subject">
               <img src="projectImages/subject.png">
               <div class="iconn-my">
                  <a href="mainform.do?subjectName=${user.subjectName }">수강과목</a>
               </div>
            </div>

            <div class="icon-bar">
               <img src="projectImages/iconbar.png">
            </div>

            <div class="icon-my">
               <img src="projectImages/my.png">
               <div class="iconn-my">
                  <a href="mypage.do?userId=${userId}">마이페이지</a>
               </div>
            </div>


            <div class="icon-bar">
               <img src="projectImages/iconbar.png">
            </div>

            <div class="icon-faq">
               <a href="qnaForm.jsp"><img src="projectImages/faq.png"></a>
               <div class="iconn-my">
                  <a href="qnaForm.jsp">FAQ</a>
               </div>
            </div>


         </fieldset>

			<div class="line"></div>
			<div class="line2"></div>
			<!-- <div class="line"></div>
			<div class="line2"></div> -->

			<!-- 콘텐트 오른쪽 아래 -->
			<aside id="main_aside">
				<input id="first" type="radio" name="tab" checked="checked" /> <input
					id="second" type="radio" name="tab" /> <input id="third"
					type="radio" name="tab" />
				<section class="buttons">
					<label for="first">JAVA</label> <label for="second">C</label> <label
						for="third">Python</label>
				</section>
				<div class="tab_item">
					<ul>
						<li class="item"><a
							href="https://www.youtube.com/watch?v=jdTsJzXmgU0&list=PLuHgQVnccGMCeAy-2-llhw3nWoQKUvQck">
								<div class="thumbnail">
									<img src="projectImages/java3.PNG" width="70" height="50">
								</div>
								<div class="description">
									<strong>[생활코딩]<br>Java 입문 수업
									</strong>
								</div>
						</a></li>
						<li class="item"><a
							href="https://www.youtube.com/watch?v=oJlCC1DutbA&list=PLW2UjW795-f6xWA2_MUhEVgPauhGl3xIp">
								<div class="thumbnail">
									<img src="projectImages/java2.PNG" width="70" height="50">
								</div>
								<div class="description">
									<strong>[남궁성의 정석코딩]<br>자바의 정석 기초편
									</strong>
								</div>
						</a></li>
						<li class="item"><a
							href="https://www.youtube.com/playlist?list=PLpkj8RKr48wYXFtzJdXUo46tmxnj94mjB">
								<div class="thumbnail">
									<img src="projectImages/java3.PNG" width="70" height="50">
								</div>
								<div class="description">
									<strong>[인프런]<br>실전 자바 강좌
									</strong>
								</div>
						</a></li>
						<li class="item"><a
							href="https://www.youtube.com/watch?v=nGiSIToTwdQ&list=PLyebPLlVYXCgb5B-toSOvivS1RChZLnNu">
								<div class="thumbnail">
									<img src="projectImages/java4.PNG" width="70" height="50">
								</div>
								<div class="description">
									<strong>[홍팍]<br>자바 기초 입문 강의
									</strong>
								</div>
						</a></li>
					</ul>
				</div>
				<div class="tab_item">
					<ul>
						<li class="item"><a
							href="https://www.youtube.com/watch?v=dh4hdtZ00EU&list=PLRx0vPvlEmdDNHeulKC6JM25MmZVS_3nT">
								<div class="thumbnail">
									<img src="projectImages/c1.PNG " width="70" height="50">
								</div>
								<div class="description">
									<strong>[동빈나]<br>c언어 기초 프로그래밍 강좌
									</strong>
								</div>
						</a></li>
						<li class="item"><a
							href="https://www.youtube.com/playlist?list=PLMsa_0kAjjrdiwQykI8eb3H4IRxLTqCnP">
								<div class="thumbnail">
									<img src="projectImages/c2.PNG" width="70" height="50">
								</div>
								<div class="description">
									<strong>[나도코딩] <br>C언어 초보강의
									</strong>
								</div>
						</a></li>
						<li class="item"><a
							href="https://www.youtube.com/playlist?list=PLlJhQXcLQBJqywc5dweQ75GBRubzPxhAk">
								<div class="thumbnail">
									<img src="projectImages/c3.PNG" width="70" height="50">
								</div>
								<div class="description">
									<strong>[두들낙서] <br>두들낙서의 C/C++ 강좌
									</strong>
								</div>
						</a></li>
						<li class="item"><a
							href="https://www.youtube.com/playlist?list=PL4SIC1d_ab-b4zy_3FDRIiohszShOZ0PK">
								<div class="thumbnail">
									<img src="projectImages/c4.PNG" width="70" height="50">
								</div>
								<div class="description">
									<strong>[어소트락 게임아카데미]<br>C언어 무료강의
									</strong>
								</div>
						</a></li>
					</ul>
				</div>
				<div class="tab_item">
					<ul>
						<li class="item"><a
							href="https://www.youtube.com/playlist?list=PLz2iXe7EqJOOTNTK27a4-WsgZU5NVfguh">
								<div class="thumbnail">
									<img src="projectImages/python1.PNG " width="70" height="50">
								</div>
								<div class="description">
									<strong>[소눌코딩]<br>파이썬 기초 강의
									</strong>
								</div>
						</a></li>
						<li class="item"><a
							href="https://www.youtube.com/watch?v=yytWGELNeOI">
								<div class="thumbnail">
									<img src="projectImages/python2.PNG" width="70" height="50">
								</div>
								<div class="description">
									<strong>[조코딩]<br> 파이썬 무료기초강의 <br></strong>
								</div>
						</a></li>
						<li class="item"><a
							href="https://www.youtube.com/playlist?list=PLMsa_0kAjjrfYDhzNFLqB8XhSOI0UoIWf">
								<div class="thumbnail">
									<img src="projectImages/python3.PNG" width="70" height="50">
								</div>
								<div class="description">
									<strong>[나도코딩]<br> 파이썬 유용한 단편 강의 <br></strong>
								</div>
						</a></li>
						<li class="item"><a
							href="https://www.youtube.com/playlist?list=PLBXuLgInP-5kr0PclHz1ubNZgESmliuB7">
								<div class="thumbnail">
									<img src="projectImages/python4.PNG" width="70" height="50">
								</div>
								<div class="description">
									<strong>[윤인성]<br> 혼자 공부하는 파이썬<br></strong>
								</div>
						</a></li>
					</ul>
				</div>
			</aside>
		</div>
	</div>
</body>
<footer class="footer-distributed footer">

         <div class="footer-left">

            <h3>Y<span>ACADEMY</span></h3>

            <p class="footer-links">
               <a href="#">Home</a>
               ·
               <a href="#">Blog</a>
               ·
               <a href="#">Pricing</a>
               ·
               <a href="#">About</a>
               ·
               <a href="#">Faq</a>
               ·
               <a href="#">Contact</a>
            </p>

            <p class="footer-company-name">Acadmy hyeonju Jeong, Heesoo Kwon, Junho Park © 2021</p>

            <!-- <div class="footer-icons">

               <a href="#"><i class="fa fa-facebook"></i></a>
               <a href="#"><i class="fa fa-twitter"></i></a>
               <a href="#"><i class="fa fa-linkedin"></i></a>
               <a href="#"><i class="fa fa-github"></i></a>

            </div> -->

         </div>

         <div class="footer-right">

            <p>Contact Us</p>

            <form action="#" method="post">

               <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
  <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
</svg></a>
               <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-twitter" viewBox="0 0 16 16">
  <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"/>
</svg></i></a>
               <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
  <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
</svg></a>
               <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-linkedin" viewBox="0 0 16 16">
  <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
</svg></a>

            </form>

         </div>

      </footer>
</html>