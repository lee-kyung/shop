package kr.co.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.service.AdminService;
import kr.co.shop.service.MypageService;
import kr.co.shop.vo.MemberVO;
import kr.co.shop.vo.ReviewVO;

@Controller
public class MypageController {

	@Autowired
	@Qualifier("ms2")
	private MypageService service;
	
	@RequestMapping("/mypage/myinfo")
	public String myinfo(HttpSession session, Model model)
	{
		return service.myinfo(session,model);
	}
	
	@RequestMapping("/mypage/myinfo_edit")
	public String myinfo_edit(HttpSession session, Model model)
	{
		return service.myinfo_edit(session, model);
	}
	
	@RequestMapping("/mypage/myinfo_edit_ok")
	public String myinfo_edit_ok(MemberVO mvo, HttpSession session)
	{
		return service.myinfo_edit_ok(mvo, session);
	}
	
	@RequestMapping("/mypage/change_pwd")
	public String change_pwd(HttpSession session, HttpServletRequest request)
	{
		return service.change_pwd(session, request);
	}
	
	// wish테이블에서 내가 선택한 정보 가져오기
	@RequestMapping("/mypage/wish")
	public String wish(HttpSession session, Model model)
	{
		return service.wish(session, model);
	}
	
	@RequestMapping("/mypage/wish_del")
	public String wish_del(HttpServletRequest request)
	{
		return service.wish_del(request);
	}
	
	@RequestMapping("/mypage/select_del")
	public String select_del(HttpServletRequest request)
	{
		return service.select_del(request);
	}
	
	@RequestMapping("/mypage/move_cart")
	public String move_cart(HttpServletRequest request, HttpSession session)
	{
		return service.move_cart(request, session);
	}
	
	@RequestMapping("/mypage/cart")
	public String cart(HttpSession session, Model model)
	{
		return service.cart(session, model);
	}
	
	@RequestMapping("/mypage/cart_del")
	public String cart_del(HttpServletRequest request, HttpSession session)
	{
		return service.cart_del(request, session);
	}
	
	@RequestMapping("/mypage/cart_select_del")
	public String cart_select_del(HttpServletRequest request, HttpSession session)
	{
		return service.cart_select_del(request, session);
	}
	
	@RequestMapping("/mypage/myjumun")
	public String myjumun(HttpSession session, Model model)
	{
		return service.myjumun(session, model);
	}
	
	@RequestMapping("/mypage/change_state")
	public String change_state(HttpServletRequest request)
	{
		return service.change_state(request);
	}
	
	@RequestMapping("/mypage/review")
	public String review(HttpServletRequest request, Model model)
	{
		return service.review(request, model);
	}
	
	@RequestMapping("/mypage/review_ok")
	public String review_ok(ReviewVO rvo, HttpSession session)
	{
		return service.review_ok(rvo,session);
	}
	
	@RequestMapping("/mypage/myreview")
	public String myreview(HttpSession session, Model model)
	{
		return service.myreview(session, model);
	}
	
	@RequestMapping("/mypage/review_del")
	public String review_del(HttpServletRequest request)
	{
		return service.review_del(request);
	}
	
	@RequestMapping("/mypage/review_update")
	public String review_update(HttpServletRequest request, Model model)
	{
		return service.review_update(request, model);
	}
	
	@RequestMapping("/mypage/review_update_ok")
	public String review_update_ok(ReviewVO rvo)
	{
		return service.review_update_ok(rvo);
	}
	
	@RequestMapping("/mypage/member_out")
	public String member_out(HttpSession session)
	{
		return service.member_out(session);
	}
}
