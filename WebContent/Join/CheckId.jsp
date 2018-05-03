
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
	#title{
		width:490px;
		text-align:center;
	}
	#cancel{
		visibility:visible;
	}
	#use{
		visibility:hidden;
	}
</style>
<script>
	function init(){
		document.getElementById("userid").value = opener.document.f.id.value;
	}
	var httpRequest = null;
	function getXMLHttpRequest(){
		var httpRequest = null;
		if(window.ActiveXObject){
			try{
				httpRequest = new ActiveObject("Msxml2.XMLHTTP");
			}catch(e){
				try{
					httpRequest = new ActiveObject("Microsoft.XMLHTTP");
				}catch(e){httpRequest = null; }
			}
		}
		else if(window.XMLHttpRequest){
			httpRequest = new window.XMLHttpRequest();
		}
		return httpRequest;
	}
	function idcheck(){
		var id = document.getElementById("userid").value;		
		if(!id){
			alert("아이디를 입력하지 않으셨습니다.");
			return false;
		}else if((id < "0" || id > "9") && (id < "A" || id >= "Z") && (id < "a" || id > "z")){
			alert("영어와 숫자로만 입력해주세요");
			return false;
		}else{
			var par = "id="+id;
			httpRequest = getXMLHttpRequest();
			httpRequest.onreadystatechange = checktwice;
			httpRequest.open("POST","/MyHome/Join/Idcheck.jsp",true);
			httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			httpRequest.send(par);
		}
		
	}
	
	function checktwice(){
		if(httpRequest.readyState == 4){
			var text = httpRequest.responseText;
			if(text == 0){
				alert("이미 사용중인 아이디입니다.");
				document.getElementById("cancel").style.visibility='visible';
				document.getElementById("use").style.visibility='hidden';
				document.getElementById("msg").innerHTML="";
			}else if(text ==1){
				document.getElementById("cancel").style.visibility='hidden';
				document.getElementById("use").style.visibility="visible";
				document.getElementById("msg").innerHTML="사용 가능한 아이디입니다.";
				
			}
		}
	}
	
	function send(){
		opener.document.f.checktwice.value = "check";
		opener.document.f.id.value = document.getElementById("userid").value;
		if(opener != null){
			opener.checkform = null;
			self.close();
		}
	}
</script>
</head>
<body onload="init()">
	<div id="title">
		<br><font size="5" color = "gray">아이디 중복체크</font>
		<hr size = "2" width = "460px">
		<br>
		<form>
			<input type = "text" name="input" id="userid">
			<input type = "button" value = "확인" onclick="javascript:idcheck()">
		</form>
		<div id="msg"></div>
		<br>
		<input id="cancel" type = "button" value="취소" onclick="window.close()">
		<input id="use" type = "button" value = "사용" onclick="javascript:send()">
		
	</div>
</body>
</html>