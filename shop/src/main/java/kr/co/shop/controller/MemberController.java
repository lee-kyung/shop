package kr.co.shop.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.service.AdminService;
import kr.co.shop.service.MemberService;
import kr.co.shop.vo.CounselVO;
import kr.co.shop.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("ms")
	private MemberService service;

	@RequestMapping("/member/memberinput")
	public String memberinput()
	{
		return "/member/memberinput";
	}
	
	@RequestMapping("/member/memberinput_ok")
	public String memberinput_ok(MemberVO mvo)
	{
		return service.memberinput_ok(mvo);
	}
	
	// 아이디 중복확인
	@RequestMapping("/member/check_userid")
	public void check_userid(HttpServletRequest request, PrintWriter out)
	{
		service.check_userid(request, out);
	}
	
	@RequestMapping("/member/cwrite")
	public String cwrite()
	{
		return "/member/cwrite";
	}
	
	@RequestMapping("/member/cwrite_ok")
	public String cwrite_ok(CounselVO cvo, HttpSession session)
	{
		return service.cwrite_ok(cvo, session);
	}
	
	@RequestMapping("/member/clist")
	public String clist(HttpSession session, Model model)
	{
		return service.clist(session, model);
	}
	
	@RequestMapping("/member/ccontent")
	public String ccontent(HttpServletRequest request, Model model)
	{
		return service.ccontent(request, model);
	}
	
	@RequestMapping("/member/cdelete")
	public String cdelete(HttpServletRequest request)
	{
		return service.cdelete(request);
	}
	
	@RequestMapping("/member/cupdate")
	public String cupdate(HttpServletRequest request, Model model)
	{
		return service.cupdate(request, model);
	}
	
	@RequestMapping("/member/cupdate_ok")
	public String cupdate_ok(CounselVO cvo)
	{
		return service.cupdate_ok(cvo);
	}
}
