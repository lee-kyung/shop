package kr.co.shop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.shop.vo.CounselVO;
import kr.co.shop.vo.MemberVO;

public interface MemberService {

	public String memberinput_ok(MemberVO mvo);

	public void check_userid(HttpServletRequest request,PrintWriter out);

	public String cwrite_ok(CounselVO cvo, HttpSession session);

	public String clist(HttpSession session, Model model);

	public String ccontent(HttpServletRequest request, Model model);

	public String cdelete(HttpServletRequest request);

	public String cupdate(HttpServletRequest request, Model model);

	public String cupdate_ok(CounselVO cvo);

}
