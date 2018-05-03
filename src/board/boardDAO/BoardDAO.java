package board.boardDAO;

import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import account.accountDAO.AccountDAO;
import board.boardDTO.BoardDTO;


public class BoardDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
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
	public BoardDTO makeDTO(ResultSet rs){
		BoardDTO dto = null;
		try {
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setseq(rs.getInt("seq"));
				dto.setid(rs.getString("id"));
				dto.setname(rs.getString("name"));
				dto.settitle(rs.getString("title"));
				dto.setcontent(rs.getString("content"));
				dto.sethit(rs.getInt("hit"));
				dto.setlogtime(rs.getString("logtime"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public ArrayList<BoardDTO> makeArray(ResultSet rs){
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setseq(rs.getInt("seq"));
				dto.setid(rs.getString("id"));
				dto.setname(rs.getString("name"));
				dto.settitle(rs.getString("title"));
				dto.setcontent(rs.getString("content"));
				dto.sethit(rs.getInt("hit"));
				dto.setlogtime(rs.getString("logtime"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		if(list.size()==0) {
			list = null;
		}
		return list;
	}
	
	/*public ArrayList<BoardDTO> getList() {
		String sql = "select * from board order by seq desc";
		
		ArrayList<BoardDTO> list = null;
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			list = makeArray(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
				if(rs!=null)
					rs.close();
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
	return list;
	}*/
	public BoardDTO rewrite(int seq) {
		BoardDTO dto = new BoardDTO();
		String sql = "select * from board where seq = ?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, seq);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto.setname(rs.getString("name"));
				dto.setcontent(rs.getString("content"));
				dto.sethit(rs.getInt("hit"));
				dto.setid(rs.getString("id"));
				dto.setlogtime(rs.getString("logtime"));
				dto.settitle(rs.getString("title"));
				dto.setfilename(rs.getString("filename"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
				if(rs!=null)
					rs.close();
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		return dto;
	}
	public boolean write(BoardDTO dto) {
		boolean check = false;
		String sql = "insert into board values(board_seq.nextval,?,?,?,?,0,sysdate,?)";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getid());
			ps.setString(2, new AccountDAO().getName(dto.getid()));
			ps.setString(3, dto.gettitle());
			ps.setString(4, dto.getcontent());
			ps.setString(5, dto.getfilename());
			if(ps.executeUpdate() != 0) {
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
	public boolean updatewrite(BoardDTO dto) {
		boolean check = false;
		int su = 0;
		String sql = "update board set title = ?, content = ? where seq = ?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.gettitle());
			ps.setString(2, dto.getcontent());
			ps.setInt(3, dto.getseq());
			su = ps.executeUpdate();
			
			if(su != 0) {
				check = true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return check;
	}
	public BoardDTO getContent(int seq) {
		BoardDTO dto = null;
		
		String sql = "select * from board where seq = ?";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, seq);
			rs = ps.executeQuery();
			dto = this.makeDTO(rs);
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}

	public BoardDTO getread(int seq) {
		BoardDTO dto = new BoardDTO();
		String sql = "select id, name, title, content, hit, logtime,filename from board where seq = ?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, seq);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto.setid(rs.getString("id"));
				dto.setname(rs.getString("name"));
				dto.settitle(rs.getString("title"));
				dto.setcontent(rs.getString("content"));
				dto.sethit(rs.getInt("hit"));
				dto.setlogtime(rs.getString("logtime"));
				dto.setfilename((rs.getString("filename")));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
				if(rs!=null)
					rs.close();
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		return dto;
	}
	public boolean check_delete(int seq) {
		boolean check = false;
		int su = 0;
		String sql = "delete board where seq = ?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, seq);
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
	public ArrayList<BoardDTO> getList(String option, String search, int begin, int end) {
		String sql = "";
		if(search == "") {
			sql = "select * from "
					+ "(select rownum rn, tt.* from "
					+ "(select * from board order by seq desc) tt) "
					+ "where rn >=? and rn <=?";
		}else {
			if(option.equals("title")){
				sql = "select * from "
						+ "(select rownum rn, tt.* from "
						+ "(select * from board where title like ? order by seq desc) tt) "
						+ "where rn >=? and rn <=?";
			}else if(option.equals("content")) {
				sql = "select * from "
						+ "(select rownum rn, tt.* from "
						+ "(select * from board where content like ? order by seq desc) tt) "
						+ "where rn >=? and rn <=?";
			}else if(option.equals("writer")) {
				sql = "select * from "
						+ "(select rownum rn, tt.* from "
						+ "(select * from board where id like ? order by seq desc) tt) "
						+ "where rn >=? and rn <=?";
			}else{
				sql = "select * from "
						+ "(select rownum rn, tt.* from "
						+ "(select * from board where title like ? or content like ? order by seq desc) tt) "
						+ "where rn >=? and rn <=?";
			}
		}
		ArrayList<BoardDTO> list = null;
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);			
			if(search == "") {
				ps.setInt(1, begin);
				ps.setInt(2, end);
			}else if(option.equals("both")){
				ps.setString(1, '%'+search+'%');
				ps.setString(2, '%'+search+'%');
				ps.setInt(3, begin);
				ps.setInt(4, end);
			}else {
				ps.setString(1, '%'+search+'%');
				ps.setInt(2, begin);
				ps.setInt(3, end);
			}
				
			rs = ps.executeQuery();
			list = makeArray(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
				if(rs!=null)
					rs.close();
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
	return list;
	}
	
	public int gettotal(String option, String search) {
		String sql = "";
		if(search == "")
			sql = "select count(*) from board";
		else {
			if(option.equals("title"))
				sql = "select count(*) from board where title like ?";
			else if(option.equals("content"))
				sql = "select count(*) from board where content like ?";
			else if(option.equals("writer"))
				sql = "select count(*) from board where writer like ?";
			else
				sql = "select count(*) from board where title like ? or content like ?";
		}
			
		int su = 0;
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			if(search != "") {
				if(option.equals("both")) {
					ps.setString(1, '%'+search+'%');
					ps.setString(2, '%'+search+'%');
				}
				else
					ps.setString(1, '%'+search+'%');
			}
			rs = ps.executeQuery();
			if(rs.next()) {
				su = rs.getInt("count(*)");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
				if(rs!=null)
					rs.close();
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		return su;
	}
	public void readCount(int seq) {
		String sql = "update board set hit = hit + 1 where seq = ?";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, seq);
			ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
