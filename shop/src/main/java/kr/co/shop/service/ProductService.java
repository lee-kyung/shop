package kr.co.shop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.shop.vo.BaesongVO;
import kr.co.shop.vo.GumaeVO;
import kr.co.shop.vo.ProductVO;
import kr.co.shop.vo.QuestionVO;

public interface ProductService {

	//view를 리턴해줘야하기때문에 string 사용
	
	public String pro_write(Model model);

	public void getjung(HttpServletRequest request, PrintWriter out);

	public void getso(HttpServletRequest request, PrintWriter out);

	public void getbunho(HttpServletRequest request, PrintWriter out);

	public String product_ok(HttpServletRequest request);

	public String pro_list(HttpServletRequest request, Model model);

	public String pro_content(HttpSession session, HttpServletRequest request, Model model);

	public void wish_add(HttpSession session, HttpServletRequest request, PrintWriter out);

	public void cart_add(HttpSession session, HttpServletRequest request, PrintWriter out);

	public String pro_gumae(HttpServletRequest request, Model model, HttpSession session);

	public void bae_chuga(HttpSession session, PrintWriter out);

	public String baesong_list(HttpSession session, Model model);

	public String juso_add_ok(BaesongVO bvo,HttpSession session);

	public String baesong_edit(Model model,HttpServletRequest request);

	public String baesong_edit_ok(BaesongVO bvo);

	public String pro_gumae_ok(GumaeVO gvo, HttpSession session);

	public String product_view(HttpServletRequest request, Model model);

	public String wish_cancel(HttpServletRequest request,HttpSession session);

	public String qwrite_ok(QuestionVO qvo, HttpSession session);

}
