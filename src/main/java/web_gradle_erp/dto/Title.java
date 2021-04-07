package web_gradle_erp.dto;

public class Title {
	private int titleNo;
	private String tName;
	
	
	public Title() {
		// TODO Auto-generated constructor stub
		
	}


	public Title(int titleNo) {
		super();
		this.titleNo = titleNo;
	}


	public Title(int titleNo, String tName) {
		super();
		this.titleNo = titleNo;
		this.tName = tName;
	}


	public int getTitleNo() {
		return titleNo;
	}


	public void setTitleNo(int titleNo) {
		this.titleNo = titleNo;
	}


	public String gettName() {
		return tName;
	}


	public void settName(String tName) {
		this.tName = tName;
	}


	@Override
	public String toString() {
		return "Title [titleNo=" + titleNo + ", tName=" + tName + "]";
	}

}
