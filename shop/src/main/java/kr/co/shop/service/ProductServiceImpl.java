package kr.co.shop.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.shop.mapper.ProductMapper;
import kr.co.shop.vo.BaesongVO;
import kr.co.shop.vo.DaeVO;
import kr.co.shop.vo.GumaeVO;
import kr.co.shop.vo.JungVO;
import kr.co.shop.vo.MemberVO;
import kr.co.shop.vo.ProductVO;
import kr.co.shop.vo.ProductViewVO;
import kr.co.shop.vo.QuestionVO;
import kr.co.shop.vo.ReviewVO;
import kr.co.shop.vo.SoVO;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductMapper mapper;

	@Override
	public String pro_write(Model model) 
	{
		// dae 테이블을 읽어와서 view에 전달 
		ArrayList<DaeVO> list=mapper.pro_write();
		model.addAttribute("list", list);
		
		return "/product/pro_write";
	}
	
	@Override
	public void getjung(HttpServletRequest request, PrintWriter out)
	{
		String daecode=request.getParameter("daecode");
		
		// 매개변수 사용 : 넘어오는 대분류코드값을 넘겨줘야 한다.
		ArrayList<JungVO> list=mapper.getjung(daecode);
		
		// option태그를 생성해서 전달
		String str=""; // 비어있는 값이 하나 필요
		
		// for문을 통해서 str에 option태그를 주도록하자
		// Arraylist => list.get(0) 부터 값을 가져온다. (0부터 시작) 
		for(int i=0; i<list.size(); i++)
		{			// arraylist의 길이 :size() // 배열의 길이 :length()
			JungVO jvo=list.get(i);
			str=str+"<option value='"+jvo.getCode()+"'>"+URLEncoder.encode(jvo.getTitle())+ "</option>";
				// <option value='01'> 야채류 </option>
				// 한글이 깨져서 인코터사용
		}
		// pro_write.jsp의 responsetext로 값이 날라간다. 
		out.print(str);
	}

