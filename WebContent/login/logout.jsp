<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	//session.removeAttribute("login");
	session.invalidate();
	//session = request.getSession();
	//session.setAttribute(arg0, arg1)
	out.println("<script>");
	out.println("alert('로그아웃되셨습니다');");
	out.println("location.href = '/MyHome/index.jsp';");
	out.println("</script>");


%>