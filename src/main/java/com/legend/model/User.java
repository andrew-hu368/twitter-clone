package com.legend.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class User {

	@Id
	private String username;
	private String name;
	@Column(nullable = false)
	private String email;
	private String description;
	@Column(nullable = false)
	private String password;
	private String location;
	private String website;
	@Column(nullable = false)
	private Date joinDate;
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "username")
	private List<Followee> followees = new ArrayList<Followee>();
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "followeeId")
	private List<Followee> followers = new ArrayList<Followee>();

	public User() {
		super();
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Followee> getFollowees() {
		return followees;
	}
	public void setFollowees(List<Followee> followees) {
		this.followees = followees;
	}
	public List<Followee> getFollowers() {
		return followers;
	}

	public void setFollowers(List<Followee> followers) {
		this.followers = followers;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", name=" + name + ", email=" + email + ", description=" + description
				+ ", password=" + password + ", location=" + location + ", website=" + website + ", joinDate="
				+ joinDate + "]";
	}
}
