package com.spring.user.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.user.dao.User_InfoDao;
import com.spring.user.vo.User_InfoVo;

@Repository
public class User_InfoDaoImpl implements User_InfoDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int idCheck(User_InfoVo user_InfoVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.idCheck", user_InfoVo);
	}

	@Override
	public int joinInsert(User_InfoVo user_InfoVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("user.joinInsert", user_InfoVo);
	}

	@Override
	public int idPwCheck(User_InfoVo user_InfoVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.idPwCheck", user_InfoVo);
	}

	@Override
	public User_InfoVo selectName(User_InfoVo user_InfoVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.selectName",user_InfoVo);
	}
}
