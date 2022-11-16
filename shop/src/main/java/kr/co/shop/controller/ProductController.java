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
import kr.co.shop.service.ProductService;
import kr.co.shop.vo.BaesongVO;
import kr.co.shop.vo.GumaeVO;
import kr.co.shop.vo.ProductVO;
import kr.co.shop.vo.QuestionVO;

@Controller
public class ProductController {

	@Autowired
	@Qualifier("ps")
	private ProductService service;
	
	@RequestMapping("/product/pro_write")
	public String pro_write(Model model)
	{
		// 대분류의 내용을 db로부터 읽어온다. 
		return service.pro_write(model);
	}
	
	@RequestMapping("/product/getjung")
	public void getjung(HttpServletRequest request, PrintWriter out)
	{											// 자바스크립트에서 사용하기 위해 out필요
		service.getjung(request, out);
		// ajax로 내용을 전달만 하면 되기 때문에 return을 사용하지 않는다. 
	}
	
	@RequestMapping("/product/getso")
	public void getso(HttpServletRequest request, PrintWriter out)
	{
		service.getso(request, out);
	}
	
	@RequestMapping("/product/getbunho")
	public void getbunho(HttpServletRequest request, PrintWriter out)
	{
		service.getbunho(request, out);
	}
	
	@RequestMapping("/product/product_ok")
	public String product_ok(HttpServletRequest request)
	{	// enctype는 vo를 사용할 수 없어서(받을 수 없어서) request를 사용해야한다. 
		return service.product_ok(request);
	}
	
	@RequestMapping("/product/pro_list")
	public String pro_list(HttpServletRequest request, Model model)
	{
		return service.pro_list(request, model);
	}
	
	@RequestMapping("/product/test")
	public String test()
	{
		return "/product/test";
	}
	
	@RequestMapping("/product/pro_content")
	public String pro_content(HttpSession session, HttpServletRequest request, Model model)
	{
		return service.pro_content(session, request, model);
	}
	
	@RequestMapping("/product/wish_add")
	public void wish_add(HttpSession session, HttpServletRequest request, PrintWriter out)
	{																	// out은 필요하진 않지만 제대로 처리가 됐는지 확인하기위해서 작성			
		service.wish_add(session, request, out);
	}
	
	@RequestMapping("/product/cart_add")
	public void cart_add(HttpSession session, HttpServletRequest request, PrintWriter out)
	{																	// out은 필요하진 않지만 제대로 처리가 됐는지 확인하기위해서 작성			
		service.cart_add(session, request, out);
	}
	
	@RequestMapping("/product/pro_gumae")
	public String pro_gumae(HttpServletRequest request, Model model,HttpSession session)
	{
		return service.pro_gumae(request, model, session);
	}
	
	@RequestMapping("/product/bae_chuga")
	public void bae_chuga(HttpSession session, PrintWriter out)
	{
		service.bae_chuga(session,out);
	}
	
	@RequestMapping("/product/baesong_list")
	public String baesong_list(HttpSession session, Model model)
	{
		return service.baesong_list(session, model);
	}
	
	@RequestMapping("/product/juso_add")
	public String juso_add()
	{
		return "/product/juso_add";
	}
	
	@RequestMapping("/product/juso_add_ok")
	public String juso_add_ok(BaesongVO bvo,HttpSession session)
	{
		return service.juso_add_ok(bvo, session);
	}
	
	@RequestMapping("/product/baesong_edit")
	public String baesong_edit_ok(Model model,HttpServletRequest request)
	{
		return service.baesong_edit(model,request);
	}
	
	@RequestMapping("/product/baesong_edit_ok")
	public String baesong_edit_ok(BaesongVO bvo)
	{
		return service.baesong_edit_ok(bvo);
	}
	
	@RequestMapping("/product/pro_gumae_ok")
	public String pro_gumae_ok(GumaeVO gvo, HttpSession session)
	{
		// gumae테이블에 저장을 한 후 
		return service.pro_gumae_ok(gvo, session);
	}
	
	@RequestMapping("/product/product_view")
	public String product_view(HttpServletRequest request, Model model)
	{
		return service.product_view(request, model);
	}
	
	@RequestMapping("/product/wish_cancel")
	public String wish_cancel(HttpServletRequest request, HttpSession session)
	{
		return service.wish_cancel(request, session);
	}
	
	@RequestMapping("/product/qwrite_ok")
	public String qwrite_ok(QuestionVO qvo, HttpSession session)
	{
		return service.qwrite_ok(qvo, session);
	}
	
}

