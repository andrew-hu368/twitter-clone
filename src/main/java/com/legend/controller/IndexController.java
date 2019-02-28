package com.legend.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.legend.model.UserProfileDetails;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String displayIndex(HttpSession session) {
		UserProfileDetails activeUser = (UserProfileDetails) session.getAttribute("activeUser");
		if(activeUser != null) {
			session.setAttribute("tweetFeedOffset", 0);
			return "indexLoggedIn";
		}
		return "index";
	}
}
