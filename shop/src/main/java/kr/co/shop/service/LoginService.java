package kr.co.shop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.shop.vo.MemberVO;

public interface LoginService {

	public String login_ok(MemberVO mvo, HttpSession session);

	public void userid_search_ok(MemberVO mvo, PrintWriter out);

	public void pwd_search_ok(MemberVO mvo, PrintWriter out);

	public String logout(HttpSession session);
}

