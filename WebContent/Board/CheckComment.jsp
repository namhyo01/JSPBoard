<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "comments.commentsDAO.CommentsDAO" %>
<%@ page import = "comments.commentsDTO.CommentsDTO" %>
<%
	request.setCharacterEncoding("UTF-8");
	CommentsDTO dto = new CommentsDTO(Integer.parseInt(request.getParameter("seq")),request.getParameter("comments"),request.getParameter("id"));
	CommentsDAO dao = new CommentsDAO();
	boolean check = dao.write(dto);
	out.println("<script>");
	if(check){
		out.println("alert('글쓰기 완료');");
		out.println("location.href = '/MyHome/Board/BoardRead.jsp?seq=" + dto.getSeq() + "';");
	}else{
		out.println("alert('글쓰기 실패');");
		out.println("location.href = '/MyHome/Board/BoardRead.jsp?seq=" + dto.getSeq() + "';");
	} 
	out.println("</script>");
	
%>