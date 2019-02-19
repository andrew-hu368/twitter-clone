package com.legend.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.legend.model.Followee;
import com.legend.model.FolloweeId;
import com.legend.model.User;
import com.legend.model.UserProfileDetails;
import com.legend.service.FolloweeService;
import com.legend.service.UserService;

@Controller
public class UsersController {

	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "followeeService")
	private FolloweeService followeeService;

	@RequestMapping(value = "/users/signup", method = RequestMethod.GET)
	public String displaySignUpPage(Model model, User user) {
		model.addAttribute("user", user);
		return "signup";
	}

	@RequestMapping(value = "/users", method = RequestMethod.POST)
	public String submitUser(@ModelAttribute("user") User user) {
		userService.persistUser(user);
		return "index";
	}

	@RequestMapping(value = "/users/login", method = RequestMethod.GET)
	public String displayLoginPage() {
		return "login";
	}

	@RequestMapping(value = "/users/login", method = RequestMethod.POST)
	public String loginUser(@RequestParam(value="userCredential") String userCredential, @RequestParam(value="password") String password, HttpSession session, Model model) {
		UserProfileDetails userProfileDetails = userService.loginUser(userCredential, password);
		if (userProfileDetails != null) {
			session.setAttribute("activeUser", userProfileDetails);
			return "redirect:/";
		}

		model.addAttribute("isLoggedIn", false);

		return "login";
	}
	
	@RequestMapping(value = "/users/logout", method = { RequestMethod.GET, RequestMethod.DELETE})
	public String logoutUser(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/users/{username}/settings/", method = RequestMethod.GET)
	public String userSettings() {
		return "forward:/users/{userId}/settings/profile";
	}

	@RequestMapping(value = "/users/{username}/settings/profile", method = RequestMethod.GET)
	public String userSettingsProfile(HttpSession session, Model model) {
		model.addAttribute("user", session.getAttribute("activeUser"));
		return "userSettingsProfile";
	}
	
	@RequestMapping(value = "/users/{username}/settings/password", method = RequestMethod.GET)
	public String userSettingsPassword(HttpSession session, Model model) {
		model.addAttribute("user", session.getAttribute("activeUser"));
		return "userSettingsPassword";
	}
	
	@RequestMapping(value = "/users/{username}/profile", method = {RequestMethod.POST, RequestMethod.PATCH})
	public String updateUserProfile(HttpSession session, @ModelAttribute("user") User user) {
		UserProfileDetails updatedUser = userService.updateUserProfile((UserProfileDetails) session.getAttribute("activeUser"), user);
		session.setAttribute("activeUser", updatedUser);
		return "redirect:/users/{username}/settings/profile";
	}
	
	@RequestMapping(value = "/users/{username}/password", method = {RequestMethod.POST, RequestMethod.PATCH})
	public String updateUserPassword(@RequestParam(value = "oldPassword") String oldPassword, @RequestParam(value = "newPassword") String newPassword, Model model, HttpSession session) {
		UserProfileDetails userProfileDetails = (UserProfileDetails) session.getAttribute("activeUser");
		String username = userProfileDetails.getUsername();
		boolean isPasswordUpdated = userService.updateUserPassword(username, oldPassword, newPassword);
		model.addAttribute("isPasswordUpdated", isPasswordUpdated);
		return "userSettingsPassword";
	}
	
	@RequestMapping(value = "/users/{username}/followees", method = RequestMethod.POST)
	@ResponseBody
	public FolloweeId followUser(@RequestBody FolloweeId followeeId, Followee followee) {
		followee.setFolloweeId(followeeId);
		followeeService.persistFollowee(followee);
		return followeeId;
	}
}
