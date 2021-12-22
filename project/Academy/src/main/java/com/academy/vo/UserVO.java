package com.academy.vo;

public class UserVO {
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String phoneNo;
	private int division;
	private String subjectName;

	public UserVO() {
		// TODO Auto-generated constructor stub
	}
	
	//준호 로그인쪽?
	public UserVO(String userId, String subjectName) {
		this.userId = userId;
		this.subjectName=subjectName;
	}

	// 희수 mypageUpdate
	public UserVO(String userId, String userName, String userPwd, String phoneNo, String email) {
		this.userId=userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.phoneNo = phoneNo;
		this.email = email;
	}
	
	// 희수 mypageUpdate
	public UserVO(String userName, String userPwd, String phoneNo, String email) {
		this.userName = userName;
		this.userPwd = userPwd;
		this.phoneNo = phoneNo;
		this.email = email;
	}

	public UserVO(String userId, String userPwd, String userName, String email, String phoneNo, int division) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phoneNo = phoneNo;
		this.division = division;
	}

	public UserVO(String userId, String userPwd, String userName, String email, String phoneNo, String subjectName,
			int division) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phoneNo = phoneNo;
		this.subjectName = subjectName;
		this.division = division;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public int getDivision() {
		return division;
	}

	public void setDivision(int division) {
		this.division = division;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

}
