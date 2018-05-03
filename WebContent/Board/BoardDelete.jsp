<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.boardDAO.BoardDAO" %>
    
<%
	request.setCharacterEncoding("UTF-8");
	int seq = Integer.parseInt(request.getParameter("seq"));
	BoardDAO dao = new BoardDAO();
	boolean check = dao.check_delete(seq);
	out.println("<script>");
	if(check){
		out.println("alert('삭제하였습니다');");
		out.println("location.href = '/MyHome/Board/BoardList.jsp';");
	}else{
		out.println("alert('삭제하지 못했습니다');");
		out.println("history.back();");
	}
	out.println("</script>");
%>    