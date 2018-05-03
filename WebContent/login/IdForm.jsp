<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>
	function find_id(){
		if(document.findid.name.value == ""){
			alert("이름을 입력해주세요");
		}else{
			document.findid.submit();
		}
	}


</script>


<%@ include file = "/Layout/header.jsp"%>

	<form action = "/MyHome/login/CheckId.jsp" method = "post" name = "findid">
		<table>
				<caption align = "top"><h1>아이디 찾기</h1></caption>
			<tr>
				<td align = "center">이름:<input type = "text" name = "name"></td>
			</tr>
			<tr>
				<td align = "center"><input type = "button" value = "찾기" onclick = "javascript:find_id()"></td>
		</table>
	</form>





<%@ include file = "/Layout/footer.jsp"%>