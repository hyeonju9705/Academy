package com.academy.vo;

import static org.junit.Assert.assertThat;

import java.util.HashMap;
import static org.hamcrest.CoreMatchers.is;
import org.junit.Before;
import org.junit.Test;

public class test {
	
	private UserVO user;
	private UserVO user2;
	private UserVO user3;
	@Before
	public void setup() {
		user =new UserVO();
		user.setUserId("a");
		user.setUserPwd("a");
		
		user2 =new  UserVO();
		user2.setUserId("a");
		user2.setUserPwd("s");
		
		user3 =new  UserVO();
		user3.setUserId("dff");
		user3.setUserPwd("wd");
	}
	
	@Test
	public void start() {
		 HashMap<String, Object> map = new HashMap<String, Object>();
		  AcademyDAO dao=AcademyDAO.getInstance();   
		  map=dao.loginCheck(user.getUserId(),user.getUserPwd());
		  UserVO result =new UserVO();
		 
		  assertThat(Integer.parseInt(map.get("key").toString()), is(1));
		 
		  map=dao.loginCheck(user2.getUserId(),user2.getUserPwd());
		  assertThat(Integer.parseInt(map.get("key").toString()), is(2));
	
		  map=dao.loginCheck(user3.getUserId(),user3.getUserPwd());
		  assertThat(Integer.parseInt(map.get("key").toString()), is(3));
		
		
	}
	
}
