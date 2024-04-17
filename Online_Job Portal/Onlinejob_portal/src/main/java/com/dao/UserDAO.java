package com.dao;
import com.Entity.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDAO<PreparedStatment> {
	
	  private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	  
public boolean addUser(User u)	
{
	boolean f=false;
	try {
		
		String sql="INSERT INTO user (name, qualification, email, passward, role) VALUES (?, ?, ?, ?, ?)";
        // Create a PreparedStatement
        PreparedStatement stmt = conn.prepareStatement(sql);
        // Set parameters for the PreparedStatement
     
        stmt.setString(1, u.getName());
        stmt.setString(2, u.getQualification());
        stmt.setString(3, u.getEmail());
        stmt.setString(4, u.getPassward());;
        stmt.setString(5, u.getRole());
  
        // Execute the query
        int i = stmt.executeUpdate();
        // Check if any rows were affected
        if (i == 1) {
            return true; // Job added successfully
        }
		
	}catch(Exception e)
	{
		
		e.printStackTrace();
	}
	return f;
	
}


public User login(String em,String psw)
{
	User u=null;
	
	try {
		String sql="select * from user where email=? and passward=? ";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,em);
		ps.setString(2,psw);
		 ResultSet rs =ps.executeQuery();
		 while(rs.next())
		 {
			 u= new User();
			 u.setId(rs.getInt(1));
			 u.setName(rs.getString(2));
			 u.setQualification(rs.getString(3));
			 u.setEmail(rs.getString(4));
			 u.setPassward(rs.getString(5));
			 u.setRole(rs.getString(6));		 
		 }
	}catch(Exception e)
	{
		e.printStackTrace();
		
	}
	return u;
	

}
}
