package com.spring.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.user.dao.User_InfoDao;
import com.spring.user.service.user_InfoService;
import com.spring.user.vo.User_InfoVo;

@Service
public class user_InfoServiceImpl implements user_InfoService {
	
	@Autowired
	User_InfoDao user_InfoDao;

	@Override
	public int idCheck(User_InfoVo user_InfoVo) {
		
		
		return user_InfoDao.idCheck(user_InfoVo);
	}

	@Override
	public int joinInsert(User_InfoVo user_InfoVo) {
		// TODO Auto-generated method stub
		return user_InfoDao.joinInsert(user_InfoVo);
	}

	@Override
	public int idPwCheck(User_InfoVo user_InfoVo) {
		// TODO Auto-generated method stub
		return user_InfoDao.idPwCheck(user_InfoVo);
	}

	@Override
	public User_InfoVo selectName(User_InfoVo user_InfoVo) {
		// TODO Auto-generated method stub
		return user_InfoDao.selectName(user_InfoVo);
	}

	
}
