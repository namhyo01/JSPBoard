package board.boardDTO;

public class BoardDTO {
	private int seq;
	private String id;
	private String name;
	private String title;
	private String content;
	private int hit;
	private String logtime;
	private String filename;
	public BoardDTO() {
		
	}
	public String getfilename() {
		return this.filename;
	}
	public void setfilename(String filename) {
		this.filename = filename;
	}
	public int getseq() {
		return this.seq;
	}
	public void setseq(int seq) {
		this.seq = seq;
	}
	public String getlogtime() {
		return this.logtime;
	}
	public void setlogtime(String logtime) {
		this.logtime = logtime;
	}
	public String getid(){
		return this.id;
	}
	public void setid(String id) {
		this.id = id;
	}
	public String getname() {
		return this.name;
	}
	public void setname(String name) {
		this.name = name;
	}
	public String gettitle() {
		return this.title;
	}
	public void settitle(String title) {
		this.title = title;
	}
	public String getcontent() {
		return this.content;
	}
	public void setcontent(String content) {
		this.content = content;
	}
	public int gethit() {
		return this.hit;
	}
	public void sethit(int hit) {
		this.hit = hit;
	}
}
