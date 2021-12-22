package com.academy.vo;

public class ANoticeVO {
	private int boardNo;
	private String userId;
	private String title;
	private String content;
	private String regDate;
	private int hit;
	
	public ANoticeVO() {
		// TODO Auto-generated constructor stub
	}
	
	public ANoticeVO(String title, String content) {
		this.title=title;
		this.content=content;
	}
	public ANoticeVO(String title, int boardNo) {
		this.title=title;
		this.boardNo=boardNo;
	}
	
	public ANoticeVO(int boardNo, String title, String content) {
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
	}
	public ANoticeVO(String userId, String title, String content) {
		this.userId = userId;
		this.title = title;
		this.content = content;
	}
	
	public ANoticeVO(int boardNo, String userId, String title, String regDate, int hit) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.title = title;
		this.regDate = regDate;
		this.hit = hit;
	}
	
	public ANoticeVO(int boardNo, String userId, String title, String content, String regDate, int hit) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.hit = hit;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
}
