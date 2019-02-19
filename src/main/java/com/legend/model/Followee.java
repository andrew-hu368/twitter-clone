package com.legend.model;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

@Entity
public class Followee {
	@EmbeddedId
	private FolloweeId followeeId;
	
	public Followee() {
		super();
	}

	public FolloweeId getFolloweeId() {
		return followeeId;
	}

	public void setFolloweeId(FolloweeId followeeId) {
		this.followeeId = followeeId;
	}
}
