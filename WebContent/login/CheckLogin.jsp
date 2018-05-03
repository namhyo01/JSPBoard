<%@page import="util.connection.MyConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.Connection"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("pw");
	String sql = "select name from account where id = ? and password = ?";
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String name = null;
	String msg = null;
	boolean check = false;
	try{
		con = MyConnection.getConnection();
		ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2,password);
		rs = ps.executeQuery();
		if(rs.next())
		{
			name = rs.getString("name");
			msg = name + "님 환영합니다";
			check = true;
			session.setAttribute("login", id);
		}else{
			msg = "아이디 또는 비밀번호가 잘못되었습니다.";
		}
		
		request.setAttribute("name", name);
		request.setAttribute("msg", msg);
		request.setAttribute("check", check);
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		try{
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	String ckid = request.getParameter("ckid");
	if(ckid != null){
		Cookie ck = new Cookie("ckid",id);
		ck.setMaxAge(60*60);//시간설정
		response.addCookie(ck);//쿠키파일생성
	}else{
		Cookie[] cks = request.getCookies();
		for(Cookie ck : cks){
			if(ck.getName().equals("ckid")){
				ck.setMaxAge(0);
				response.addCookie(ck);
				break;
			}
		}
	}
	pageContext.forward("/login/LoginResult.jsp");
	
%>