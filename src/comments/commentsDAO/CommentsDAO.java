package comments.commentsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import comments.commentsDTO.CommentsDTO;

public class CommentsDAO {
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
	
	
	public boolean write(CommentsDTO dto) {
		boolean check = false;
		String sql = "insert into comments values(comments_seq.nextval,?,?,?,sysdate)";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getSeq());
			ps.setString(2, dto.getComments());
			ps.setString(3, dto.getId());
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
				if(rs!=null)
					rs.close();
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		
		return check;
	}
	public ArrayList<CommentsDTO> makeArray(ResultSet rs){
		ArrayList<CommentsDTO> list = new ArrayList<>();
		try {
			while(rs.next()) {
				CommentsDTO dto = new CommentsDTO();
				dto.setNo(rs.getInt("no"));
				dto.setSeq(rs.getInt("seq"));
				dto.setComments(rs.getString("comments"));
				dto.setId(rs.getString("id"));
				dto.setLogtime(rs.getString("logtime"));
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
	
	public ArrayList<CommentsDTO> getList(int seq){
		String sql = "select * from comments where seq = ? order by no desc";
		ArrayList<CommentsDTO> list = null;
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, seq);
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
}
