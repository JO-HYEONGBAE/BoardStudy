package com.spring.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.CookieGenerator;

import com.spring.com_code.service.com_CodeService;
import com.spring.com_code.vo.Com_CodeVo;
import com.spring.user.service.user_InfoService;
import com.spring.user.vo.User_InfoVo;

@Controller
@RequestMapping(value="/user")
public class User_InfoController {

	@Autowired
	user_InfoService user_InfoService;
	
	@Autowired
	com_CodeService com_CodeService;
	
	@RequestMapping(value="/userJoin.do",method=RequestMethod.GET)
	public String userJoin(Model model) throws Exception {
		
		Com_CodeVo cvo = new Com_CodeVo();
		
		cvo.setCodeType("phone");
		
		List<Com_CodeVo> type = com_CodeService.selectType(cvo);
		
		model.addAttribute("type",type);
		
		return "/user/userJoin";
	}
	
	@RequestMapping(value="/idCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public String idCheck(User_InfoVo user_InfoVo) throws Exception {
		int result=0;
		String value="";
		
		result= user_InfoService.idCheck(user_InfoVo);
		
		if(result ==0) 
			value="Y";
		else 
			value="N";
		
		return value;
		
	}
	
	
	@RequestMapping(value="/userJoinAction.do",method=RequestMethod.POST)
	@ResponseBody
	public String joinInset(User_InfoVo user_InfoVo) throws Exception {
		int result=0;
		String value="";
		
		result=user_InfoService.joinInsert(user_InfoVo);
		
		if(result==1) 
			value="Y";
		else 
			value="N";
		
		
		return value;
	}
	
	
	
	@RequestMapping(value="/userLogin.do",method=RequestMethod.GET)
	public String userLogin() throws Exception {
		
		return "/user/userLogin";
	}
	
	@RequestMapping(value="/idPwChk.do",method=RequestMethod.POST)
	@ResponseBody
	public String idPwCheck(User_InfoVo user_InfoVo,HttpServletResponse response) throws Exception{
		
		int result=0;
		String value="";
		
		result= user_InfoService.idPwCheck(user_InfoVo);
		
		if(result ==1) {
			
			value="Y";
			
			User_InfoVo uvo = user_InfoService.selectName(user_InfoVo);
			
			CookieGenerator cg = new CookieGenerator();

			cg.setCookieName("id");
			cg.addCookie(response,uvo.getUserName());

		}
		
		else 
			value="N";
		
		return value;
		
	}
	
	@RequestMapping(value="/Logout.do",method=RequestMethod.GET)
	public String logOut(HttpServletResponse response) throws Exception{
		
		CookieGenerator cg = new CookieGenerator();

		cg.setCookieName("id");
		cg.setCookieMaxAge(0);
		cg.addCookie(response,null);
		
		return "redirect:/board/boardList.do";
		
	}
	
}
