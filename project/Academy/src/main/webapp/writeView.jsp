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
							<th class="tableP">작성자</th>
							<th class="tableP">제목</th>
							<th class="tableP">등록일</th>
							<th class="tableP">조회수</th>
						</tr>
						<c:forEach var="nvo" items="${nvoList}">
						<tr class="tablebg2">
							<td class="tableP">${nvo.boardNo}</td>
							<td class="tableP">${nvo.userId}</td>
							<td class="tableP"><a href="<%=request.getContextPath()%>/detailViewProc.do?boardNo=${nvo.boardNo}">${nvo.title}</a></td>
							<td class="tableP">${nvo.regDate}</td>
							<td class="tableP">${nvo.hit}</td>
						</tr>
						</c:forEach>
					</table>

				</div>
			</div>
			<div class="col-lg-1">
				<button class="gray_btn" onclick="location.href='<%=request.getContextPath()%>/writeCheck.do?userId=<%=session.getAttribute("userId")%>'">글쓰기</button>
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

