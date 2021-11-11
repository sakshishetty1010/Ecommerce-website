package com.learn.mycart.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.learn.mycart.entities.Category;

public class CategoryDao {

	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public int saveCategory(Category cat) {	
		Session session = this.factory.openSession();
		Transaction tx = (Transaction) session.beginTransaction();
		Serializable catId = session.save(cat);
		try {
			tx.commit();
		}
		catch(Exception e){ 
			e.printStackTrace();
		}
		session.close();
		return (Integer)catId; 
				
	}
	
	public <R> List<Category> getCategories() {
		
		Session s = this.factory.openSession();
		Query<R> query = s.createQuery("from Category");
		List<Category> list = (List<Category>) query.list();
		return list;
		
		
	}
	
	public Category getCategoryById(int cid) {
		
		Category cat = null;
		
		try {
			Session session = this.factory.openSession();
			cat = session.get(Category.class,cid);
			session.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return cat;
		
	}
	
}
