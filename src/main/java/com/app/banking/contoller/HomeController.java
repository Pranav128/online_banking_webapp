package com.app.banking.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String getHomePage()
	{
		return "index";
	}
	
	@RequestMapping("/gethelp")
	public String getHelpPage()
	{
		return "gethelp";
	}
	
	@GetMapping("/aboutus")
	public String getAboutPage()
	{
		return "aboutus";
	}
	
}
