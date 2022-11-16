package kr.co.shop.mapper;

import java.util.ArrayList;

import kr.co.shop.vo.CartVO;
import kr.co.shop.vo.GumaeVO;
import kr.co.shop.vo.MemberVO;
import kr.co.shop.vo.ReviewVO;
import kr.co.shop.vo.WishVO;

public interface MypageMapper {

	MemberVO myinfo(String userid);

	public void myinfo_edit_ok(MemberVO mvo);

	public String getPwd(String userid);

	public void change_pwd(String pwd, String userid);

	public ArrayList<WishVO> wish(String userid);

	public void wish_del(String id);

	public void move_cart(String userid, String string);

	public void wish_del2(String userid, String id);

	public ArrayList<CartVO> cart(String userid);

	public void cart_del(String id, String userid);

	public ArrayList<GumaeVO> myjumun(String userid);

	public void change_state(String id, String state);

	public void review_ok(ReviewVO rvo);

	public void gumae_hugi(int gid);

	public ArrayList<ReviewVO> myreview(String userid);

	public void review_del(String id);

	public void change_hugi(String gid);

	public ReviewVO review_update(String id);

	public void review_update_ok(ReviewVO rvo);

	public void member_out(String userid);

}
