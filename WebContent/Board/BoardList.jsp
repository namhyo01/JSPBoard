<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "board.boardDTO.BoardDTO" %>
<%@ page import = "board.boardDAO.BoardDAO" %>

<script>
	function search_check(){
		if(document.search.searches.value == ""){
			alert("검색창이 비었습니다");
		}else{
			document.search.submit();	
		}
	}
</script>
<%
	request.setCharacterEncoding("UTF-8");
	int begin = 1;
	int end = 5;
	String option = "";
	String search = "";
	if(request.getParameter("searches")!=null)
	{
		option = request.getParameter("option");
		search = request.getParameter("searches");
	}
	if(request.getParameter("begin") != null){
		begin = Integer.parseInt(request.getParameter("begin"));
		end = Integer.parseInt(request.getParameter("end"));
	}
	
	
	BoardDAO dao = new BoardDAO();
	
	int total = dao.gettotal(option,search);
	int now_page = (begin -1)/5+1;
	System.out.println(search);
	ArrayList<BoardDTO> list = dao.getList(option,search,begin, end);	
%>
<%@ include file = "/Layout/header.jsp"%>
<table border = "1" id = "table">
	<tr>
		<th>번호</th>
		<th>글제목</th>
		<th>아이디</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<%if(list != null){ %>
		<%for(BoardDTO dto : list){ %>
			<tr align = "center">
				<td><%=dto.getseq() %></td>
				<td width = "200"><a href = "/MyHome/Board/BoardRead.jsp?seq=<%=dto.getseq()%>"><%=dto.gettitle() %></a></td>
				<td><%=dto.getid().substring(0,3) + "..." %></td>
				<td><%=dto.getlogtime().substring(0,10) %></td>
				<td><%=dto.gethit() %></td>
			</tr>
		<%} %>
	<%}else{ %>
		<tr align = "center"><td colspan ="5">작성한 글이 없습니다.</td></tr>
	<%} %>
</table>
<%if(login != null){ %>
<div id = "button" align = "right">
	<input type = "button" value = "글쓰기" onclick = "location.href = '/MyHome/Board/BoardWrite.jsp'">
</div>
<% }%>
<form name = "search" method = "post" action = "/MyHome/Board/BoardList.jsp">
	<table>
		<tr>
			<td><select name = "option"><option value = "title">제목</option><option value = "content">내용</option><option value = "writer">글쓴이</option><option value = "both">제목+내용</option></select></td>
			<td><input type = "text" size = "40" name = "searches"><input type = "button" value = "검색" onclick="javascript:search_check()"></td>
		</tr>
	</table>
</form>
<%if(begin>=11){ %>
	<%if(search != ""){ %>
		<a href = "/MyHome/Board/BoardList.jsp?begin=<%=begin-10%>&end=<%=end-10%>&searches=<%=search%>&option=<%=option%>">[이전]</a>
	<%}else{ %>
		<a href = "/MyHome/Board/BoardList.jsp?begin=<%=begin-10%>&end=<%=end-10%>">[이전]</a>
	<%} %>
<%} %>


<%if(begin>=6){ %>
	<%if(search != ""){ %>
		<a href = "/MyHome/Board/BoardList.jsp?begin=<%=begin-5%>&end=<%=end-5%>&searches=<%=search%>&option=<%=option%>">[<%=now_page-1 %>]</a>
	<%}else{ %>
		<a href = "/MyHome/Board/BoardList.jsp?begin=<%=begin-5%>&end=<%=end-5%>">[<%=now_page-1 %>]</a>
	<%} %>	
<%} %>
	[<%=now_page %>]

<%if(begin + 5 <= total){ %>
	<%if(search != ""){ %>
		<a href = "/MyHome/Board/BoardList.jsp?begin=<%=begin+5%>&end=<%=end+5%>&searches=<%=search%>&option=<%=option%>">[<%=now_page+1 %>]</a>
	<%}else{ %>
		<a href = "/MyHome/Board/BoardList.jsp?begin=<%=begin+5%>&end=<%=end+5%>">[<%=now_page+1 %>]</a>
	<%} %>

<%} %>
<%if(begin +10 <= total){ %>
	<%if(search != ""){ %>
		<a href = "/MyHome/Board/BoardList.jsp?begin=<%=begin+10%>&end=<%=end+10%>&searches=<%=search%>&option=<%=option%>">[다음]</a>
	<%}else{ %>
		<a href = "/MyHome/Board/BoardList.jsp?begin=<%=begin+10%>&end=<%=end+10%>">[다음]</a>
	<%} %>
<%} %>	


<%@ include file = "/Layout/footer.jsp" %>
