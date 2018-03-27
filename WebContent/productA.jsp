<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 금액팝업 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.city {display:none}
</style>


<!--  -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="/Pro_8/view/style.css">

<!-- 삽입 -->
<script type="text/javascript" src="script/member.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 여기까지 -->
<!--  -->
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/style.css">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<title>Hello, world!</title>
</head>
<body>
<!--   -->

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
			<li><a href="view/list-c.jsp">TOP</a></li>
			<!-- <li><a onclick="document.getElementById('id01').style.display='block'" >로그인</a></li> -->
			<li><a href="member/logoutPro.jsp">로그아웃</a></li>
			<li><a href="view/contents.jsp">콘텐츠</a></li>
			<li><a href="view/board.jsp">게시판</a></li>
			<!-- <li><a target="http://gwmc12.onmam.com/">도움말</a></li> -->
			<li><a href="http://gwmc12.onmam.com/" onclick="window.open(this.href, '_blank'); return false;">도움말</a></li>

<!-- 삽입 -->			
<!-- 로그인 창 -->
	<%-- <div id="id01" class="w3-modal">
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
</div> --%>
<!-- 로그인 창 -->
			
		</ul>
	</nav>
</div>
</header>

<!--  -->
	<!-- 헤더 -->
	<div class="header">
		<!-- <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<a class="navbar-brand" href="#" >LOGO</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle Navigation">
				<span class="navbar-toggler-icon"></span>
			</button>	
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active">
						<a class="nav-link" href="#">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Features</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Freebies</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Log In</a>
					</li>
				</ul>
			</div>	
		</nav> -->
		
		
		<div class="container align-center">
			<h1><strong>Do you want to fund?</strong><br>in a web browser</h1>
			<h4 class="silver hidden-xs">Your funding changes the world!</h4>			
			<!-- <div class="btn btn-primary btn-lg">funding</div> -->
			
			<div class="silver small-info margin-top-big d-none d-md-block"></div> 
			
			<!-- cw -->
			<button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-blue">Funding now</button>

<div id="id01" class="w3-modal">
 <div class="w3-modal-content w3-card-4 w3-animate-zoom">
  <div class="w3-container w3-blue"> 
   <span onclick="document.getElementById('id01').style.display='none'" 
   class="w3-button w3-blue w3-xlarge w3-display-topright">&times;</span>
   <h2>Header</h2>
  </div>

  <div class="w3-bar w3-border-bottom">
   <button class="tablink w3-bar-item w3-button" onclick="openCity(event, 'London')">100$</button>
   <button class="tablink w3-bar-item w3-button" onclick="openCity(event, 'Paris')">200$</button>
   <button class="tablink w3-bar-item w3-button" onclick="openCity(event, 'Tokyo')">300$</button>
  </div>

  <div id="London" class="w3-container city">
   <h1>London</h1>
   <p>London is the most populous city in the United Kingdom, with a metropolitan area of over 9 million inhabitants.</p>
   <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
  </div>

  <div id="Paris" class="w3-container city">
   <h1>Paris</h1>
   <p>Paris is the capital of France.</p>
   <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
  </div>

  <div id="Tokyo" class="w3-container city">
   <h1>Tokyo</h1>
   <p>Tokyo is the capital of Japan.</p><br>
  </div>

  <div class="w3-container w3-light-grey w3-padding">
   <button class="w3-button w3-right w3-white w3-border" 
   onclick="document.getElementById('id01').style.display='none'">Close</button>
  </div>

 </div>
  
</div>
</div>   
		
		
			
			      
			<!-- <img src="images/drop-icon.png">
			Drop here or select your project<br>prepared in the PNG or JPG format -->
		</div>
		
		
	</div>
	
</div>


				 <script>
document.getElementsByClassName("tablink")[0].click();

function openCity(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].classList.remove("w3-light-grey");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.classList.add("w3-light-grey");
}
</script>


<!-- 첫 번째 섹션 -->
<div class="box-padding-big grey-bg">
	<div class="container">
		<div class="row">
			<div class="col-md-5 info-big">
				<h2>Fastest way to<br><strong>present your design</strong></h2>
				<p>Symu is an easy to use tool for web designers. With the help of our system you can present your projects in a browser for free. It is all very easy!</p>
				<p><strong>Drop your project anywhere</strong><br>Symu will prepare a mockup of your website for you!</p>
			</div>
			<div class="col-md-7">
				<img src="images/mis01.jpg">
			</div>
		</div>
	</div>
</div>

<!-- 두 번째 섹션. 흰 배경 -->
<div class="box-padding-big white-bg">
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<img src="images/mis02.jpg">
			</div>
			<div class="col-md-5 info-big">
				<h2>The simplest way to<br><strong>get feedback from your clients!</strong></h2>
				<p><strong>You can add a comment anywhere</strong> on a project, this is a fast and easy way to gather input and proposed changes from your client. Click anywhere on a project and leave your thoughts.</p>
				<p><strong>Every added comment becomes a task! </strong> Thanks to this solution you can easily mark the changes you have made.</p>				
			</div>
		</div>
	</div>
</div>

<!-- 세 번째 섹션. 모바일 이하 크기에서는 감춤  -->
<div class="box-padding-big grey-bg">
	<div class="container">
		<div class="row">
			<div class="col-md-5 info-big">
				<h2>Support for<br><strong>Responsive projects</strong></h2>
				<p>Projects added to Symu are automatically checked whether they are mobile ready.</p>
				<p>The program will divide your files into responsive versions on its own! You have the option to view the projects in either normal or responsive modes!</p>
			</div>
			<div class="col-md-7">
				<img src="images/mis06.jpg">
			</div>
		</div>
	</div>	
</div>

<!-- 네 번째 섹션. 흰색 배경. 모바일 이하 크기에서 감춤  -->
<!-- <div class="d-none d-md-block box-padding-big white-bg">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<img src="images/envelope-icon.jpg" style="float:left">  
				<h2 class="icon-title">Email<br><strong>notifications</strong></h2>
				<p>An email notification will be sent when your client comments or opens a project. You will know when a client recieves the projects and if he has seen it!</p>
			</div>
			<div class="col-md-6">
				<img src="images/lock-icon.jpg" style="float:left">　　
				<h2 class="icon-title">Project<br><strong>protection</strong></h2>
				<p>Your projects will be perfectly safe, Symu uses SSL encryption and every project added receives a unique link. Additionally you have the option to secure your project with a password.</p>
			</div>
		</div>
	</div>
</div> -->

<!-- 다섯 번째 섹션. 짙은 배경. 모바일 이하 크기에서는 감춤 -->
<!-- <div class="d-none d-md-block box-padding-big dark-bg-stat">
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<div class="info-box align-center">
					<h3>253</h3>
					Todays uploads
				</div>
			</div>
			<div class="col-md-2">
				<div class="info-box align-center">
					<h3>171092</h3>
					Projects uploaded
				</div>
			</div>
			<div class="col-md-4 align-center">
				<a href="#registerModal" role="button" data-toggle="modal" class="btn btn-danger btn-lg">Sign Up <strong>now</strong></a>
			</div>
			<div class="col-md-2">
				<div class="info-box align-center">
					<h3>931523</h3>
					Project views
				</div>
			</div>
			<div class="col-md-2">
				<div class="info-box align-center">
					<h3>100867</h3>
					Comments posted
				</div>
			</div>					
		</div>
	</div>
</div> -->

<!-- 푸터 -->
<!-- <footer class="footer">
	The site owner is not responsible for uploaded images. You can only upload images for which you own the copyright.
</footer> -->




<!--  -->

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


<!--  -->

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>