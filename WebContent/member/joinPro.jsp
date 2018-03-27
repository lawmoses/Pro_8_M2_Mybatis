<%@page import="com.saeyan.dao.MemberDAO"%>
<%@page import="com.saeyan.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String userid = request.getParameter("userid");
String pwd = request.getParameter("pwd");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String admin = request.getParameter("admin");
MemberVO mVo = new MemberVO();
mVo.setName(name);
mVo.setUserid(userid);
mVo.setPwd(pwd);
mVo.setEmail(email);
mVo.setPhone(phone);
mVo.setAdmin(Integer.parseInt(admin));
MemberDAO mDao = MemberDAO.getInstance();
int result = mDao.insertMember(mVo);

if (result == 1) {
	mVo = mDao.getMember(userid);
	session.setAttribute("name", mVo.getName());
	session.setAttribute("userid", mVo.getUserid());
	response.sendRedirect("/Pro_8/view/list-c.jsp");
	
} else  {
	
	%>
	
	<script>
	alert("nonono");
	history.go(-1);
</script>
	<%} %>



</body>
</html>