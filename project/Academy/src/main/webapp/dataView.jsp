<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/writeView.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="header.jsp" />
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
							<li id="menu_notice">공지사항</li>
						</ul>
						<ul class="select">
							<li id="menu_qna">질의응답</li>
						</ul>
						<ul class="select">
							<li id="menu_inforoom">자료실</li>
						</ul>
						<ul class="select">
							<li id="menu_report">과제</li>
						</ul>
					</form>
				</div>
			</div>
			<div class="col-lg-7">
				<div class="subject_container">
					<table class="tablestyle">
						<tr class="tablebg">
							<th class="tableP">번호</th>
							<th class="tableP">제목</th>
							<th class="tableP">첨부</th>
							<th class="tableP">등록일</th>
						</tr>
						<c:forEach var="fvo" items="${fvoList}">
						<tr class="tablebg2">
							<td class="tableP">${fvo.boardNo}</td>
							<td class="tableP"><a href="<%=request.getContextPath()%>/dataDetailViewProc.do?boardNo=${fvo.boardNo}">${fvo.title}</a></td>
							<td class="tableP"><a href="<%=request.getContextPath()%>/downloadProc.do?fileName=${fvo.fileName}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-archive-fill" viewBox="0 0 16 16">
  <path d="M12.643 15C13.979 15 15 13.845 15 12.5V5H1v7.5C1 13.845 2.021 15 3.357 15h9.286zM5.5 7h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1zM.8 1a.8.8 0 0 0-.8.8V3a.8.8 0 0 0 .8.8h14.4A.8.8 0 0 0 16 3V1.8a.8.8 0 0 0-.8-.8H.8z"/>
</svg></a></td>
							<td class="tableP">${fvo.regDate}</td>
						</tr>
						</c:forEach>
					</table>

				</div>
			</div>
			<div class="col-lg-1">
				<button class="gray_btn" onclick="location.href='<%=request.getContextPath()%>/dataWriteCheck.do?userId=<%=session.getAttribute("userId")%>'">글쓰기</button>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
</body>
<footer>
	<jsp:include page="footer.jsp" />
</footer>

<script>
function write(){
	
}
</script>
</html>

