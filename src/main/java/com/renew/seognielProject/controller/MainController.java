package com.renew.seognielProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
	
	@GetMapping("/seogniel")
	@ResponseBody
	public String index() {
		return "index";
	}
}
