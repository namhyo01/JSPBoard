package account.accountDAO;

import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import account.accountDTO.AccountDTO;

public class AccountDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	static DataSource ds;
	
	static {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
				//javaLcomp/env/ - tomcat인 경우 필수 붙이기
			
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
/*	public AccountDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	private Connection getConnection() {
		Connection con = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "jsp";
		String password = "jsp";
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}	*/	
	public String searchId(String name) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String id = null;
		String sql = "select id from account where name = ?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			if(rs.next())
				id = rs.getString("id");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
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
		return id;
	}
	
	public boolean insert(AccountDTO dto) {
		String sql = "insert into account values(account_seq.nextval,?,?,?,?,?,?,?)";
		boolean check = false;
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPassword());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getTel1());
			ps.setString(6, dto.getTel2());
			ps.setString(7, dto.getTel3());
			int su = ps.executeUpdate();
			if(su!=0) {
				check = true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
	return check;
	}
	public boolean delete(String id, String password) {
		boolean check = false;
		int su = 0;
		String sql = "delete account where id = ? and password = ?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			su = ps.executeUpdate();
			if(su!=0) {
				check = true;
			}
		}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					if(ps!=null)
						ps.close();
					if(con!=null)
						con.close();
				}catch(SQLException e)
				{
					e.printStackTrace();
				}
			}
		return check;
	}
	public AccountDTO memberInfo(String id) {
		AccountDTO dto = new AccountDTO();
		String sql = "select * from account where id = ?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
				if(con != null)
					con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	public String getName(String id) {
		String sql = "select name from account where id = ?";
		String name = null;
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				name = rs.getString("name");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
				if(con != null)
					con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return name;
	}
	public boolean confirmId(String id) {
		boolean check = false;
		String sql = "select * from account where id=?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next())
				check = true;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
				if(con != null)
					con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return check;
	}
}
