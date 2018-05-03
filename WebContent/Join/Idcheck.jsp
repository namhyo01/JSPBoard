<%@page import="java.io.PrintWriter"%>
<%@page import="account.accountDAO.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	AccountDAO dao = new AccountDAO();
	boolean check = dao.confirmId(id);
	//PrintWriter k = response.getWriter();
	if(check){
		out.println("0");
	}else{
		out.println("1");
	}
%>    