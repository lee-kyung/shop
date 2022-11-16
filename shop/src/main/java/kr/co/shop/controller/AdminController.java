package kr.co.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.shop.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("as")
	private AdminService service;

/*	@RequestMapping("/main/index")
	public String index()
	{
		return "/main/index";
	}*/
	
	@RequestMapping("/main/index")
	public String index(Model model)
	{
		return service.index(model);
	}
	
}
