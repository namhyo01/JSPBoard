<%@page import="board.boardDTO.BoardDTO"%>
<%@page import="board.boardDAO.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = new BoardDTO();
	dto.settitle(request.getParameter("title"));
	dto.setcontent(request.getParameter("content"));
	dto.setseq(Integer.parseInt(request.getParameter("seq")));
	boolean check = dao.updatewrite(dto);
	
	out.println("<script>");
	if(check){
		out.println("alert('수정되셨습니다');");
		out.println("location.href='/MyHome/Board/BoardList.jsp';");
	}else{
		out.println("alert('수정실패');");
		out.println("location.href='/MyHome/Board/BoardRead.jsp?seq="+ dto.getseq() + ";'");
	}
	out.println("</script>");
	

%>