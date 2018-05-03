<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.boardDTO.BoardDTO" %>
<%@ page import = "board.boardDAO.BoardDAO" %>
<%@ page import = "comments.commentsDAO.CommentsDAO" %>
<%@ page import = "comments.commentsDTO.CommentsDTO" %>
<%@ page import = "java.util.ArrayList" %>

<script>
	function checkcomment(){
		if(document.comment.comments.value == ""){
			alert("댓글이 등록되지 않았습니다");
		}else{
			document.comment.submit();
		}
	}

</script>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	String check_login = (String)session.getAttribute("login");
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.getread(seq);
	dao.readCount(seq);
	boolean check = false;
	if(dto.getid().equals(check_login)){
		check = true;
	}
	CommentsDAO cdao = new CommentsDAO();
	ArrayList<CommentsDTO> list = cdao.getList(seq);	
%>



<%@ include file = "/Layout/header.jsp" %>
	<table id = "table" border = "1">
		<tr>
			<th width = "10%" align = "center">제목</th>
			<td width = "60%"><%=dto.gettitle() %></td>
			<td><%=dto.getlogtime() %></td>
		</tr>
		<tr>
			<th width = "10%" align = "center">글쓴이</th>
			<td width = "60%"><%=dto.getname() %></td>
			<td width = "30%">조회수: <%=dto.gethit() %></td>
		</tr>
		<tr height = "400px">
			<td colspan = "3"><%=dto.getcontent() %></td>
		</tr>
		<tr>
			<%if(dto.getfilename()!=null){ %>
				<td colspan = "3"><a href = "/MyHome/Board/fileDownload.jsp?filename=<%=dto.getfilename()%>"><%=dto.getfilename() %></a>
			<%} %>
		</tr>
	</table>
	<table width = "500px">
		<tr>
		<td align = "right">
		<%if(check){ %>
			<input type = "button" value = "수정" onclick = "location.href = '/MyHome/Board/BoardReWrite.jsp?seq=<%=seq%>'"> <input type = "button" value = "삭제" onclick = "location.href = '/MyHome/Board/BoardDelete.jsp?seq=<%=seq %>'">
		<%} %>
			<input type = "button" value = "목록으로" onclick = "location.href = '/MyHome/Board/BoardList.jsp'"></td>
		</tr>
	</table>
	
    <table border = "1" id = "table">
    	<%if(list == null) {%>
    		<tr>
    			<td align = "center" colspan = "1">댓글이 없습니다.</td>
    		</tr>
    	<%}else{ %>
    		<%for(CommentsDTO cd : list){ %>
    		<tr>
    			<td><%= cd.getId()%></td>
    			<td><%= cd.getComments()%></td>
    			<td><%= cd.getLogtime().substring(0,10) %></td>
   
    		</tr>
    		<%} %>
    	<%} %>
    </table>
    <%if(login != null) {%>
    	<form action = "/MyHome/Board/CheckComment.jsp" method = "post" name = "comment">
			<input type = "hidden" name = "seq" value = "<%=seq %>">
			<input type = "hidden" name = "id" value = "<%=login %>">
			<div id = "table">
				<input type = "text" name = "comments">
				<input type = "button" value = "댓글" onclick = "javascript:checkcomment()">
			</div>
    	</form>
    <%} %>
<%@ include file = "/Layout/footer.jsp" %>





    