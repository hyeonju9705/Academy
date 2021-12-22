<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/syllabusWrite.css">
</head>
<%-- <%
if ((int) request.getAttribute("ok") == 0) {
%>
<script type="text/javascript">
        alert('학생은 글 작성 권한이 없습니다.');
        location.href='<%=request.getContextPath()%>
	/syllabus.do';
</script>
<%
}
%> --%>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="col-lg-12 bg-box">
		<div class="col-lg-2"></div>
		<div class="col-lg-8 bg-box3">
			<form name="input"
				action="<%=request.getContextPath()%>/syllabusWrite.do"
				method="post">
				<input type="hidden" name="subjectName"
					value="<c:out value='${subjectName }'/>"> <input
					type="hidden" name="syllabusNo"
					value="<c:out value='${svo.syllabusNo }'/>">
				<div class="col-lg-2 leftbarBox">
					<div class="container">
						<h2 id="site_header" class="site-font-color">수강과목</h2>
						<p>${user.subjectName }</p>
						<ul class="select">
							<li id="menu_item"
								onclick="location.href='syllabus.do?subjectName=<%=request.getParameter("subjectName")%>'">강의계획서</li>
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
					</div>
				</div>
				<div class="col-lg-7">
					<div class="subject_container">
						<table class="tablestyle">
							<tr class="tablebg">
								<th class="tableP">주차</th>
								<th class="tableP">요약</th>
								<th class="tableP">설명</th>
							</tr>

							<tr>
							<td class="tableP"><input type="text" name="weekDay"
									value="${svo.weekDay }"
									style="border: 0 solid black; background-color: transparent !important;"
									readonly /></td>
								<td class="tableP"><input type="text" name="title"
									value="${svo.title }"
									placeholder="수정할 제목을 입력해주세요." value="${title }" /></td>
								<td class="tableP"><input type="text" name="content"
									value="${svo.content }"
									placeholder="수정할 내용을 입력해주세요." value="${content }" /></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="col-lg-1">
					<input type="submit" class="gray_btn" value="수정" />
				</div>
			</form>
		</div>

		<div class="col-lg-4"></div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>