<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.boardDTO.BoardDTO" %>
<%@ page import = "board.boardDAO.BoardDAO" %>
<%	
	//실제 경로 구하기
	String realpath = request.getServletContext().getRealPath("/storage");//현재폴더
	MultipartRequest mr = new MultipartRequest(request, realpath,10*1024*1024,"UTF-8",new DefaultFileRenamePolicy());
	//파일 경로, 파일 크기, 인코딩 형식, 덮어쓰기 방지 설정 클래스
	String filename = mr.getOriginalFileName("upload");
	String filename1 = null;
	if(filename != null){
		filename1 = mr.getFilesystemName("upload");
		File file = mr.getFile("upload");
		URLEncoder.encode(filename + 23,"UTF-8");
	}
	request.setCharacterEncoding("UTF-8");
	BoardDTO dto = new BoardDTO();
	dto.setid(mr.getParameter("id"));
	dto.settitle(mr.getParameter("title"));
	dto.setcontent(mr.getParameter("content"));
	dto.setfilename(filename1);
	BoardDAO dao = new BoardDAO();
	out.println("<script>");
	if(dao.write(dto)){
		out.println("alert('글쓰기 완료');");
		out.println("location.href = '/MyHome/Board/BoardList.jsp';");
	}else{
		out.println("alert('글쓰기 실패');");
		out.println("location.href = '/MyHome/Board/BoardWrite.jsp';");
	}
	out.println("</script>");
%>
