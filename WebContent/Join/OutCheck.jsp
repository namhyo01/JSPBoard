<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "account.accountDTO.AccountDTO" %>
<%@ page import = "account.accountDAO.AccountDAO" %>


<%
	request.setCharacterEncoding("UTF-8");
	AccountDTO dto = new AccountDTO();
	String id = (String)session.getAttribute("login");
	String password = request.getParameter("password");
	AccountDAO dao = new AccountDAO();
	boolean check = false;
	check = dao.delete(id,password);
	out.println("<script>");
	if(check){
		session.invalidate();
		out.println("alert('회원 탈퇴되셨습니다');");
		out.println("location.href='/MyHome/index.jsp';");
	}else{
		out.println("alert('비밀번호를 다시 확인해 주시기 바랍니다.');");
		out.println("location.href='/MyHome/Join/Out.jsp';");
	}
	out.println("</script>");
%>
