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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/detailView.css" />
<style>
.gray_btn {
	width: 100px;
	height: 40px;
	border-radius: 10%;
	border: 0px;
	background-color: #ededed;
	color: black;
	font-weight: 700;
	float: right;
	margin: 5px;
}
</style>
<jsp:include page="header.jsp" />
</head>

<body>
	<div class="back"></div>
	<div class="col-lg-12 ">
		<div class="col-lg-2"></div>

		<div class="col-lg-8">

			<!-- 콘텐츠 시작 -->
			<div class="total_content">
				<div class="contentBox col-lg-12">
					<div class="container col-lg-3">
						<h2 id="site_header" class="site-font-color">수강과목</h2>
						<form name="input" action="getfeedback.html" method="get">
						<p>${user.subjectName }</p>
						<ul class="select">
                     <li id="menu_item"
                     onclick="location.href='syllabus.do?subjectName=<%=request.getParameter("subjectName")%>'">강의계획서</li>
                  		</ul>
						<ul class="select">
							<li id="menu_notice"
								onclick="location.href='viewProc.do?userId=<%=session.getAttribute("userId")%>&subjectName=${user.subjectName}'">공지사항</li>
						</ul>
						<ul class="select">
							<li id="menu_inforoom" onclick="location.href='dataViewProc.do?userId=<%=session.getAttribute("userId")%>&subjectName=${user.subjectName}'">자료실</li>
						</ul>
					</form>
					</div>


					<div class="size710 col-lg-9">
						<h3 class="title">자료실</h3>
						<hr class="hrStyle table700">
						<form method="post"
							action="<%=request.getContextPath()%>/dataUpdelProc.do">
							<input type="hidden" value="<%=session.getAttribute("userId")%>"
								name="userId"> <input type="hidden"
								value="${fvo.boardNo}" name="boardNo">
							<table class="table700">
								<tr>
									<td class="tablebgtable100">제목</td>
									<td class="tablebg2">${fvo.title }</td>
								</tr>
								<tr>
									<td class="tablebgtable100">작성자</td>
									<td class="tablebg2">${fvo.userId}</td>
								</tr>
								<tr>
									<td class="tablebgtable100">게시일</td>
									<td class="tablebg2">${fvo.regDate}</td>
								</tr>
							</table>
							<p class="hrStyle">
								${fvo.content}<br>
								<br>
								<br>
								<br>
								<br>
								<a href="<%=request.getContextPath()%>/downloadProc.do?fileName=${fvo.fileName}">${fvo.fileName }</a>
							</p>
							<c:if test="${fvo.userId == userId}" var="idTest">
								<input type="submit" name="threebtn" class="gray_btn" value="수정">
								<input type="submit" name="threebtn" class="gray_btn" value="삭제">
							</c:if>
						</form>
						<button class="gray_btn_down"
							onclick="location.href='<%=request.getContextPath()%>/dataViewProc.do?subjectName=${user.subjectName}'">목록</button>
						
						<form method="post"
							action="<%=request.getContextPath()%>/cWriteProc.do">
							<input type="hidden" value="<%=session.getAttribute("userId")%>"
								name="userId"> <input type="hidden"
								value="${nvo.boardNo}" name="boardNo">
							<div id="commentBtn" style="display: none">
								<c:forEach var="cvo" items="${cvoList}">
									<hr class="dottHr">
									<div>
										<b style="font-weight: bold;">${cvo.userId }</b><span>(${cvo.regDate})&nbsp;
											<button name="btn" value="${cvo.commentsNo }">삭제</button>
										</span><br>
										<br> <span>${cvo.content }</span>
									</div>
									<br>
									<hr class="dottHr">
								</c:forEach>
								<textarea class="orange_smallarea" placeholder="댓글을 입력하세요"
									name="comment"></textarea>
								<button name="btn" value="0" class="gray_btn_big">확인</button>
								<hr class="dottHr">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="col-lg-2"></div>
	<jsp:include page="footer.jsp" />

</body>

</html>