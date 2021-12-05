package com.spring.mvc.user;

public interface UserService {

	void insertUser(UserVO vo);
	
	void deleteUser(UserVO vo);
	
	void updateUser(UserVO vo);
	
	UserVO getUser(UserVO vo);

}