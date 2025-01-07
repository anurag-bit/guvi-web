package com.techno4.viridi.dao;

import com.techno4.viridi.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    public long getUserCount() {
    String query = "Select count(*) from User";
    Session session = this.factory.openSession();
    try {
        Long count = (Long) session.createQuery(query).getSingleResult();
        return count != null ? count : 0;
    } finally {
        session.close();
    }
    }
    
    //get user by email and password
    public User getUserByPhoneAndPassword(String phone,String password)
    {
        User user=null;
        
        try {
            
            String query="from User where userPhone =: e and userPassword=: p";
            Session session = this.factory.openSession();
            Query q = (Query) session.createQuery(query);
            q.setParameter("e", phone);
            q.setParameter("p",password);            
            user=(User) q.uniqueResult();         
            session.close();        
            
        } catch (Exception e) {
            e.printStackTrace();
        }     
        
        
        
        
        return user;
    }
    
    
}
