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
.cal-box{
border : 2px pink;
border-style: dashed;
padding: 30px;
}
</style>
</head>
<script type="text/javascript">
<%String userId = session.getId();
if (request.getHeader("referer").equals("http://localhost:9000/Academy/login.jsp")) {
   int ok = (Integer) request.getAttribute("ok");
   if (ok == 1) { //아이디 비번 일치, 회원이면서 비번 일치
      session.setAttribute("user", request.getAttribute("user"));
      session.setAttribute("userId", request.getParameter("userId"));%>
       alert('환영합니다. 아카데미 홈페이지에 방문해주셔서 감사합니다.');
    //   
 
<%
    } else if (ok == 2) {%> //회원이면서 비번 불일치
alert('비밀번호가 틀렸습니다. 확인 후 로그인 바랍니다.');

    location.href='<%=request.getContextPath()%>/login.jsp'; 
<%
} else {
%>
      alert('아이디가 틀렸습니다. 확인 후 로그인 바랍니다.'); //비회원임
       location.href='<%=request.getContextPath()%>/login.jsp';
<%}
}%>   
</script>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%-- OKOKOK : <c:out value="${ok}"/>
	<c:if/>+ --%>
	<div class="total_content">
		<!-- 컨텐츠 왼쪽 -->
		<div class="content">
		
		<div class="cal-box">
			<jsp:include page="calendar.jsp"/>
		</div>
			<!-- 전체 공지사항 -->
			<div style="width: 600px;" class="first-box">
				<div class="subject">
					<div class="bar site-background-color"></div>
					<span>ACADEMY 공지사항</span>
					<div class="whole" style="float: right; margin-top: 8px;">
						<div>
							<a href='AviewProc.do?userId=${userId}'>
								<img src="projectImages/btn_all.gif" alt="공지사항">
							</a>
						</div>
					</div>
				</div>
				<ol>
					<c:forEach var="Aitem" items="${Aadao }">
						<li
							style="padding-left: 10px; background: url('projectImages/ul_dot.png') no-repeat 0 49%">
							<a href='AdetailViewProc.do?boardNo=${Aitem.boardNo }'>[전체] ${Aitem.title} </a> 
						</li>
					</c:forEach>
					<li style="border-bottom: 1px dotted #E6E6E6;"></li>
				</ol>
			</div>

			<!-- 수강 과목 -->
			<div style="width: 600px;" class="first-box">
				<div class="subject">
					<div class="bar site-background-color"></div>
					<span>수강과목</span>
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
					<span>과목 공지사항</span>
					<div class="whole" style="float: right; margin-top: 8px;">
						<%-- <a href='viewProc.do?userId=<%=request.getParameter("userId")%>'> --%>
						<a href='viewProc.do?userId=${userId}'>
							<img src="projectImages/btn_all.gif" alt="공지사항">
						</a>
					</div>
				</div>
				<ol>
					<c:forEach var="item" items="${adao }">
						<li
							style="padding-left: 10px; background: url('projectImages/ul_dot.png') no-repeat 0 49%">
							[${item.subjectName }] ${item.title}			
						</li>
					</c:forEach>
				</ol>
			</div>
<jsp:include page="footer.jsp"></jsp:include>
		</div>


		<div class="right_aside">
			<!-- 콘텐트 오른쪽 -->
			<fieldset class="icon-box">
				<div class="title-01" style="margin-left: 19%;">
					<span class="site-font-color" style="color: #ff3385">Quick
						Menu</span>
					<div class="icon-subject"></div>
				</div>


				<div class="icon-subject" style="margin-left: 8%;">
					<img src="projectImages/subject.png">
					<div class="icon-sub">수강과목</div>
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

			<!-- 콘텐트 오른쪽 아래 -->
			<aside id="main_aside">
				<input id="first" type="radio" name="tab" checked="checked" /> <input
					id="second" type="radio" name="tab" /> <input id="third"
					type="radio" name="tab" />
				<section class="buttons">
					<label for="first" style="background: pink;">JAVA</label> <label
						for="second" style="background: pink;">C</label> <label
						for="third" style="background: pink;">Python</label>
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


</html>