<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<jsp:include page="header.jsp" />
<link rel="stylesheet" href="css/subject_main.css">
</head>
<body>
	<div class="col-lg-12 bg-box">
		<div class="col-lg-2"></div>
		<div class="col-lg-8 bg-box3">
			<div class="col-lg-2 leftbarBox">
				<div class="container">
					<h2 id="site_header" class="site-font-color">수강과목</h2>
					<form name="input" action="getfeedback.html" method="get">
						<p>${user.subjectName }</p>
						<ul class="select">
							<li id="menu_item">강의계획서</li>
						</ul>
						<ul class="select">
							<li id="menu_notice"
								onclick="location.href='viewProc.do?userId=<%=session.getAttribute("userId")%>'">공지사항</li>
						</ul>
						<ul class="select">
							<li id="menu_qna">질의응답</li>
						</ul>
						<ul class="select">
							<li id="menu_inforoom" onclick="location.href='dataViewProc.do?userId=<%=session.getAttribute("userId")%>'">자료실</li>
						</ul>
						<ul class="select">
							<li id="menu_report" onclick="location.href='hwViewProc.do?userId=<%=session.getAttribute("userId")%>'">과제</li>
						</ul>
					</form>
				</div>
			</div>
			<div class="col-lg-7 nameBigbox">
				<div class="subject_namebox">모두의 스타트업 코딩</div>
				<div class="subject_namebox">
					<div class="">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							fill="currentColor" class="bi bi-megaphone-fill"
							viewbox="0 0 16 16">
                                <path
								d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-11zm-1 .724c-2.067.95-4.539 1.481-7 1.656v6.237a25.222 25.222 0 0 1 1.088.085c2.053.204 4.038.668 5.912 1.56V3.224zm-8 7.841V4.934c-.68.027-1.399.043-2.008.053A2.02 2.02 0 0 0 0 7v2c0 1.106.896 1.996 1.994 2.009a68.14 68.14 0 0 1 .496.008 64 64 0 0 1 1.51.048zm1.39 1.081c.285.021.569.047.85.078l.253 1.69a1 1 0 0 1-.983 1.187h-.548a1 1 0 0 1-.916-.599l-1.314-2.48a65.81 65.81 0 0 1 1.692.064c.327.017.65.037.966.06z" />
                            </svg>
						&nbsp; 공지사항
					</div>
					<ul>
						<c:forEach var="item" items="${test }">
							<c:choose>
								<c:when test="${item.subjectName eq  'C'}">
									<li class="notice_li">${item.title }</li>
								</c:when>
								<c:when test="${item.subjectName eq 'JAVA' }">
									<li class="notice_li">${item.title }</li>
								</c:when>
								<c:when test="${item.subjectName eq 'Python' }">
									<li class="notice_li">${item.title }</li>
								</c:when>
								<c:otherwise>
									<li class="notice_li">오류 발생!!</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<p class="moreview">
							<a href="#">더보기 >></a>
						</p>
					</ul>

				</div>
			</div>
			<div class="col-lg-3 bg-box4">

				<aside id="main_aside">

					<input id="first" type="radio" name="tab" checked="checked" /> <input
						id="second" type="radio" name="tab" />
					<section class="buttons">
						<label for="first">JAVA</label> <label for="second">C</label> <label
							for="third">Python</label>
					</section>

					<div class="tab_item">
						<ul>
							<li class="item"><a
								href="https://www.youtube.com/watch?v=jdTsJzXmgU0&list=PLuHgQVnccGMCeAy-2-llhw3nWoQKUvQck">
									<div class="thumbnail">
										<img src="projectImages/java1.PNG" class="tab_image_size">
									</div>
									<div class="description">
										<strong>[생활코딩]<br>Java 입문 수업
										</strong>
									</div>
							</a></li>
							<li class="item"><a
								href="https://www.youtube.com/watch?v=oJlCC1DutbA&list=PLW2UjW795-f6xWA2_MUhEVgPauhGl3xIp">
									<div class="thumbnail">
										<img src="projectImages/java2.PNG" class="tab_image_size">
									</div>
									<div class="description">
										<strong>[남궁성의 정석코딩]<br>자바의 정석 기초편
										</strong>
									</div>
							</a></li>
							<li class="item"><a
								href="https://www.youtube.com/playlist?list=PLpkj8RKr48wYXFtzJdXUo46tmxnj94mjB">
									<div class="thumbnail">
										<img src="projectImages/java3.PNG" class="tab_image_size">
									</div>
									<div class="description">
										<strong>[인프런]<br>실전 자바 강좌
										</strong>
									</div>
							</a></li>
							<li class="item"><a
								href="https://www.youtube.com/watch?v=nGiSIToTwdQ&list=PLyebPLlVYXCgb5B-toSOvivS1RChZLnNu">
									<div class="thumbnail">
										<img src="projectImages/java4.PNG" class="tab_image_size">
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
										<img src="projectImages/c1.PNG " class="tab_image_size">
									</div>
									<div class="description">
										<strong>[동빈나]<br>c언어 기초 프로그래밍 강좌
										</strong>
									</div>
							</a></li>
							<li class="item"><a
								href="https://www.youtube.com/playlist?list=PLMsa_0kAjjrdiwQykI8eb3H4IRxLTqCnP">
									<div class="thumbnail">
										<img src="projectImages/c2.PNG" class="tab_image_size">
									</div>
									<div class="description">
										<strong>[나도코딩] <br>C언어 초보강의
										</strong>
									</div>
							</a></li>
							<li class="item"><a
								href="https://www.youtube.com/playlist?list=PLlJhQXcLQBJqywc5dweQ75GBRubzPxhAk">
									<div class="thumbnail">
										<img src="projectImages/c3.PNG" class="tab_image_size">
									</div>
									<div class="description">
										<strong>[두들낙서] <br>두들낙서의 C/C++ 강좌
										</strong>
									</div>
							</a></li>
							<li class="item"><a
								href="https://www.youtube.com/playlist?list=PL4SIC1d_ab-b4zy_3FDRIiohszShOZ0PK">
									<div class="thumbnail">
										<img src="projectImages/c4.PNG" class="tab_image_size">
									</div>
									<div class="description">
										<strong>[어소트락 게임아카데미]<br>C언어 무료강의
										</strong>
									</div>
							</a></li>
						</ul>
					</div>
				</aside>
			</div>
		</div>

		<div class="col-lg-4"></div>

	</div>
</body>
<footer>
	<jsp:include page="footer.jsp" />
</footer>
</html>