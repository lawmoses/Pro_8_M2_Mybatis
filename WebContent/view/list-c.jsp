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

<!-- ���� -->
<script type="text/javascript" src="script/member.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- ������� -->


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
			<li><a onclick="document.getElementById('id01').style.display='block'" >�α���</a></li>
			<li><a href="/Pro_8/member/logoutPro.jsp">�α׾ƿ�</a></li>
			<li><a href="contents.jsp">������</a></li>
			<li><a href="Index.jsp">�Խ���</a></li>
			<!-- <li><a target="http://gwmc12.onmam.com/">����</a></li> -->
			<li><a href="http://gwmc12.onmam.com/" onclick="window.open(this.href, '_blank'); return false;">����</a></li>

<!-- ���� -->			
<!-- �α��� â -->
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
<!-- ����-->      <button class="w3-button w3-block w3-green w3-section w3-padding" 
						type="submit" ><a href="/Pro_8/member/join.jsp">ȸ������</a></button>
<!-- ����-->		<button class="w3-button w3-block w3-green w3-section w3-padding" 
						type="submit" ><a href="/Pro_8/member/memberUpdate.jsp">ȸ����������</a></button>
                <input class="w3-check w3-margin-top" type="checkbox" checked="checked"> Remember me
            </div>
        </form>

        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
            <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
            <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span>
        </div>
    </div>
</div>
<!-- �α��� â -->
			
		</ul>
	</nav>
</div>
</header>

<section class="conA compact">
<div class="container">
		<h1>Yoon's</h1>
		<p>���̵��� ������ �ٲٴ�</p>
</div>
</section>

 





<section class="listC">
<h1 class="sr-only">RECENT POSTS</h1>
<div class="container">
	<article>
	<a href="/Pro_8/productA.jsp">
		<div class="photo" style="background-image: url(/Pro_8/view/img/mis06.jpg);"></div>
		<div class="text">
			<h2>�̽����� ���� �� inȫ��</h2>
			<p>�͵��� �����ڵ�� �Բ� �̷ﳽ '����'�� ����! ���� 'ȫ��'���� �̾�ϴ�!</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p02.jpg);"></div>
		<div class="text">
			<h2>��ä Ű��� �ϱ�</h2>
			<p>�ֱ� Ű��� �ִ� ��ä���� �������� �ڶ�� �־��. �������� ��ä Ű��� ���� ���̵��� �ۼ��غ��ڽ��ϴ�.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p03.jpg);"></div>
		<div class="text">
			<h2>���� ���ְ� �Դ� ���</h2>
			<p>���� ���⸦ ���� ������ ���� �޾� ó���� ������µ���, ���� �����ƿ�. �پ��� ������� ���ְ� �丮�� �� �ֽ��ϴ�.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p04.jpg);"></div>
		<div class="text">
			<h2>�Ǳ� �ٷ��</h2>
			<p>��̷� �ǾƳ�� ��Ÿ ���� �Ǳ⸦ �ٷﺸ�� ���� ����?</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p05.jpg);"></div>
		<div class="text">
			<h2>�Ϳ��� ����</h2>
			<p>���� ���� ���� �Ϳ��� ������ ã�ƺ��ҽ��ϴ�.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p06.jpg);"></div>
		<div class="text">
			<h2>������ ������ ������ ����</h2>
			<p>����ü���� ������ ������ �� ���� ����Դϴ�. ���� ������ ���ĵ�...!</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p07.jpg);"></div>
		<div class="text">
			<h2>YOON'S �����ϱ�</h2>
			<p>â������ ���̵� ���� ������� </p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p08.jpg);"></div>
		<div class="text">
			<h2>YOON'S �����ϱ�</h2>
			<p>�������� ���̵� ���� ����, ������ ����, ���ø����̼ǰ��� ������ ��� �ð��ּ���.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p09.jpg);"></div>
		<div class="text">
			<h2>�ؿܿ��� ��ƺ���</h2>
			<p>�ѱ������� �ϻ��� ���������ٸ� �ؿܷ� ������ ��� ��ƺ��� ���� ���� ����?</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p10.jpg);"></div>
		<div class="text">
			<h2>���߿� ���� �ñ��</h2>
			<p>�з��۶��̵��� �غþ��. ���� ���������� ��ſ����ϴ�.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p11.jpg);"></div>
		<div class="text">
			<h2>������ �ϱ�</h2>
			<p>���󿡴� �پ��� ������ �����尡 �ֽ��ϴ�.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(/Pro_8/view/img/p12.jpg);"></div>
		<div class="text">
			<h2>������ ģ������ �����غ���</h2>
			<p>������ ģ������ �����ؼ� ������ �̾߱⸦ ��������.</p>
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
		�ּ�: ����� ���Ǳ� �Ÿ���<br>
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
				<li><a href="#">����</a></li>
				<li><a href="#">�ּ�</a></li>
				<li><a href="#">����</a></li>
				<li><a href="#">������</a></li>
			</ul>
		</div>

		<div>
			<h3>SUPPORT</h3>
			<ul>
				<li><a href="#">�ٿ�ε�</a></li>
				<li><a href="#">�Ŵ���</a></li>
				<li><a href="#">���� ���� ����</a></li>
				<li><a href="#">����</a></li>
			</ul>
		</div>

		<div>
			<h3>CONTENTS</h3>
			<ul>
				<li><a href="#">��������</a></li>
				<li><a href="#">����Ͻ�</a></li>
				<li><a href="#">������</a></li>
				<li><a href="#">������</a></li>
				<li><a href="#">��α�</a></li>
			</ul>
		</div>
	</nav>

	<div class="footC">
		�� YOON'S corp. All rights reserved.
	</div>

</div>
</footer>

</body>
</html>
