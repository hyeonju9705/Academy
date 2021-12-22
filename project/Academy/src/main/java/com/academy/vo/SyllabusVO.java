package com.academy.vo;

public class SyllabusVO {
	private int syllabusNo;
	private String weekDay;
	private String userId;
	private String title;
	private String content;
	private String subjectName;

	public SyllabusVO() {
		// TODO Auto-generated constructor stub
	}

	public SyllabusVO(int syllabusNo, String weekDay, String title, String content, String subjectName) {
		this.syllabusNo = syllabusNo;
		this.weekDay = weekDay;
		this.title = title;
		this.content = content;
		this.subjectName = subjectName;
	}

	public SyllabusVO(String weekDay, String title, String content, String subjectName) {
		this.weekDay = weekDay;
		this.title = title;
		this.content = content;
		this.subjectName = subjectName;
	}

	public SyllabusVO(String weekDay, String title, String subjectName) {
		this.weekDay = weekDay;
		this.title = title;
		this.subjectName = subjectName;
	}

	public SyllabusVO(int syllabusNo, String weekDay, String userId, String title, String content, String subjectName) {
		super();
		this.syllabusNo = syllabusNo;
		this.weekDay = weekDay;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.subjectName = subjectName;
	}

	public int getSyllabusNo() {
		return syllabusNo;
	}

	public void setSyllabusNo(int syllabusNo) {
		this.syllabusNo = syllabusNo;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getWeekDay() {
		return weekDay;
	}

	public void setWeekDay(String weekDay) {
		this.weekDay = weekDay;
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
}
