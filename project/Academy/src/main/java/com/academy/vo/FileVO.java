package com.academy.vo;

public class FileVO {
	private int boardNo;
	private String userId;
	private String title;
	private String content;
	private String fileName;
	private String regDate;
	
	public FileVO() {
		// TODO Auto-generated constructor stub
	}
	public FileVO(String userId, String title, String content, String fileName) {
		this.userId=userId;
		this.title=title;
		this.content=content;
		this.fileName=fileName;
	}
	
	public FileVO(int boardNo,String userId,String title,String content,String fileName,String regDate) {
		this.boardNo=boardNo;
		this.userId=userId;
		this.title=title;
		this.content=content;
		this.fileName=fileName;
		this.regDate=regDate;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
}
