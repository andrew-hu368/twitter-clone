package com.legend.dao;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import org.springframework.stereotype.Repository;

import com.legend.model.Followee;

@Repository
public class FolloweeDao {

	@Resource(name = "emf")
	private EntityManagerFactory emf;
	
	public void persistFollowee(Followee followee) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(followee);
		et.commit();
		em.close();
	}
}
