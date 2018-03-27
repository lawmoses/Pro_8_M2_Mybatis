<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<title>Owl Carousel</title>
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.default.css">		
		<!--[if lt IE 9]>
		  <script src="js/html5shiv.min.js"></script>
		<![endif]-->		
  </head>
	<body>
		<div id="wrapper">
			<div class="owl-carousel owl-theme">
				<div class="item">
					<img src="images/wa1.png">
				</div>
				<div class="item">
					<img src="images/wa2.png">
				</div>
				<div class="item">
					<img src="images/wa3.png">
				</div>         
				<div class="item">
					<img src="images/wa4.png">
				</div>
				<div class="item">
					<img src="images/wa5.png">
				</div>
				<div class="item">
					<img src="images/wa6.png">
				</div>         
			</div>
		</div>

    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/owl.carousel.js"></script>
    <script src="js/owl.autoplay.js"></script>
		<script src="js/owl.navigation.js"></script>		
		
		<script>
			$(function() {
				$('.owl-carousel').owlCarousel({
					items:3,
					margin:10,
					loop:true,
          nav:true,
          navText:['이전','다음'],					
					autoplay:true,
          autoplayTimeout:3000,
          autoplayHoverPause:true
				});
			});
		</script>				
  </body>
</html>