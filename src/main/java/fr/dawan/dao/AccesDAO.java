package fr.dawan.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class AccesDAO {
	public static EntityManager GetEntityManager() {

		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProjetMenu");
		EntityManager em = emf.createEntityManager();

		return em;
	}
}
