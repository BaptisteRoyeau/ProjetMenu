package fr.dawan.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import fr.dawan.beans.DbObject;

@Transactional
public class GenericDao<T extends DbObject> implements DaoInterface<T> {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public T createOrUpdate(T item) {
		Session session = sessionFactory.getCurrentSession();
		if((Integer)item.getId() == null) {
			session.persist(item);
			
		}
		else {
			session.merge(item);
		}

		return item;
	}

	@Override
	public T findById(Class<T> clazz, int id) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println("Je suis la et je cherche l'utilisateur avec l'id : " + id);
		T item = (T) session.find( clazz, id );
		System.out.println("Résultat de ma requête : " + item);
		return item;
	}

	@Override
	public List<T> findAll(Class<T> clazz) {
		Session session = sessionFactory.getCurrentSession();
		TypedQuery<T> query = session.createQuery("SELECT entity FROM " + clazz.getName() + " entity", clazz);
		return query.getResultList();
	}
	
	@Override
	public List<T> findAllbyId(Class<T> clazz, String classId, int id) {
		Session session = sessionFactory.getCurrentSession();
		TypedQuery<T> query = session.createQuery("SELECT entity FROM " + clazz.getName() + " entity WHERE " + classId + "=?1", clazz);
		query.setParameter(1, id);
		return query.getResultList();
	}
	
	
	@Override
	public void delete(Class<T> clazz, int id) {
		Session session = sessionFactory.getCurrentSession();
		T item = findById(clazz, id);
		session.remove(item);
	}
	
}
