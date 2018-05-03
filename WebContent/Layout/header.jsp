<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String login = (String)session.getAttribute("login");
%>






<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type = "text/css">
		#header, #footer{
			border : 1px solid black;
			width : 600px;
			height : 40px;
			padding-top : 12px;
			
		}
		#main{
			width: 600px;
			min-height:600px;
			padding-top : 15px;
			padding-bottom : 15px;
		}
		
		#table{
			border : 1px solid black;
			width : 500px;
		}
		#button{
			width : 500px;
		}
	</style>
</head>
<body>
<div align = "center">
	<div id = "header">
	<%if(login!=null){ %>
		<a href = "/MyHome/Join/MyPage.jsp"><%=login %>님의 My Page</a> | <a href = "/MyHome/login/logout.jsp">Logout</a> |
	<%}else{ %>
			<a href = "/MyHome/login/loginform.jsp">Login</a> |
			<a href = "/MyHome/Join/JoinForm.jsp">Join</a> |
	<%} %>
	 <a href = "/MyHome/Board/BoardList.jsp?begin=1&end=5">Board</a> |
	 <a href = "/MyHome/index.jsp">Home</a></div>
	<div id = "main">