<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>
	function find_pw()
	{
		if(document.findpw.name.value == ""){
			alert("이름을 입력해주세요");
		}else if(document.findpw.id.value == ""){
			alert("ID를 입력해주세요");
		}else if(document.findpw.phone1.value == ""){
			alert("전화 번호를 다 입력해주세요");
		}else if(document.findpw.phone2.value == ""){
			alert("전화 번호를 다 입력해주세요");
		}else if(document.findpw.phone3.value == ""){
			alert("전화 번호를 다 입력해주세요");
		}else{
			document.findpw.submit();
		}
	}



</script>
    
<%@ include file = "/Layout/header.jsp"%>
<form name = "findpw" action = "/MyHome/login/CheckPw.jsp" method = "post">
<table>
	<caption align = "top"><h1>비밀번호 찾기</h1></caption>
		<tr>
			<td align = "right">이름 : </td><td><input type = "text" name = "name"></td>
		</tr>
		<tr>
			<td align = "right">ID : </td><td><input type = "text" name = "id"></td>
		</tr>
		<tr>
			<td>TELEPHONE : </td><td><input type = "text" name = "phone1" size="8"> - <input type = "text" name = "phone2" size = "8"> - <input type = "text" name = "phone3" size = "8"></td>
		</tr>
		<tr>
			<td align = "center"><input type = "button" value = "찾기" onclick = "javascript:find_pw()"></td>
		</tr>
</table>
</form>


<%@ include  file = "/Layout/footer.jsp"%>