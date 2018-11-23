package fr.dawan.dao;

import java.util.List;

import fr.dawan.beans.DbObject;

public interface DaoInterface<T extends DbObject> {
	
	T createOrUpdate(T item);
	T findById(Class<T> clazz, int id);
	List<T> findAll(Class<T> clazz);
	void delete(Class<T> clazz, int id);
	public List<T> findAllbyId(Class<T> clazz, String classId, int id);
}
