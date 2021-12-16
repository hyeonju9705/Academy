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
</head>
<%
String userId = session.getId();
%>

<%
if ((int) request.getAttribute("ok") == 1) {
   session.setAttribute("userId", request.getParameter("userId"));
%>
<script type="text/javascript">
        alert('로그인성공');
    </script>
<%
} else if ((int) request.getAttribute("ok") == 2) {
%>
<script>alert('비밀번호 불일치');
   location.href='<%=request.getContextPath()%>/login.jsp';
   </script>
<%
} else {
%>
<script>alert('아이디 불일치');
      location.href='<%=request.getContextPath()%>
   /login.jsp';
</script>
<%
}
%>

<body>
   <jsp:include page="header.jsp"></jsp:include>
   <div class="total_content">
      <!-- 컨텐츠 왼쪽 -->
      <div class="content">
         <!-- 수강 과목 -->
         <div style="width: 600px;" class="first-box">
            <div class="subject">
               <div class="bar site-background-color"></div>
               <span>수강과목</span>
            </div>
            <ol>
               <li class="term_info">정규 수업</li>
               <li
                  style="padding-left: 10px; background: url('projectImages/ul_dot.png') no-repeat 0 49%">
                  <a
                  href="subject_main.jsp?userId=<%=session.getAttribute("userId")%>">C언어
                     (1017-01) <span>목(6~8)</span>
               </a>
               </li>
               <li
                  style="padding-left: 10px; background: url('projectImages/ul_dot.png') no-repeat 0 49%">
                  바이오산업세미나 (1008-01) <span>화(2~4)</span>
               </li>
               <li
                  style="padding-left: 10px; background: url('projectImages/ul_dot.png') no-repeat 0 49%">
                  일반조류학 및 실습 (1010-01) <span>화(6~8)</span>
               </li>
               <li
                  style="padding-left: 10px; background: url('projectImages/ul_dot.png') no-repeat 0 49%">
                  취업정보분석과 입사전략 (756-01) <span>목(6~8)</span>
               </li>
               <li style="border-bottom: 1px dotted #E6E6E6;"></li>
            </ol>
         </div>

         <!-- 공지사항 -->
         <div style="width: 600px;" class="first-box">
            <div class="subject">
               <div class="bar site-background-color"></div>
               <span>공지사항</span>
               <div class="whole" style="float: right; margin-top: 8px;">
                  <img src="projectImages/btn_all.gif" alt="공지사항">
               </div>
            </div>
            <ol>
            <c:forEach var="item" items="${adao }">
                  <li
                     style="padding-left: 10px; background: url('projectImages/ul_dot.png') no-repeat 0 49%">
                     ${item.title} <span>${item.regDate }</span>
                  </li>
               </c:forEach>
            </ol>
         </div>
      </div>

      <div class="right_aside">
         <!-- 콘텐트 오른쪽 -->
         <fieldset class="icon-box">
            <div class="title-01">
               <span class="site-font-color">Quick Menu</span>
               <div class="icon-subject"></div>
            </div>


            <div class="icon-subject">
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
               <img src="projectImages/faq.png">
               <div class="iconn-my">FAQ</div>
            </div>


         </fieldset>

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
   <jsp:include page="footer.jsp"></jsp:include>
</body>


</html>