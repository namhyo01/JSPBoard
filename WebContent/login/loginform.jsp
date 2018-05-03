<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	String _id = request.getParameter("id");
	Cookie[] cks = request.getCookies();
	if(_id == null){
	if(cks != null){
		for(Cookie ck : cks){
			if(ck.getName().equals("ckid")){
				_id = ck.getValue();
				break;
			}
		}
	}
	if(_id == null)
		_id = "";
	}
%>   
 
<script type = "text/javascript">
	function logincheck(){
		if(document.login.id.value ==""){
			alert("아이디를 입력해주시오");
		}else if(document.login.pw.value=="")
		{
			alert("비밀번호 입력해주시오");
		}
		else{
			document.login.submit();
		}
	}
</script>

<%@include file = "/Layout/header.jsp"%>
	<form action = "/MyHome/login/CheckLogin.jsp" method = "post" name = "login">
		<table border = "1">
			<tr>
				<td align = "center">ID</td>
				<%if(_id.equals("")){%>
				<td><input type = "text" name = "id"></td>
				<%}else{%>
				<td><input type = "text" value = "<%=_id%>" name = "id"></td>
				<%} %>
				
			</tr>
			<tr>
				<td align = "center">PW</td>
				<td><input type = "password" name = "pw"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<%if(!_id.equals("")){%>
 				<input type="checkbox" value="true" name = "ckid" checked = "checked"><font size="2">아이디기억하기</font>
 				<%}else{ %>
 				<input type = "checkbox" value = "true" name = "ckid"><font size = "2">아이디기억하기</font>
 				<%} %>
 				<input type="button" value="Login" onclick="javascript:logincheck()">
				<input type="button" value="Home" onclick="location.href='/MyHome/index.jsp'">
				</td>
			</tr>
		</table>
			<input type = "button" value = "ID찾기" onclick = "location.href = '/MyHome/login/IdForm.jsp'">
			<input type = "button" value = "PW찾기" onclick = "location.href = '/MyHome/login/PasswordForm.jsp'">
	</form>
<%@include file = "/Layout/footer.jsp"%>