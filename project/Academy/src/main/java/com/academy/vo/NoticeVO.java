package com.academy.vo;

public class NoticeVO {
	private int boardNo;
	private String userId;
	private String title;
	private String content;
	private String regDate;
	private int hit;
	private String subjectName;	//과목명 찾아야해서!
	
	public NoticeVO() {
		// TODO Auto-generated constructor stub
	}
	
	//준호 subject_main 공지사항 과목마다 제목 바뀌는거~
	public NoticeVO(String title) {
		this.title = title;
	}

	public NoticeVO(String title, String subjectName) {
		this.title = title;
		this.subjectName=subjectName;
	}
	
	public NoticeVO(int boardNo, String title, String content) {
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
	}
	
	public NoticeVO(String userId, String title, String content) {
		this.userId = userId;
		this.title = title;
		this.content = content;
	}
	
	public NoticeVO(int boardNo, String userId, String title, String regDate, int hit) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.title = title;
		this.regDate = regDate;
		this.hit = hit;
	}
	
	public NoticeVO(int boardNo, String userId, String title, String content, String regDate, int hit) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.hit = hit;
	}
	
	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
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
