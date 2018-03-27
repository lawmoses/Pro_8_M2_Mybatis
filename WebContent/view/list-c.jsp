<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MAIN</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="/Pro_8/view/style.css">

<!-- 삽입 -->
<script type="text/javascript" src="script/member.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 여기까지 -->


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
		<a href="list-c.jsp" class="headA">YOON'S
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
			<li><a href="Index.jsp">게시판</a></li>
			<!-- <li><a target="http://gwmc12.onmam.com/">도움말</a></li> -->
			<li><a href="http://gwmc12.onmam.com/" onclick="window.open(this.href, '_blank'); return false;">도움말</a></li>

<!-- 삽입 -->			
<!-- 로그인 창 -->
	<div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

        <div class="w3-center"><br>
            <span onclick="document.getElementById('id01').style.display='none'" 
            	class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
            <img src="" alt="YOON'S" style="width:30%" class="w3-circle w3-margin-top">
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

 





<section class="listC">
<h1 class="sr-only">RECENT POSTS</h1>
<div class="container">
	<article>
	<a href="/Pro_8/productA.jsp">
		<div class="photo" style="background-image: url(/Pro_8/view/img/mis06.jpg);"></div>
		<div class="text">
			<h2>미슐랭의 맛과 멋 in홍대</h2>
			<p>와디즈 투자자들과 함께 이뤄낸 '종로'의 기적! 이제 '홍대'에서 이어갑니다!</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p02.jpg);"></div>
		<div class="text">
			<h2>야채 키우기 일기</h2>
			<p>최근 키우고 있는 야채들이 무럭무럭 자라고 있어요. 집에서도 야채 키우는 것을 아이디어로 작성해보겠습니다.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p03.jpg);"></div>
		<div class="text">
			<h2>딸기 맛있게 먹는 방법</h2>
			<p>가끔 딸기를 여러 곳에서 많이 받아 처리가 힘들었는데요, 이제 괜찮아요. 다양한 방법으로 맛있게 요리할 수 있습니다.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p04.jpg);"></div>
		<div class="text">
			<h2>악기 다루기</h2>
			<p>취미로 피아노와 기타 같은 악기를 다뤄보는 것이 어떨까요?</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p05.jpg);"></div>
		<div class="text">
			<h2>귀여운 문양</h2>
			<p>여러 곳에 숨은 귀여운 문양을 찾아보았습니다.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p06.jpg);"></div>
		<div class="text">
			<h2>설탕과 수분의 달콤한 관계</h2>
			<p>생명체에게 수분은 빼놓을 수 없는 요소입니다. 물론 달콤한 음식도...!</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p07.jpg);"></div>
		<div class="text">
			<h2>YOON'S 시작하기</h2>
			<p>창조적인 아이디어를 가진 사람들이 </p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p08.jpg);"></div>
		<div class="text">
			<h2>YOON'S 시작하기</h2>
			<p>여러분의 아이디어를 위한 설정, 데이터 관리, 애플리케이션과의 연동은 모두 맡겨주세요.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p09.jpg);"></div>
		<div class="text">
			<h2>해외에서 살아보기</h2>
			<p>한국에서의 일상이 지루해졌다면 해외로 나가서 잠시 살아보다 오는 것은 어떨까요?</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p10.jpg);"></div>
		<div class="text">
			<h2>공중에 몸을 맡기기</h2>
			<p>패러글라이딩을 해봤어요. 조금 무서웠지만 즐거웠습니다.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p11.jpg);"></div>
		<div class="text">
			<h2>샐러드 일기</h2>
			<p>세상에는 다양한 종류의 샐러드가 있습니다.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p12.jpg);"></div>
		<div class="text">
			<h2>오래된 친구에게 연락해보기</h2>
			<p>오래된 친구에게 연락해서 간단한 이야기를 나눠봐요.</p>
		</div>
	</a>
	</article>
</div>
</section>


<footer>
<div class="container">

	<div class="footA">
		<h2>YOON'S</h2>
		<p>
		주소: 서울시 관악구 신림동<br>
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
