<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>



</script>
<%
	String name = (String)request.getAttribute("name");
	String msg = (String)request.getAttribute("msg");
	boolean check = (Boolean)request.getAttribute("check");
	String id = (String)request.getAttribute("id");
%>

<%@include file = "/Layout/header.jsp" %>
<%= msg %><br>
<%
	if(check){%>
		<a href = "/MyHome/Join/MyPage.jsp">MyPage</a> | <a href = "/MyHome/Join/Out.jsp">회원탈퇴</a> | <a href = "/MyHome/login/logout.jsp">Logout</a> |
	<% }else{%>
		<input type = "button" value = "다시입력" onclick = "location.href = '/MyHome/login/loginform.jsp'"> | <input type = "button" value = "아이디찾기" onclick = "location.href = '/MyHome/login/IdForm.jsp'" >| <input type = "button" value = "비밀번호찾기" onclick = "location.href = '/MyHome/login/PasswordForm.jsp'"> |
	<%} %>
		<a href = "/MyHome/index.jsp">Home</a>

<%@include file = "/Layout/footer.jsp" %>