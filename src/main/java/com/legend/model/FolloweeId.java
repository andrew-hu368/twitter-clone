package com.legend.model;

import java.io.Serializable;

import javax.persistence.Embeddable;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Embeddable
public class FolloweeId implements Serializable {

	private static final long serialVersionUID = 1L;
	private String followeeId;
	private String username;
	
	public FolloweeId() {
		super();
	}
	@JsonSerialize
	public String getFolloweeId() {
		return followeeId;
	}
	public void setFolloweeId(String followeeId) {
		this.followeeId = followeeId;
	}
	@JsonSerialize
	public String getUserId() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	@Override
	public String toString() {
		return "FolloweeId [followeeId=" + followeeId + ", username=" + username + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((followeeId == null) ? 0 : followeeId.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FolloweeId other = (FolloweeId) obj;
		if (followeeId == null) {
			if (other.followeeId != null)
				return false;
		} else if (!followeeId.equals(other.followeeId))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}
}
