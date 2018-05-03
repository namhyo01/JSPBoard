<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "account.accountDAO.AccountDAO" %>
<%@ page import = "account.accountDTO.AccountDTO" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("login");
	AccountDAO dao = new AccountDAO();
	AccountDTO dto = dao.memberInfo(id);
	int no = dto.getNo();
	String name = dto.getName();
	String email = dto.getEmail();
	String tel1 = dto.getTel1();
	String tel2 = dto.getTel2();
	String tel3 = dto.getTel3();
%>

<%@ include file = "/Layout/header.jsp"%>
<table align = "center">
	<tr>
		<td>번호</td>
		<td><%= no%></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%= name%></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%= id%></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%= email%></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><%= tel1%> - <%= tel2 %> - <%= tel3 %></td>
	</tr>
	<tr>
		<td align = "right"><input type = "button" value = "회원탈퇴" onclick = "location.href = '/MyHome/Join/Out.jsp'"></td>
	</tr>
</table>	


<%@ include file = "/Layout/footer.jsp"%>