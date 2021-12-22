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
</head>

<body>
			<jsp:include page="header.jsp" />
	<div class="back"></div>
	<div class="col-lg-12 ">
		<div class="col-lg-2"></div>

		<div class="col-lg-8">

			<!-- 콘텐츠 시작 -->
			<div class="total_content">
				<div class="contentBox col-lg-12">
					<div class="container col-lg-3">
						<h2 id="site_header" class="site-font-color">ACADEMY</h2>
						<form name="input" action="getfeedback.html" method="get">
						<img src="projectImages/vvv.png" alt="Y아카데미" width="100px" class="logo">					
					</form>
					</div>


					<div class="size710 col-lg-9">
						<h3 class="title">ACADEMY 공지사항</h3>
							<hr class="hrStyle table700">
								<form method="post"
						action="<%=request.getContextPath()%>/AupdelProc.do">
						<input type="hidden" value="<%=session.getAttribute("userId")%>" name="userId"> 
						<input type="hidden" value="${avo.boardNo}" name="boardNo">
							<table class="table700">
								<tr>
									<td class="tablebgtable100">제목
									</td>
									<td class="tablebg2">${avo.title }
									</td>
								</tr>
								<tr>
									<td class="tablebgtable100">작성자</td>
									<td class="tablebg2">${avo.userId}</td>
								</tr>
								<tr>
									<td class="tablebgtable100">게시일</td>
									<td class="tablebg2">${avo.regDate}</td>
								</tr>
							</table>
							<p class="hrStyle">
								${avo.content}<br><br><br><br>
							</p>
							<c:if test="${avo.userId == userId}" var="idTest">
							<input type="submit" name="threebtn" class="gray_btn"
								value="수정">
							<input type="submit" name="threebtn" class="gray_btn"
								value="삭제">
							</c:if>
							</form>
							<button class="gray_btn_down" onclick="location.href='<%=request.getContextPath()%>/AviewProc.do'">목록</button>

					</div>
				</div>
			</div>
		</div>
		
	</div>
	<div class="col-lg-2"></div>
	<jsp:include page="footer.jsp" />
	
</body>

</html>