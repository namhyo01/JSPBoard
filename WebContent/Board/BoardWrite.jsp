
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	function check() {
		if(document.write.title.value == ""){
			alert("글제목을 입력 하십시오!");
		} else if(document.write.content.value == ""){
			alert("글내용을 작성하십시오!");
		} else{
			document.write.submit();
		}
	}
</script>

<%@ include file = "/Layout/header.jsp" %>   
 
<form name = "write" method = "post" action = "checkWrite.jsp"
enctype="multipart/form-data">
<input type = "hidden" name = "id" value ="<%= login%>">
	<table border = "1" id = "table">
		<tr>
			<td width = "60">제목</td>
			<td><input size = "53" type = "text" name = "title"></td>
		</tr>
		<tr>
			<td colspan = "2" align = "center">
			<textarea rows = "15" cols = "65" name = "content"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<input type = "file" name = "upload" size = "100">
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td align = "right">
				<input type = "button" value = "다시쓰기" onclick = "document.write.reset()">
				<input type = "button" value = "확인" onclick = "javascript:check()">
				<input type = "button" value = "취소" onclick = "location.href = '/MyHome/Board/BoardList.jsp'">
			</td>
		</tr>
	</table>
</form>   
<%@ include file = "/Layout/footer.jsp" %>       