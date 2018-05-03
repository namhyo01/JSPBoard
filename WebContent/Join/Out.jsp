<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("login");


%>

<script>
	function check(){
		if(document.out.password.value == ""){
			alert("비밀번호를 입력해주세요");
		}else{
			document.out.submit();
		}
	}
</script>
<%@	include file = "/Layout/header.jsp" %>

<form name = "out" action = "/MyHome/Join/OutCheck.jsp" method = "post">
	<table>
	<tr>
		<th>패스워드를 입력해주세요</th>
	</tr>
	<tr>
		<td>Password : </td> 
		<td><input type = "password" name = "password"></td>
	</tr>
	<tr>
		<td align = "right"><input type = "button" value = "확인" onclick = "javascript:check()"></td>
		<td><input type = "button" value = "취소" onclick = "location.href = '/MyHome/index.jsp'"></td>
	</tr>
	</table>
</form>

<%@ include file = "/Layout/footer.jsp" %>