package com.spring.com_code.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.com_code.dao.Com_CodeDao;
import com.spring.com_code.service.com_CodeService;
import com.spring.com_code.vo.Com_CodeVo;

@Service
public class com_CodeServiceImpl implements com_CodeService {

	@Autowired
	Com_CodeDao com_CodeDao;
	
	@Override
	public List<Com_CodeVo> selectType() {
		
		List<Com_CodeVo> type= com_CodeDao.selectType();
		
		return type;
	}

}
