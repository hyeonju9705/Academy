package com.academy.vo;

public class CommentsVO {
	private int commnetsNo;
	private String userId;
	private String content;
	private String regDate;
	
	public CommentsVO() {
		// TODO Auto-generated constructor stub
	}

	public CommentsVO(int commnetsNo, String userId, String content, String regDate) {
		super();
		this.commnetsNo = commnetsNo;
		this.userId = userId;
		this.content = content;
		this.regDate = regDate;
	}

	public int getCommnetsNo() {
		return commnetsNo;
	}

	public void setCommnetsNo(int commnetsNo) {
		this.commnetsNo = commnetsNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
}
