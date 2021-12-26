# Academy
컴퓨터학원 eclass 제작
 
 project 폴더가 최근폴더
 mainform.jsp의 <script>부분의 refer header 부분 url의 서버포트를 로컬에 맞게 다시 설정해야 로그인 시, alert창이 열림, 또한 Path를 /Academy 로 지정
 url : Academy/login.jsp 가 처음 시작 페이지
<br><br>
개발환경, 언어 및 툴 : Java SE 11, jdk 11,tomcat 9.0, My SQL, MySQL Workbench, javaScript

# 프로젝트 계기
Jsp와 servlet을 이해하고 spring으로 넘어가기 위해서 협업하며 프로젝트를 하려고 함
지인 중 학원 웹사이트를 제작하고싶다는 의견이 있어 학원 웹사이트에 대해 궁금하여 제작해봄

# 기간 / 인원 수
2021.12.21-23 (약 40시간) / 3명

# 배운점
1. 회원가입 , 로그인 부분에서 session이 생성안되는 오류가 있어서 이 부분을 잡느라 헤맴<br> -> if문 안으로 못들어오는 오류.. 일일히 찍어보며 디버깅하는 방법을 배움
2. request.getParameter()과 request.getAttribute()의 차이점에 대해 알게됨
3. 또한 el태그의 사용방법이나 jstl core에 대해 자세히 알게됨. 예를들어 c:choose 문으로 수정, 삭제 버튼이 sessionId와 일치하는지 확인하는것
4. controller에서 actiondo로 이동할 때에 데이터이동에 대해서 확실하게 알게됨 -> do에서 do로 이동할 때에 데이터 처리방식에대해 고민할 계기가 됨
5. actionDo 및 UTF-8의 남용시 ??? 출력 에 대해 알게되었음( request.setCharacterEncoding("utf-8");과 <br>또 깨질시에 response.setContentType("text/html; charset=utf-8")을 사용해야하는것을 알게됨
6. db설계가 굉장히 중요하다는 것을 알게됨. 처음에 만든 테이블을 드롭하고 계속 새롭게 만들면서 느낌... ex) 과목별로 유저가 게시글을 보고싶다면 과목을 외래키로 지정햇어야함..
