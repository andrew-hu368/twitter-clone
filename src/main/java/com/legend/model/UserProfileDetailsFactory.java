package com.legend.model;

import org.springframework.stereotype.Component;

@Component
public class UserProfileDetailsFactory {

	public UserProfileDetails getUserProfileDetails() {
		return new UserProfileDetails();
	}
}
