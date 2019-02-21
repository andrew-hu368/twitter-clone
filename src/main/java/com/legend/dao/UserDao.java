package com.legend.dao;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.legend.model.User;
import com.legend.model.UserProfileDetails;

@Repository
public class UserDao {
	@Resource(name = "emf")
	private EntityManagerFactory emf;

	public UserDao() {
		super();
	}

	public void persistUser(User user) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(user);
		et.commit();
		em.close();
	}

	public User loginUser(String userCredentials, String password) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		User user = em.find(User.class, userCredentials);

		if (user == null) {
			try {
				String findByEmail = "SELECT u FROM User u WHERE u.email = '" + userCredentials.toLowerCase() + "'";
				Query queryFindByEmail = em.createQuery(findByEmail);
				user = (User) queryFindByEmail.getSingleResult();
			} catch (NoResultException e) {
				user = null;
			}
		}

		et.commit();
		em.close();

		if (user != null) {

			if (user.getPassword().equals(password)) {
				return user;
			}

		}

		return null;
	}

	public void updateUserProfile(UserProfileDetails userProfileDetails) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		User user = em.find(User.class, userProfileDetails.getUsername());
		user.setName(userProfileDetails.getName());
		user.setDescription(userProfileDetails.getDescription());
		user.setLocation(userProfileDetails.getLocation());
		user.setWebsite(userProfileDetails.getWebsite());
		em.merge(user);
		et.commit();
		em.close();
	}

	public boolean updateUserPassword(String username, String oldPassword, String newPassword) {
		boolean isPasswordUpdated = false;
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		User user = em.find(User.class, username);
		if (user.getPassword().equals(oldPassword)) {
			user.setPassword(newPassword);
			em.merge(user);
			isPasswordUpdated = true;
		}
		et.commit();
		em.close();
		return isPasswordUpdated;
	}

	public List<Object[]> searchUsers(String terms, String activeUsername) {


		String findUsers = "SELECT matching.u_username, matching.u_name, matching.description, following.f_username "
				+ "FROM "
				+ "(SELECT username AS 'u_username', name AS 'u_name', description " 
				+ "FROM user "
				+ "WHERE username LIKE '%" + terms + "%' "
				+ "OR name LIKE '%" + terms + "%' "
				+ "OR description LIKE '%" + terms + "%') AS matching "
				+ "LEFT OUTER JOIN "
				+ "(SELECT username AS 'f_username', followeeId " 
				+ "FROM followee "
				+ "WHERE username = '" + activeUsername + "') AS following "
				+ "ON matching.u_username = following.followeeId ";
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		Query findUsersQuery = em.createNativeQuery(findUsers);
		@SuppressWarnings("unchecked")
		List<Object[]> usersData = findUsersQuery.getResultList();
		et.commit();
		em.close();
		for (Object[] obj : usersData) {
			System.out.println(Arrays.toString(obj));
		}
		return usersData;
	}
}
