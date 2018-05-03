<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String name = (String)request.getAttribute("name");
 	String id = (String)request.getAttribute("id");
 	String msg = (String)request.getAttribute("msg");
 	boolean check = (boolean)request.getAttribute("check");
 %>   
<%@include file = "/Layout/header.jsp"%>
	
	
<%=msg %>
<%if(check){ %>
	<%=id%>입니다.<br>
	<form action = "/MyHome/login/loginform.jsp" method = "post" name = "f">
	<input type = "hidden" name = "id" value = "<%=id%>">
	<input type = "hidden" name = "name" value = "<%=name %>">
	<input type = "button" value = "PW찾기" onclick = "location.href = 'PasswordForm.jsp'">
	<input type = "submit" value = "로그인하기">
	<input type = "button" value = "홈으로가기" onclick = "location.href = '/MyHome/index.jsp'">
	</form>
<%}else {%>
	<br>
	<input type = "button" value = "아이디 다시 찾기" onclick = "location.href = '/MyHome/login/IdForm.jsp'">
	<br>
	<input type = "button" value = "홈으로가기" onclick = "location.href = '/MyHome/index.jsp'">
<%}%>



<%@include file = "/Layout/footer.jsp"%> 
    
    
    