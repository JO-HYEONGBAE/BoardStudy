package com.spring.com_code.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.com_code.dao.Com_CodeDao;
import com.spring.com_code.vo.Com_CodeVo;

@Repository
public class Com_CodeDaoImpl implements Com_CodeDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Com_CodeVo> selectType() {
		
		List<Com_CodeVo> type=sqlSession.selectList("board.selectType");
		return type;
	}

	
}
