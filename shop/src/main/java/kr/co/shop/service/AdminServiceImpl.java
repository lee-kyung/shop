package kr.co.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.mapper.AdminMapper;
import kr.co.shop.vo.ProductVO;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper mapper;
	
	@Override
	public String index(Model model) 
	{
		ArrayList<ProductVO> list=mapper.pro_list();

		model.addAttribute("list", list);
		
		ArrayList<ProductVO> list2=mapper.pro_list2();

		model.addAttribute("list2", list2);
		
		return "/main/index";
	}

}
