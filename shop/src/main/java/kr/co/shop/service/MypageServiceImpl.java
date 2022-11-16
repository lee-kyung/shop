package kr.co.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.mapper.MypageMapper;
import kr.co.shop.vo.CartVO;
import kr.co.shop.vo.GumaeVO;
import kr.co.shop.vo.MemberVO;
import kr.co.shop.vo.ReviewVO;
import kr.co.shop.vo.WishVO;

@Service
@Qualifier("ms2")
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageMapper mapper;
	
	@Override
	public String myinfo(HttpSession session, Model model) 
	{
		String userid=session.getAttribute("userid").toString();
		MemberVO mvo=mapper.myinfo(userid);
		model.addAttribute("mvo", mvo);
		return "/mypage/myinfo";
	}

	@Override
	public String myinfo_edit(HttpSession session, Model model) 
	{
		String userid=session.getAttribute("userid").toString();
		MemberVO mvo=mapper.myinfo(userid);
		model.addAttribute("mvo", mvo);
		
		return "/mypage/myinfo_edit";
	}

	@Override
	public String myinfo_edit_ok(MemberVO mvo, HttpSession session) 
	{
		String userid=session.getAttribute("userid").toString();
		mvo.setUserid(userid);
		mapper.myinfo_edit_ok(mvo);
		
		return "redirect:/mypage/myinfo";
	}

	@Override
	public String change_pwd(HttpSession session, HttpServletRequest request) 
	{
		// 기존 비밀번호
		String prepwd=request.getParameter("prepwd");
		
		
		// db 비밀번호
		String userid=session.getAttribute("userid").toString();
		String dbpwd=mapper.getPwd(userid);
		
		// 새로운 비밀먼호
		String pwd=request.getParameter("pwd");
		
		if(dbpwd.equals(prepwd))
		{
			mapper.change_pwd(pwd,userid);
			session.invalidate();
			
			return "redirect:/main/index";
		}
		else
			return "redirect:/mypage/myinfo";
	}

	@Override
	public String wish(HttpSession session, Model model) 
	{
		String userid=session.getAttribute("userid").toString();
		ArrayList<WishVO> list=mapper.wish(userid);
		model.addAttribute("list", list);
		return "/mypage/wish";
	}

	@Override
	public String wish_del(HttpServletRequest request) 
	{
		String id=request.getParameter("id");
		mapper.wish_del(id);
		return "redirect:/mypage/wish";
	}
	
	@Override
	public String select_del(HttpServletRequest request) 
	{
		// 삭제할 id값을 분리
		String[] id=request.getParameter("delid").split(",");
		
		// 삭제하기(여러개 삭제할 수 있으니 for문사용)
		for(int i=0;i<id.length;i++)
		{
			mapper.wish_del(id[i]);	// i번째의 id
		}
		
		return "redirect:/mypage/wish";
	}

	@Override
	public String move_cart(HttpServletRequest request, HttpSession session)
	{
		
		String[] pcode=request.getParameter("pcode").split(",");
		String userid=session.getAttribute("userid").toString();
		for(int i=0; i<pcode.length; i++)
		{
			//cart 테이블에 저장
			mapper.move_cart(userid, pcode[i]);
			
			//wish테이블에서 삭제 
			mapper.wish_del2(userid, pcode[i]);
		}
		
		return "redirect:/mypage/cart";
	}

	@Override
	public String cart(HttpSession session, Model model) 
	{
		String userid=session.getAttribute("userid").toString();
		ArrayList<CartVO> list=mapper.cart(userid);
		
		
		// 0906
		String str="";
		for(int i=0; i<list.size(); i++)
		{
			str=str+list.get(i).getPrice()+",";
			
			// list.get(0) 은 list의 첫번째꺼
			// getprice는 vo에서 price 필드의 값을 가져오기 
		}
		model.addAttribute("str", str);			// str의 모양은 ex) 10000,20000,44444,43444, 
		
		model.addAttribute("list", list);
		
		return "/mypage/cart";
	}
	
	@Override
	public String cart_del(HttpServletRequest request, HttpSession session) 
	{
		String id=request.getParameter("id");
		String userid=session.getAttribute("userid").toString();
		mapper.cart_del(id, userid);
		return "redirect:/mypage/cart";
	}
	
	@Override
	public String cart_select_del(HttpServletRequest request, HttpSession session) 
	{
		String[] id=request.getParameter("delid").split(",");
		String userid=session.getAttribute("userid").toString();
		for(int i=0;i<id.length;i++)
		{
			mapper.cart_del(id[i], userid);
		}
		return "redirect:/mypage/cart";
	}

	@Override
	public String myjumun(HttpSession session, Model model) 
	{
		// 로그인한 사용자의 아이디로 gumae테이블을 검색해서 가져오기
		String userid=session.getAttribute("userid").toString();
		ArrayList<GumaeVO> list=mapper.myjumun(userid);
		model.addAttribute("list", list);
		
		
		return "/mypage/myjumun";
	}

	@Override
	public String change_state(HttpServletRequest request) 
	{
		String id=request.getParameter("id");
		String state=request.getParameter("state");
		mapper.change_state(id, state);
		return "redirect:/mypage/myjumun";
	}

	
	//myjumun에서 review문서로 pcode와 gid 전달하기 . 
	@Override
	public String review(HttpServletRequest request, Model model) 
	{
		String pcode=request.getParameter("pcode");
		String gid=request.getParameter("gid");
		model.addAttribute("pcode", pcode);
		model.addAttribute("gid", gid);
		return "/mypage/review";
	}

	@Override
	public String review_ok(ReviewVO rvo, HttpSession session) 
	{
		//rvo에 userid저장(+hidden으로 넘겨서 pcode, gid저장)
		rvo.setUserid(session.getAttribute("userid").toString());
		mapper.review_ok(rvo);
		
		// 후기가 작성되면 gumae테이블의 hugi필드를 1로 변경 
		mapper.gumae_hugi(rvo.getGid());
		
		return "redirect:/mypage/myreview";
	}

	@Override
	public String myreview(HttpSession session, Model model) 
	{
		String userid=session.getAttribute("userid").toString();
		ArrayList<ReviewVO> rlist=mapper.myreview(userid);
		model.addAttribute("rlist", rlist);
		return "/mypage/myreview";
	}

	@Override
	public String review_del(HttpServletRequest request) 
	{
		String id=request.getParameter("id");
		String gid=request.getParameter("gid");
		//삭제
		mapper.review_del(id);
		
		//리뷰가 삭제되면 gumae테이블의 hugi필드를 다시 0으로 변경
		mapper.change_hugi(gid);
		return "redirect:/mypage/myreview";
	}

	@Override
	public String review_update(HttpServletRequest request, Model model) 
	{
		String id=request.getParameter("id");
		ReviewVO rvo=mapper.review_update(id);
		model.addAttribute("rvo", rvo);
		
		return "/mypage/review_update";
	}

	@Override
	public String review_update_ok(ReviewVO rvo) 
	{
		mapper.review_update_ok(rvo);
		return "redirect:/mypage/myreview";
	}

	@Override
	public String member_out(HttpSession session) 
	{
		// 탈퇴신청
		String userid=session.getAttribute("userid").toString();
		mapper.member_out(userid);
		
		// 탈퇴신청 ->로그아웃
		session.invalidate();
		
		// 탈퇴신청 ->로그아웃->메인
		return "redirect:/main/index";
	}
	
	
	

}
