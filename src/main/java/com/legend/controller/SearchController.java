package com.legend.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.legend.model.UserProfileDetails;
import com.legend.service.UserService;

@Controller
public class SearchController {

	@Resource(name = "userService")
	UserService userService;
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchUsers(@RequestParam(value = "terms", required = false) String terms, Model model, HttpSession session) {
//		if(session.getAttribute("activeUser") != null) {
			model.addAttribute("terms", terms);
			UserProfileDetails user = (UserProfileDetails) session.getAttribute("activeUser");
			model.addAttribute("users", userService.searchUsers(terms, user.getUsername()));
			return "usersResultPage";
//		}
//		return "redirect:index";
	}
}
