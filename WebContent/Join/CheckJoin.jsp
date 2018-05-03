<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<%@ page import = "account.accountDTO.AccountDTO" %>
<%@ page import = "account.accountDAO.AccountDAO" %>
<%
	request.setCharacterEncoding("UTF-8");
	AccountDTO dto = new AccountDTO();
	dto.setId(request.getParameter("id"));
	dto.setPassword(request.getParameter("password"));
	dto.setName(request.getParameter("name"));
	dto.setEmail(request.getParameter("email"));
	dto.setTel1(request.getParameter("tel1"));
	dto.setTel2(request.getParameter("tel2"));
	dto.setTel3(request.getParameter("tel3"));
	
	AccountDAO dao= new AccountDAO();
	boolean check = dao.insert(dto);
	if(check){
		out.write("<script>");
		out.write("alert('회원가입에 성공하셨습니다.로그인 페이지로 이동합니다');");
		out.write("location.href = '/MyHome/login/loginform.jsp?id="+ dto.getId()+ "';");
		out.write("</script>");
	}else{
		out.write("<script>");
		out.write("alert('회원가입에 실패하셨습니다.이전 페이지로 이동합니다');");
		out.write("location.href = '/MyHome/Join/JoinForm.jsp';");
		out.write("</script>");
	}
	
%>  
    
    
    
    