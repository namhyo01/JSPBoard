package comments.commentsDTO;

public class CommentsDTO {
	private int no;
	private int seq;
	private String comments;
	private String id;
	private String logtime;
	
	
	public CommentsDTO(int seq, String comments, String id) {
		super();
		this.seq = seq;
		this.comments = comments;
		this.id = id;
	}
	public CommentsDTO() {
		// TODO Auto-generated constructor stub
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
}
