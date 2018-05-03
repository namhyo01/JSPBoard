<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String password = (String)request.getAttribute("password");
	String msg = (String)request.getAttribute("msg");
	boolean check = (boolean)request.getAttribute("check");
	char temp = 'a';
%>

<%@ include file = "/Layout/header.jsp" %>
<%=msg %>

<%if(check){ 
	int pw = password.length();
	for(int i=0;i<pw-4;i++)
	{
		temp = password.charAt(i);%>	
		<%=temp%>	
	<%}%>
	****	
	<br>
	<input type = "button" value = "로그인하기 " onclick = "location.href = '/MyHome/login/loginform.jsp'">
	<input type = "button" value = "홈으로가기" onclick = "location.href = '/MyHome/index.jsp'">
<%}else{%>
	<br>
	<input type = "button" value = "다시찾기" onclick = "location.href = '/MyHome/login/PasswordForm.jsp'">
	<input type = "button" value = "홈으로가기" onclick = "location.href = '/MyHome/index.jsp'">
	
<%} %> 



<%@ include file = "/Layout/footer.jsp"%>