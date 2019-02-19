package com.legend.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.legend.dao.UserDao;
import com.legend.model.User;
import com.legend.model.UserProfileDetails;
import com.legend.model.UserProfileDetailsFactory;

@Service
public class UserService {
	
	@Resource(name="userDao")
	private UserDao userDao;
	@Resource(name="userProfileDetailsFactory")
	private UserProfileDetailsFactory userProfileDetailsFactory;
	
	public UserService() {
		super();
	}
	
	public void persistUser(User user) {
		user.setJoinDate(new Date());
		user.setEmail(user.getEmail().toLowerCase());
		userDao.persistUser(user);
	}
	
	public UserProfileDetails loginUser(String userCredential, String password) {
		User user = userDao.loginUser(userCredential, password);
		UserProfileDetails userProfileDetails = null;
		if(user != null) {
			userProfileDetails = userProfileDetailsFactory.getUserProfileDetails();
			userProfileDetails.setUsername(user.getUsername());
			userProfileDetails.setName(user.getName());
			userProfileDetails.setEmail(user.getEmail());
			userProfileDetails.setDescription(user.getDescription());
			userProfileDetails.setLocation(user.getLocation());
			userProfileDetails.setWebsite(user.getWebsite());
		}

		return userProfileDetails;
	}
	
	public UserProfileDetails updateUserProfile(UserProfileDetails activeUser, User user) {
		if(user.getName() != "") {
			activeUser.setName(user.getName());
		}
		
		if(user.getDescription() != "") {
			activeUser.setDescription(user.getDescription());
		}
		
		if(user.getWebsite() != "") {
			activeUser.setWebsite(user.getWebsite());
		}
		
		if(user.getLocation() != "") {
			activeUser.setLocation(user.getLocation());
		}
		
		userDao.updateUserProfile(activeUser);
		
		return activeUser;
	}

	public boolean updateUserPassword(String username, String oldPassword, String newPassword) {
		return userDao.updateUserPassword(username, oldPassword, newPassword);
	}
	
	public List<Object[]> searchUsers(String terms) {
		return userDao.searchUsers(terms);
	}
}
