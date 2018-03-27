<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>첫화면</title>
		<link href="css/vg.css" rel="stylesheet">
		<link href="css/vegas.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="js/html5shiv.min.js"></script>
		<![endif]-->				
	</head>
	<body>  
		<div id="content">
      <h1>YOON'S Crowd Funding</h1>				
      <p><strong><a href="http://vegas.jaysalvat.com/">크라우드 펀딩</a></strong> <br> 세상을 바꾸는 작은 돈의 힘</p>
      </br>
      <a href="/Pro_8/view/list-c.jsp"><h3>들어가기</h3></a>
       </br>
        </br>
	  </div>
		<script src="js/jquery-2.2.4.min.js"></script>
		<script src="js/vegas.min.js"></script>
		<script>
			$(function(){
				$('body').vegas({
					slides:[
						/* {src:'images/bback01.jpg'}, */
						/* {src:'images/bback02.jpg'}, */
						{src:'images/bback03.jpg'},
						{src:'images/bback04.jpg'},
						{src:'images/bback05.jpg'},
						{src:'images/bback06.jpg'},
						{src:'images/bback07.jpg'},
						{src:'images/bback08.jpg'},
						{src:'images/bback09.jpg'},
						{src:'images/bback10.jpg'},
					],
					delay:1200
				});			
			});
		</script>		
	</body>
	</html>