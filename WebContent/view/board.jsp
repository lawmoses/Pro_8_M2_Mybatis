<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%@ page import="board.BoardDBBean"%>
<%@ page import="board.BoardDataBean"%>
<%@ page import="java.util.List"%> 
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Yoon's</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="/Pro_8/view/style.css">

<!-- 삽입 -->
<script type="text/javascript" src="script/member.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 여기까지 -->



<!-- 게시판 추가 -->
<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	String boardid = request.getParameter("boardid");
	if (boardid == null) {
			boardid = "1";
		}
%>


<%
	int pageSize = 5;
	//한 페이지에 보여줄 글 개수
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String pageNum = request.getParameter("pageNum");
	//페이지 번호
	if (pageNum == null || pageNum == "") {
		pageNum = "1";
		}
	//처음에 들어올때는 1번이 뜸 (넘어오는 pageNum이 없기 때문에)
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1; 
	//db에서 가져올 데이터의 열(currentPage에 노출되는 가장 윗글)
	int endRow = currentPage * pageSize;
	//db에서 가져올 데이터의 마지막 열 (currentPage에 노출되는 가장 아래 글)
	int count = 0;
	int number = 0;
	List articleList = null;
	//글을 list로 받아줌
	BoardDBBean dbPro = BoardDBBean.getInstance();
	//DBBean내 생성된 객체 instance의 주소 값
	count = dbPro.getArticleCount(boardid);
	//총 게시글 개수
	if (count > 0) {
		articleList = dbPro.getArticles(startRow, endRow, boardid);
	}
	number = count - (currentPage - 1) * pageSize;
	//가져올 글 중 가장 최신글의 글 번호(current)
%>


	