/*	@Override
	public void getjung(HttpServletRequest request, PrintWriter out) 
	{
		String daecode=request.getParameter("daecode");
		
		// 매개변수 사용 : 넘어오는 대분류코드값을 넘겨줘야 한다.
		ArrayList<JungVO> list=mapper.getjung(daecode);
		
		// option태그를 생성해서 전달
		String str=""; // 비어있는 값이 하나 필요
		
		// for문을 통해서 str에 option태그를 주도록하자
		// Arraylist => list.get(0) 부터 값을 가져온다. (0부터 시작) 
		for(int i=0; i<list.size(); i++)
		{			// arraylist의 길이 :size() // 배열의 길이 :length()
			JungVO jvo=list.get(i);
			str=str+"<option value='"+jvo.getCode()+"'>"+URLEncoder.encode(jvo.getTitle())+ "</option>";
				// <option value='01'> 야채류 </option>
				// 한글이 깨져서 인코터사용
		}
		// pro_write.jsp의 responsetext로 값이 날라간다. 
		out.print(str);
	}
*/
	@Override
	public void getso(HttpServletRequest request, PrintWriter out) 
	{
		String daejung=request.getParameter("daejung");
		
		ArrayList<SoVO> list=mapper.getso(daejung);
		
		String str="";
		
		for(int i=0; i<list.size(); i++)
		{
			SoVO svo=list.get(i);
			str=str+"<option value='"+svo.getCode()+"'>"+URLEncoder.encode(svo.getTitle())+ "</option>";
		}
		
		out.print(str);
	}

	@Override
	public void getbunho(HttpServletRequest request, PrintWriter out) 
	{
		String code=request.getParameter("code");
		Integer bunho=mapper.getbunho(code);
		out.print(bunho);
	}

	@Override
	public String product_ok(HttpServletRequest request) 
	{
		// 라이브러리를 이용하여 폼태그의 값을 가져오기
		String path=request.getRealPath("resources/img");
		// C:\\spring\\shop\\src\\main\\webapp\\resources\\img
		int size=1024*1024*20;
		ProductVO pvo=new ProductVO();
		try
		{
			MultipartRequest multi=new MultipartRequest(request, path,size, "utf-8", new DefaultFileRenamePolicy());
		
		
			// 폼 값 가져오기 => productvo에 담기
		
			/*String pcode=multi.getParameter("pcode");
			pvo.setPcode(pcode);
			=>pvo.setPcode(multi.getParameter("pcode"));*/	
		
			pvo.setPcode(multi.getParameter("pcode"));
			pvo.setPimg(multi.getFilesystemName("pimg"));
			pvo.setCimg(multi.getFilesystemName("cimg"));
			pvo.setTitle(multi.getParameter("title"));
			pvo.setPrice(Integer.parseInt(multi.getParameter("price")));
			pvo.setMade(multi.getParameter("made"));
			pvo.setHalin(Integer.parseInt(multi.getParameter("halin")));
			pvo.setJuk(Integer.parseInt(multi.getParameter("juk")));
			pvo.setSu(Integer.parseInt(multi.getParameter("su")));
			pvo.setBaesong(Integer.parseInt(multi.getParameter("baesong")));
			pvo.setBaeday(Integer.parseInt(multi.getParameter("baeday")));
		}
		catch(Exception e)
		{
			// return "redirect:error";
		}
		
		// 그림을 업로드하기위해 cos.jar파일 생성
		
		mapper.product_ok(pvo);
		return "/product/pro_list";
	}

	@Override
	public String pro_list(HttpServletRequest request, Model model) 
	{
		// 필요한 상품 리스트를 db로 부터 가져와서 view에 전달
		String pcode=request.getParameter("pcode");
		
		ArrayList<ProductVO> list=mapper.pro_list(pcode);
		
/*	쿼리문을 사용하지 않고 배송일을 구하는 방법		
  	(select * from product where pcode like concat(#{param1}, '%') limit 30)
 		for(int i=0; i<list.size(); i++)
		{
			int n=list.get(i).getBaeday();
			LocalDate today=LocalDate.now();
			LocalDate dday=today.plusDays(n);
			list.get(i).setBaeday2=dday.toString();
		}
*/		
		
		model.addAttribute("list", list);
		
		return "/product/pro_list";
	}

	@Override
	public String pro_content(HttpSession session, HttpServletRequest request, Model model) 
	{
		// 하나의 레코드를 읽어와서 model에 전달 view를 리턴
		String pcode=request.getParameter("pcode");
		ProductVO pvo=mapper.pro_content(pcode);
		model.addAttribute("pvo", pvo);
		
		// 현재상품의 review를 전부 읽어오기 0908
		ArrayList<ReviewVO> rlist=mapper.getReview(pcode);
		for(int i=0; i<rlist.size(); i++)
		{
			rlist.get(i).setContent(rlist.get(i).getContent().replace("\r\n", "<br>"));
			
			// 아이디4자+****
			// String imsi=rlist.get(i).getUserid().substring(0,4)+"****";
			// rlist.get(i).setUserid(imsi);
		}
		model.addAttribute("rlist", rlist);
		
		// 총별점 따로 전달 
		if(rlist.size()!=0)
		{
			model.addAttribute("chong_star", rlist.get(0).getAvg());			
		}
		
		
		
		// 현재 사용자의 wish 테이블에 상품이 저장되어 있는지 확인해서 view 에 전달  (0906)
		// 1. 로그인되지 않았다면 wish버튼 보이기
		int wishcnt;
		if(session.getAttribute("userid")==null)
		{
			wishcnt=0;
		}
		
		else // 테이블에서 확인 (존재여부 : 위의 if문에서는 userid가 null이기때문에 테이블에서 확인할 이유가 없으므로 else에서 확인)
		{
			String userid=session.getAttribute("userid").toString();
			int num=mapper.checkwish(userid,pcode);
			
			
			if(num==0) // 2. 로그인 된 경우 wish테이블이 비워져있다면 wish버튼 보이기
			{
				wishcnt=0;
			}
			else	// 3. 로그인 된 경우 wish테이블이 있다면 wish버튼 숨기기
			{
				
				wishcnt=1;
			}
		}
		
		model.addAttribute("wishcnt", wishcnt);
		
		// 상품 문의를 읽어서 전달 09014
		ArrayList<QuestionVO> qlist=mapper.getQuestion(pcode);
		
		// content에 br붙이기<엔터>
		for(int i=0; i<qlist.size(); i++)
		{
			qlist.get(i).setContent(qlist.get(i).getContent().replace("\r\n", "<br>"));
		}
		model.addAttribute("qlist", qlist);
		
		return "/product/pro_content";
	}

	@Override
	public void wish_add(HttpSession session, HttpServletRequest request, PrintWriter out) 
	{
		String userid=session.getAttribute("userid").toString();
		String pcode=request.getParameter("pcode");
		
		// 아이디, pcode를 넘겨서 레코드가 존재하는지 체크
		// 있다면 아래의 내용을 실행 x
		mapper.wish_add(userid, pcode);
		
		// 0이 가면 정상 
		out.print("0");
	}

	@Override
	public void cart_add(HttpSession session, HttpServletRequest request, PrintWriter out) 
	{
		String userid=session.getAttribute("userid").toString();
		String pcode=request.getParameter("pcode");
		String su=request.getParameter("su");
		
		mapper.cart_add(userid,pcode,su);
		
		// 0이 전송되면 정상
		out.print("0");	
	}

	@Override
	public String pro_gumae(HttpServletRequest request, Model model,HttpSession session) 
	{
		//1. 해당 상품의 정보를 뷰에 전달
		String[] pcode=request.getParameter("pcode").split(",");
		String[] su=request.getParameter("su").split(",");
		String gchk=request.getParameter("gchk");			//		0907
		//상품이 하나라면 String pcode=request.getParameter("pcode") 상관없지만
		//여러개일수도 있으니(장바구니) String[] pcode=request.getParameter("pcode").split(","); 사용
		
		//0906
		ArrayList<ProductVO> list=new ArrayList<ProductVO>();
		for(int i=0; i<pcode.length; i++)
		{
			// db에서 상품 정보 가져오기(상품정보만 가져오기 때문에 pcode만 필요)
			ProductVO pvo=mapper.pro_gumae(pcode[i]);			
										// pcode i번째 값
			// 재고 수량에서 사용자 구매 수량으로 ????
			pvo.setSu(Integer.parseInt(su[i]));
			
			list.add(pvo);
		}
		
		// view에 보내기
		model.addAttribute("gchk", gchk); // wish는 1, cart는 2		0907
		model.addAttribute("list", list);
		//model.addAttribute("su", su);
		
		//2. 회원정보
		String userid=session.getAttribute("userid").toString();
		MemberVO mvo=mapper.getmember(userid);
		
		model.addAttribute("mvo", mvo);
		
		//3. 배송지정보
		BaesongVO bvo=mapper.getbaesong(userid);
		model.addAttribute("bvo", bvo);
		
		return "/product/pro_gumae";
	}

	// 배송지 테이블에 정보가 없을 때 한 번 사용
	@Override
	public void bae_chuga(HttpSession session, PrintWriter out)
	{
		// member테이블에서 필요한 정보를 읽어온다(baesong테이블에 전달하기 위해)
		String userid=session.getAttribute("userid").toString();
		MemberVO mvo=mapper.getmember(userid);
		
		// member테이블의 주소를 baesong테이블에 전달하고
		mapper.bae_chuga(mvo);
		
		// out을 통해 주소를 view에도 전달(보낼항목 3가지 :받는사람 배송주소 연락처) 
		// =out으로 보낼때는 vo사용 못함.하나가 아닌 여러개일 경우는 구분해서 보내준다.
		String str="";
		// 홍길동 , 고양시 어쩌고 저쪼고, 010-555-555 
		str=URLEncoder.encode(mvo.getName())+",";
		str=str+URLEncoder.encode(mvo.getJuso())+" "+URLEncoder.encode(mvo.getJuso_etc())+",";
	    str=str+mvo.getPhone();
		
	    // 주소 부분의 빈칸이 +로 나타나기 때문에 +를 빈칸으로 바꾸기
	    str=str.replace("+", " ");
	    
	    out.print(str);
	}

	@Override
	public String baesong_list(HttpSession session, Model model) 
	{
		// 배송테이블에서 해당 사용자의 주소를 전부 가져와서 view에 전달
		String userid=session.getAttribute("userid").toString();
		ArrayList<BaesongVO> list=mapper.baesong_list(userid);
		model.addAttribute("list", list);
		
		return "/product/baesong_list";
	}
	
	@Override
	public String juso_add_ok(BaesongVO bvo,HttpSession session) 
	{
		bvo.setUserid(session.getAttribute("userid").toString());
		mapper.juso_add_ok(bvo);
		return "redirect:/product/baesong_list";
	}

	@Override
	public String baesong_edit(Model model,HttpServletRequest request) 
	{
		String id=request.getParameter("id");
		BaesongVO bvo=mapper.baesong_edit(id);
		model.addAttribute("bvo", bvo);
		return "/product/baesong_edit";
	}

	@Override
	public String baesong_edit_ok(BaesongVO bvo) 
	{
		mapper.baesong_edit_ok(bvo);
		
		return "redirect:/product/baesong_list";
	}

	@Override
	public String pro_gumae_ok(GumaeVO gvo, HttpSession session) 
	{
		String userid=session.getAttribute("userid").toString();
		gvo.setUserid(userid);
		
		// 주문번호 생성 => 아이디 + 4자리
		// 가장 높은 주문 번호 가져오기 
		Integer number=mapper.getjumun(userid);
		// 길이를 구하는 문자가 필요한 경우 integer사용
		number++;	// 0을 추가해서 4자리를 사용 (1 -> 0001)
		
		// 문자열 형태로 만듦
		String num=number.toString();
		
		// 문자열로 만든 후 길이를 구함
		if(num.length()==1)
			num="000"+num;
			
		else if(num.length()==2)
			num="00"+num;
		
		else if(num.length()==3)
			num="0"+num;
		
		String jumuncode=userid+num;
		
		// gvo에 jumuncode넣기??
		gvo.setJumuncode(jumuncode);
		
		// pcode, su, chong 금액을 배열로 저장 0906 .. 배열의 크기가 상품의 개수
		String[] pcode=gvo.getPcode().split(",");
		String[] su=gvo.getSu_imsi().split(",");
		String[] chong=gvo.getChong_imsi().split(",");
				
		// 위의 배열에 있는 값을 gvo의 pcode, su, chong setter해주기 (하나의 값만 넘어가도록)
		for(int i=0; i<pcode.length; i++)
		{
			gvo.setPcode(pcode[i]);
			gvo.setSu(Integer.parseInt(su[i]));
			gvo.setChong(Integer.parseInt(chong[i]));
			
			mapper.pro_gumae_ok(gvo);
			
			if(gvo.getGchk()==2)
			{
				// cart테이블에서 삭제 0907 (구매하기 클릭했을때 장바구니에서 삭제)
				mapper.cart_del(pcode[i], userid);				
			}
			else if(gvo.getGchk()==1)
			{
				// wish테이블에서 삭제 0907
				mapper.wish_cancel(pcode[i], userid);
			}
		}
		return "redirect:/product/product_view?jumuncode="+jumuncode;
	}

	@Override
	public String product_view(HttpServletRequest request, Model model) 
	{
		
		String jumuncode=request.getParameter("jumuncode");
		
		ArrayList<ProductViewVO> list=mapper.product_view(jumuncode);

		// 구매 정보를 view에 전달 
		model.addAttribute("list", list);
		return "/product/product_view";
	}

	@Override
	public String wish_cancel(HttpServletRequest request,HttpSession session) 
	{
		String userid=session.getAttribute("userid").toString();
		String pcode=request.getParameter("pcode");
		mapper.wish_cancel(pcode, userid);
		
		return "redirect:/product/pro_content?pcode="+pcode;
	}

	@Override
	public String qwrite_ok(QuestionVO qvo, HttpSession session) 
	{
		// 처음 questionvo의 email은 null값이기 때문에 session에서 email을 가져와야한다.
		String userid=session.getAttribute("userid").toString();
		String email=mapper.getEmail(userid);
		//qvo에 가져온 email값을 넣어주기
		qvo.setEmail(email);
		
		// qrp도 구해오기
		int grp=mapper.getGrp();
		
		grp++;	// grp 값을 1씩 증가해서 저장
		qvo.setGrp(grp);
		
		// question테이블에 저장하기
		mapper.qwrite_ok(qvo);
		
		return "redirect:/product/pro_content?pcode="+qvo.getPcode();
	}

	
}
