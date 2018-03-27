<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"></head>
<html>
<head>
<title>게시판</title>
</head>
<%
	/* 게시판 답글 다는거 번호 매기기 위해서  (칠판 설명 사진 첨부)*/
    int num=0, ref=0, re_step=0, re_level=0;
	//boardid 어떤 게시판인지 구분되어 form에서 값이 넘어가야함
  	String boardid = request.getParameter("boardid");
	
	 if (boardid==null) boardid = "1";
	 
	 /* 게시판 답글 다는거 번호 매기기 위해서 (칠판 설명 사진 첨부)*/
	/* String boardid=request.getParameter("boardid"); 모두 이런 식이었는데 바꿈 수정함 */
	
	if (request.getParameter("num")!=null) {
	num = Integer.parseInt(request.getParameter("num"));	
	ref = Integer.parseInt(request.getParameter("ref"));
	re_step = Integer.parseInt(request.getParameter("re_step"));
	re_level = Integer.parseInt(request.getParameter("re_level"));
	
	}
 	
%>
<p class="w3-left"  style="padding-left:30px;"></p>
<div class="w3-container">

<center><b>글쓰기</b>
<br>
<form method="post" name="writeform" action="writePro.jsp" >
<input  type="hidden"   name="boardid" value="<%=boardid %>">
<!-- boardid의 값을 따로 입력받지 않음 -->
<input  type="hidden"   name="num" value="<%=num %>">
<input  type="hidden"   name="ref" value="<%=ref %>">
<input  type="hidden"   name="re_level" value="<%=re_level %>">
<input  type="hidden"   name="re_step" value="<%=re_step %>">
<!-- hidden 값으로 받았음. 갑글쓰기 같음 -->


<table class="w3-table-all"  style="width:70%;" >
   <tr>
    <td align="right" colspan="2" >
	    <a href="list.jsp"> 글목록</a> 
   </td>
   </tr>
   <tr>
    <td  width="70"   align="center">이 름</td>
    <td  width="330">
       <input type="text" size="10" maxlength="10" name="writer"></td>
  </tr>
  <tr>
    <td  width="70"   align="center" >제 목
    </td>
    <td width="330">
 
 	<!-- 입력창에 답글이라는 것을 보이게 하는 프로그램  -->
   <% if (request.getParameter("num")==null) { %>
  <input type="text" size="40" maxlength="50" name="subject">
     <% } else { %>  
  <input type="text" size="40" maxlength="50" name="subject"
       value="[답글]"
       > <% } %>
	
   
   </td>
  </tr>
  <tr>
    <td  width="70"   align="center">Email</td>
    <td  width="330">
       <input type="text" size="40" maxlength="30" name="email" ></td>
  </tr>
  <tr>
    <td  width="70"   align="center" >내 용</td>
    <td  width="330" >
     <textarea name="content" rows="13" cols="40"></textarea> </td>
  </tr>
  <tr>
    <td  width="70"   align="center" >비밀번호</td>
    <td  width="330" >
     <input type="password" size="8" maxlength="12" name="passwd"> 
	 </td>
  </tr>
<tr>      
 <td colspan=2  align="center"> 
  <input type="submit" value="글쓰기" >  
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" OnClick="window.location='list.jsp'">
</td></tr></table>    
     
</form>  </center></div>  




</body>
</html>      
