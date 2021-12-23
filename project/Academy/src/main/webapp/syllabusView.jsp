<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/syllabusView.css">
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
							<li id="menu_item"
								onclick="location.href='syllabus.do?subjectName=<%=request.getParameter("subjectName")%>'">강의계획서</li>
						</ul>
						<ul class="select">
							<li id="menu_notice"
								onclick="location.href='viewProc.do?userId=<%=session.getAttribute("userId")%>&subjectName=${user.subjectName}'">공지사항</li>
						</ul>
						<ul class="select">
							<li id="menu_inforoom"
								onclick="location.href='dataViewProc.do?userId=<%=session.getAttribute("userId")%>&subjectName=${user.subjectName}'">자료실</li>
						</ul>
					</form>
				</div>
			</div>

			<div class="col-lg-7">
				<h3 class="title2">강의계획서</h3>
				<div class="subject_container">
					<table class="tablestyle">
						<tr class="tablebg">
							<th class="tableP">주차</th>
							<th class="tableP">요약</th>
							<th class="tableP">설명</th>
						</tr>

						<%-- ?userId=<%=session.getAttribute("userId")%>& subjectName=<%=request.getParameter("subjectName")%> --%>
						<c:forEach var="svo" items="${svoList}">
							<form method="post"
								action="<%=request.getContextPath()%>/syllabusUpdate.do?syllabusNo=${svo.syllabusNo}">
								<input type="hidden" name="subjectName"
									value="<%=request.getParameter("subjectName")%>">
								<tr>
									<td class="tableP">${svo.weekDay}<input type="hidden"
										name="weekDay" value="${svo.weekDay}"
										style="border: 0 solid black; background-color: transparent !important;"></td>
									<td class="tableP">${svo.title}<input type="hidden"
										name="title" value="${svo.title}"
										style="border: 0 solid black; background-color: transparent !important;"></td>
									<td class="tableP">${svo.content}<input type="hidden"
										name="content" value="${svo.content}"
										style="border: 0 solid black; background-color: transparent !important;"></td>
									<td><input type="submit" class="gray_btn"
										name="syllabusNo"
										<%-- value="${svo.syllabusNo }" --%> value="수정" /></td>
								</tr>
							</form>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>

