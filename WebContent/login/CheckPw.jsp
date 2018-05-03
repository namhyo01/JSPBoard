<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<%@ page import = "util.connection.MyConnection" %>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String sql = "select password from account where id = ? and name = ? and tel1 = ? and tel2 = ? and tel3 = ?";
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String msg = null;
	String password = null;
	boolean check = false;
	try{
		con = MyConnection.getConnection();
		ps = con.prepareStatement(sql);
		ps.setString(1,id);
		ps.setString(2,name);
		ps.setString(3, phone1);
		ps.setString(4, phone2);
		ps.setString(5, phone3);
		rs = ps.executeQuery();
		if(rs.next()){
			password = rs.getString("password");
			msg = "회원님의 비밀번호는";
			check = true;
		}else{
			msg = "정보에 올맞는 비밀번호가 없습니다";
		}
		request.setAttribute("password", password);
		request.setAttribute("check", check);
		request.setAttribute("msg", msg);
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		try{
			if(rs!=null)
				rs.close();
			if(ps!=null)
				ps.close();
			if(con!=null)
				con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	pageContext.forward("/login/PwResult.jsp");

%>