package com.academy.vo;

public class SubjectVO {
	private int subjectNo;
	private String subjectName;
	private String professorId;
	
	public SubjectVO() {
		// TODO Auto-generated constructor stub
	}

	public SubjectVO(int subjectNo, String subjectName, String professorId) {
		super();
		this.subjectNo = subjectNo;
		this.subjectName = subjectName;
		this.professorId = professorId;
	}

	public int getSubjectNo() {
		return subjectNo;
	}

	public void setSubjectNo(int subjectNo) {
		this.subjectNo = subjectNo;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getProfessorId() {
		return professorId;
	}

	public void setProfessorId(String professorId) {
		this.professorId = professorId;
	}
	
}