<style>
.sr-only {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>

<script src="https://use.fontawesome.com/926fe18a63.js"></script>

<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script>
$(function(){
	$(".headC").click(function(){
		$(".headB").slideToggle();
	});
});
</script>
</head>
<body>

<header>
<div class="container">
	<div class="container-small">
		
		<%
		if (session.getAttribute("name")==null) {
		%>
		<a href="list-c.jsp" class="headA">Yoon's
		</a>
       <% } else { %>
       <%=session.getAttribute("name") %> :  <%=session.getAttribute("userid") %>
           
       <% } %> 	   
		<button type="button" class="headC">
			<span class="fa fa-bars" title="MENU"></span>
		</button>
	</div>

	<nav class="headB">
		<ul>
			<li><a href="list-c.jsp">TOP</a></li>
			<li><a onclick="document.getElementById('id01').style.display='block'" >로그인</a></li>
			<li><a href="/Pro_8/member/logoutPro.jsp">로그아웃</a></li>
			<li><a href="contents.jsp">콘텐츠</a></li>
			<li><a href="about.jsp">ABOUT</a></li>
			<li><a href="contact.jsp">문의</a></li>

<!-- 삽입 -->			
<!-- 로그인 창 -->
	<div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

        <div class="w3-center"><br>
            <span onclick="document.getElementById('id01').style.display='none'" 
            	class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
            <img src="img_avatar4.png" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top">
        </div>

        <form class="w3-container" action="/Pro_8/member/loginPro.jsp" method="post" name="frm">
            <div class="w3-section">
                <label><b>Username</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="text" 
                		placeholder="Enter Username" name="userid" value="${userid}" required>
                <label><b>Password</b></label>
                <input class="w3-input w3-border" type="password" placeholder="Enter Password" name="pwd" required>
                <button class="w3-button w3-block w3-green w3-section w3-padding" 
                		type="submit" onclick="return loginCheck()" >Login</button>
<!-- 수정-->      <button class="w3-button w3-block w3-green w3-section w3-padding" 
						type="submit" ><a href="/Pro_8/member/join.jsp">회원가입</a></button>
<!-- 수정-->		<button class="w3-button w3-block w3-green w3-section w3-padding" 
						type="submit" ><a href="/Pro_8/member/memberUpdate.jsp">회원정보수정</a></button>
                <input class="w3-check w3-margin-top" type="checkbox" checked="checked"> Remember me
            </div>
        </form>

        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
            <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
            <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span>
        </div>
    </div>
</div>
<!-- 로그인 창 -->
			
		</ul>
	</nav>
</div>
</header>

<section class="conA compact">
<div class="container">
		<h1>Yoon's</h1>
		<p>아이디어로 세상을 바꾸다</p>
</div>
</section>

 <!--  -->


<p class="w3-left" style="padding-left: 30px;"></p>
<div class="w3-container">
<span class="w3-center  w3-large">
<h3><%=boardid%>(전체 글:<%=count%>)</h3>
</span>
<p class="w3-right w3-padding-right-large">
	<a href="/Pro_8/oldview/writeForm.jsp">글쓰기</a>
</p>
<%
	if (count == 0) {
%>
<table class="table-bordered" width="700">
	<tr class="w3-grey">
		<td align="center">게시판에 저장된 글이 없습니다.</td>
</table>
<%
	} else {
%>
<table class="w3-table-all" width="700">
	<tr class="w3-grey">
		<td align="center" width="50">번호</td>
		<td align="center" width="250">제 목</td>
		<td align="center" width="100">작성자</td>
		<td align="center" width="150">작성일</td>
		<td align="center" width="50">조 회</td>
		<td align="center" width="100">IP</td>
	</tr>
<%
	for (int i = 0; i < articleList.size(); i++) {
		BoardDataBean article = (BoardDataBean) articleList.get(i); 
		//for문 돌면서 list안의 글 다 가져옴
%>
	<tr height="30">
		<td align="center" width="50"><%=number--%></td>
		<td width="250">
<%
	//답글 부분	*ref >같은 그룹 , re_level >답글 단 게시물에 +1, re_step >프린트 순서
	//ㄴ> 댓글모양 서식
	int wid = 0;
		if (article.getRe_level() > 0) {
			wid = 5 * (article.getRe_level());//re_level 0이면 0됨
%> 
			<img src="../images/level.gif" width="<%=wid%>" height="16"> 
			<img src="../images/re.gif"> 
<%
		} else {
%> 
			<img src="../images/level.gif" width="<%=wid%>" height="16"> 
<%
		}
%>
	<a href="/Pro_8/oldview/content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
	<%-- 글 제목 클릭 시 내용보기로 넘어감 --%>
		<%=article.getSubject()%></a> 
<%
		if (article.getReadcount() >= 20) {
		//조회수가 20보다 클 때 
%> 		
			<img src="../images/hot.gif" border="0" height="16">
<%
		}
%>
		</td>
		<td align="center" width="100"><%=article.getWriter()%></td>
		<!-- 글쓴이 출력 -->
		<td align="center" width="150"><%=sdf.format(article.getReg_date())%></td>
		<!-- 글쓴 날짜 출력 -->
		<td align="center" width="50"><%=article.getReadcount()%></td>
		<!-- 조회수 출력 -->
		<td align="center" width="100"><%=article.getIp()%></td>
		<!-- ip 출력 -->
	</tr>
<%
	}//for 반복문 종료. articleList size만큼 글 출력됨
%>
</table>
<%
}
%>

<!-- 게시글 목록 페이지 하단의 페이지 이동 부분 [1][2][3]  -->
<div class="w3-center">
<%
		int bottomLine = 3;
		//노출되는 하단 페이지 수 
		if (count > 0) {
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		//pageSize<한 페이지에 보여줄 글 개수
		//pageCount<총 페이지의 개수
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		//1,4,7.. 
		int endPage = startPage + bottomLine - 1;
		//3,6,9...
		if (endPage > pageCount)
			endPage = pageCount;
		//startPage로 계산된 endPage가 전체 페이지수 보다 크면 endPage=pageCount로 설정해줌
		if (startPage > bottomLine) {
		//[이전] <- 표시되는 시점
%>
		<a href="/Pro_8/oldview/list.jsp?pageNum=<%=startPage - bottomLine%>">[이전]</a>
		<!-- [이전] 누르면 4,5,6 이면 > 1,2,3 으로 이동함 -->
		<!-- 페이지 번호를 pageNum(String)으로 넘겨줌>CurrentPage에 들어감-->
<%
}
%>
<%
		for (int i = startPage; i <= endPage; i++) {
		// 하단 [1][2][3] 프린트
%>
			<a href="/Pro_8/oldview/list.jsp?pageNum=<%=i%>"> 
		<!-- pageNum넘김 -->
<% 		//현재 페이지일 경우 붉은색 폰트
		if (i != currentPage)
			out.print("[" + i + "]");
		else
			out.print("<font color='red'>[" + i + "]</font>");
%>
</a>
<%
		}
		if (endPage < pageCount) {
%>
		<a href="/Pro_8/oldview/list.jsp?pageNum=<%=startPage + bottomLine%>">[다음]</a>
<%
		}
	}
%>
</div>
</div>




<!--  -->



<footer>
<div class="container">

	<div class="footA">
		<h2>YOON'S</h2>
		<p>
		주소: <br>
		<a href="http://YOON'S.net/">http://YOON'S.net/</a>
		</p>

		<nav class="footD">
			<ul>
				<li><a href="#">
					<span class="fa fa-twitter"
					 title="Twitter"></span>
				</a></li>

				<li><a href="#">
					<span class="fa fa-facebook"
					 title="Facebook"></span>
				</a></li>

				<li><a href="#">
					<span class="fa fa-google-plus"
					 title="Google Plus"></span>
				</a></li>

				<li><a href="#">
					<span class="fa fa-instagram"
					 title="Instagram"></span>
				</a></li>

				<li><a href="#">
					<span class="fa fa-youtube"
					 title="YouTube"></span>
				</a></li>
			</ul>
		</nav>
	</div>

	<nav class="footB">
		<div>
			<h3>ABOUT</h3>
			<ul>
				<li><a href="#">설립</a></li>
				<li><a href="#">주소</a></li>
				<li><a href="#">지도</a></li>
				<li><a href="#">스태프</a></li>
			</ul>
		</div>

		<div>
			<h3>SUPPORT</h3>
			<ul>
				<li><a href="#">다운로드</a></li>
				<li><a href="#">매뉴얼</a></li>
				<li><a href="#">자주 묻는 질문</a></li>
				<li><a href="#">문의</a></li>
			</ul>
		</div>

		<div>
			<h3>CONTENTS</h3>
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">비즈니스</a></li>
				<li><a href="#">프로필</a></li>
				<li><a href="#">개발자</a></li>
				<li><a href="#">블로그</a></li>
			</ul>
		</div>
	</nav>

	<div class="footC">
		ⓒ YOON'S corp. All rights reserved.
	</div>

</div>
</footer>

</body>
</html>
