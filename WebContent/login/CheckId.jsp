<%@page import="util.connection.MyConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import =  "java.sql.*"%>

    
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String sql = "select id from account where name = ?";
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String id = null;
	String msg = null;
	boolean check = false;
	
	try{
		con = MyConnection.getConnection();
		ps = con.prepareStatement(sql);
		ps.setString(1,name);
		rs = ps.executeQuery();
		if(rs.next()){
			id = rs.getString("id");
			msg = "회원님의 아이디는 ";
			check = true;
		}else{
			msg = "아이디를 못찾았습니다";
		}
		request.setAttribute("name", name);
		request.setAttribute("id", id);
		request.setAttribute("msg", msg);
		request.setAttribute("check", check);
	}catch(SQLException e)
	{
		e.printStackTrace();
	}finally{
		try{
			if(rs!=null)
				rs.close();
			if(ps!=null)
				ps.close();
			if(con!=null)
				con.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	pageContext.forward("/login/IdResult.jsp");



%>