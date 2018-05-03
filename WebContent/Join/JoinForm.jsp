<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	function join()
	{
		if(document.f.id.value == ""){
			alert("아이디를 입력해주세요");
		}else if(document.f.checktwice == "uncheck"){
			alert("아이디 중복체크를 해주세요");
		}else if(document.f.password.value == ""){
			alert("비밀번호를 입력해주세요");
		}else if(!/^[a-zA-Z0-9!,@,#,$,%,^,&,*,?,-,=,_,~,+,/,<,>,{,},;]{6,12}$/.test(document.f.password.value)){
				alert("비밀번호는 6~12자리여야 합니다.");
		}else if(document.f.repw.value == ""){
			alert("비밀번호를 다시 한번 입력해주세요");
		}else if(document.f.password.value != document.f.repw.value){
			alert("비밀번호 입력이 일치하지 않습니다");
		}else if(document.f.name.value == ""){
			alert("이름을 입력해주세요");
		}else if(document.f.email.value == ""){
			alert("이메일을 입력해주세요");
		}else if(document.f.tel1.value == ""){
			alert("전화번호를 전부 입력해주세요");	
		}else if(document.f.tel2.value == ""){
			alert("전화번호를 전부 입력해주세요");
		}else if(document.f.tel3.value == ""){
			alert("전화번호를 전부 입력해주세요");
		}
		else{
			document.f.submit();
		}
		
	}
	function valuereset(){
		document.f.checktwice.value = "uncheck";
	}
	
function check_id(){
	if(document.f.id.value==""){
		alert("아이디를 입력해주세요");
		return;
	}
	window.name = "parentForm";
	window.open("/MyHome/Join/CheckId.jsp","checkform", "resizable=no, scrollbars=no, width=400, height=300");
	//url="/MyHome/Join/CheckId.jsp?id=" + document.f.id.value;
	//open(url,"check","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400,height=300")
}


</script>
    
<%@ include file = "/Layout/header.jsp" %>    
<form name = "f" action = "/MyHome/Join/CheckJoin.jsp" method = "post">
	<table>
		<tr>
		<td>ID</td>      <td><input type = "text" name = "id" onkeydown = "javascript:valuereset()"> <input type = "button" onclick = "javascript:check_id()" value = "중복확인"><input type = "hidden" name ="checktwice" value = "iduncheck"></td> 
		</tr>
		<tr>
		<td>PW</td>     <td><input type = "password" name = "password" id="password" maxlength="12"></td>
		</tr>
		<tr>
		<td>rePW</td>    <td><input type = "password" name = "repw"id="repw"maxlength="12"></td>
		</tr>
		<tr>
		<td>name</td>	<td><input type = "text" name = "name"></td>
		</tr>
		<tr>
		<td>email</td>	<td><input type = "text" name = "email"></td>
		</tr>
		<tr>
		<td>TEL</td>		<td><select name = "tel1"><option value = "010" selected = "selected">010</option><option value = "016">016</option><option value = "017">017</option><option value = "019">019</option></select> - <input type = "text" size = "5" maxlength = "4" name = "tel2"> - <input type = "text" size = "5" maxlength = "4" name = "tel3"></td>	
		</tr>
		<tr>
		<td colspan = "2" align = "right"><input type = "button" value = "Join" onclick = "javascript:join()"><input type = "button" value = "Cancel" onclick = "reset"></td>	
		</tr>
	</table>
</form>


<%@ include file = "/Layout/footer.jsp" %>