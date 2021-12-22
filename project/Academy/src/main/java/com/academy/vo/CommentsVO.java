package com.academy.vo;

public class CommentsVO {
	private int commentsNo;
	private String userId;
	private String content;
	private String regDate;
	private int boardNo;
	
	public CommentsVO() {
		// TODO Auto-generated constructor stub
	}

	public CommentsVO(String userId, String content, int boardNo) {
		this.userId = userId;
		this.content = content;
		this.boardNo=boardNo;
	}
	
	public CommentsVO(int commentsNo, String userId, String content, String regDate, int boardNo) {
		super();
		this.commentsNo = commentsNo;
		this.userId = userId;
		this.content = content;
		this.regDate = regDate;
		this.boardNo=boardNo;
	}

	public int getCommentsNo() {
		return commentsNo;
	}

	public void setCommentsNo(int commentsNo) {
		this.commentsNo = commentsNo;
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

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
}
