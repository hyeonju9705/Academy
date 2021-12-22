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
					<h2 id="site_header" class="site-font-color">ACADEMY</h2>
					<form name="input" action="getfeedback.html" method="get">
	
						<img src="projectImages/vvv.png" alt="Y아카데미" width="100px" class="logo">
						<ul class="select">
							<li id="menu_notice"></li>
						</ul>
						<ul class="select">
							<li id="menu_qna"></li>
						</ul>
						<ul class="select">
							<li id="menu_inforoom"></li>
						</ul>
						<ul class="select">
							<li id="menu_report"></li>
						</ul>
					</form>
				</div>
			</div>
			<div class="col-lg-7">
				<h3 class="title">ACADEMY 공지사항</h3>
				<div class="subject_container">
					<table class="tablestyle">
						<tr class="tablebg">
							<th class="tableP">번호</th>
							<th class="tableP">작성자</th>
							<th class="tableP">제목</th>
							<th class="tableP">등록일</th>
							<th class="tableP">조회수</th>
						</tr>
						<c:forEach var="avo" items="${avoList}">
						<tr class="tablebg2">
							<td class="tableP">${avo.boardNo}</td>
							<td class="tableP">${avo.userId}</td>
							<td class="tableP"><a href="<%=request.getContextPath()%>/AdetailViewProc.do?boardNo=${avo.boardNo}">${avo.title}</a></td>
							<td class="tableP">${avo.regDate}</td>
							<td class="tableP">${avo.hit}</td>
						</tr>
						</c:forEach>
					</table>

				</div>
			</div>
			<div class="col-lg-1">
				<button class="gray_btn" onclick="location.href='<%=request.getContextPath()%>/AwriteCheck.do?userId=<%=session.getAttribute("userId")%>'">글쓰기</button>
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

</html>