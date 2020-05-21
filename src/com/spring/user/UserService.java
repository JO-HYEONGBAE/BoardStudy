package com.spring.user.service;

import com.spring.user.vo.User_InfoVo;

public interface user_InfoService {
	
	public int idCheck(User_InfoVo user_InfoVo);
	
	public int joinInsert(User_InfoVo user_InfoVo);
	
	public int idPwCheck(User_InfoVo user_InfoVo);
	
	public User_InfoVo selectName(User_InfoVo user_InfoVo);
}
