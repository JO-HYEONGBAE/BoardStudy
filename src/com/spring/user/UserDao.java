package com.spring.user.dao;

import com.spring.user.vo.User_InfoVo;

public interface User_InfoDao {
	
	public int idCheck(User_InfoVo user_InfoVo);
	
	public int joinInsert(User_InfoVo user_InfoVo);
	
	public int idPwCheck(User_InfoVo user_InfoVo);
	
	public User_InfoVo selectName(User_InfoVo user_InfoVo);
	
}
