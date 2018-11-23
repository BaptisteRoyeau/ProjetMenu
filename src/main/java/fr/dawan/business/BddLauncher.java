package fr.dawan.business;

import fr.dawan.beans.Utilisateur;
import fr.dawan.dao.GenericDao;

public class BddLauncher {

	public static void main(String[] args) {
		Utilisateur user1 = new Utilisateur();
		user1.setUsername("Baptiste");
		user1.setPassword("dawan");
		
		GenericDao utilisateurDao = new GenericDao();
		utilisateurDao.createOrUpdate(user1);
	}

}
