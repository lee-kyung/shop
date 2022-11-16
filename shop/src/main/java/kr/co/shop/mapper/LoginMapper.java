package kr.co.shop.mapper;

import kr.co.shop.vo.MemberVO;

public interface LoginMapper {

	public MemberVO login_ok(MemberVO mvo);

	public String userid_search_ok(MemberVO mvo);

	public String pwd_search_ok(MemberVO mvo);
}
