package com.legend.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.legend.model.UserProfileDetails;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String displayIndex(HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserProfileDetails activeUser = (UserProfileDetails) session.getAttribute("activeUser");
		if(activeUser != null) {
			return "indexLoggedIn";
		}
		return "index";
	}
}
