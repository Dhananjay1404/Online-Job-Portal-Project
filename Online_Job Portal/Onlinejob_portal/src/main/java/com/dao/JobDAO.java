

package com.dao;
import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.Entity.Jobs;
import java.sql.PreparedStatement;



public class JobDAO {
    private Connection conn;

    public JobDAO(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean addjob(Jobs j){
    	boolean f=false;
        try {
        	
        	String sql="INSERT INTO jobs (Title, description, Company_name, location, category, satus, pdate) VALUES (?, ?, ?, ?, ?, ?, NOW())";
            // Create a PreparedStatement
            PreparedStatement stmt = conn.prepareStatement(sql);
            // Set parameters for the PreparedStatement
         
            stmt.setString(1, j.getTitle());
            stmt.setString(2, j.getDescription());
            stmt.setString(3, j.getCompany_name());
            stmt.setString(4, j.getLocation());
            stmt.setString(5, j.getCategory());
            stmt.setString(6, j.getSatus());
            // Execute the query
            int i = stmt.executeUpdate();
            // Check if any rows were affected
            if (i> 0) {
                return true; // Job added successfully
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print the exception trace for debugging purposes
        }
        return false; // Job addition failed
    }
    
    
    public List<Jobs> getAllJobs(){
        List<Jobs> list = new ArrayList<>();
        Jobs j=null;
        try {
            String sql = "SELECT * FROM jobs ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 j = new Jobs();
                j.setId(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setDescription(rs.getString(3));
                j.setCompany_name(rs.getString(4));
                j.setLocation(rs.getString(5));
                j.setCategory(rs.getString(6));
                j.setSatus(rs.getString(7));
                j.setPdate(rs.getString(8));
                list.add(j);
          
                System.out.println(j.getId());
            }
            ps.close(); // Close PreparedStatement
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
        
    }
    public List<Jobs> getAllJobsForUser(){
        List<Jobs> list = new ArrayList<>();
        Jobs j=null;
        try {
            String sql = "SELECT * FROM jobs where  satus=? order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,"Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 j = new Jobs();
                j.setId(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setDescription(rs.getString(3));
                j.setCompany_name(rs.getString(4));
                j.setLocation(rs.getString(5));
                j.setCategory(rs.getString(6));
                j.setSatus(rs.getString(7));
                j.setPdate(rs.getString(8));
                list.add(j);
          
                System.out.println(j.getId());
            }
            ps.close(); // Close PreparedStatement
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
        
    }
          
    
    
    
    
    
    
    public Jobs getJobById(int id){
    	 Jobs j=null;
        
        try {
            String sql = "SELECT * FROM jobs where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 j = new Jobs();
                j.setId(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setDescription(rs.getString(3));
                j.setCompany_name(rs.getString(4));
                j.setLocation(rs.getString(5));
                j.setCategory(rs.getString(6));
                j.setSatus(rs.getString(7));
                j.setPdate(rs.getString(8)); // Convert timestamp to string
               
         
            }
            ps.close(); // Close PreparedStatement
        } catch (Exception e) {
            e.printStackTrace();
        }
        return j;
    }
      
    
    public boolean updateJob(Jobs j)
    {
    	boolean f=false;
        try {
        	
        	String sql="update jobs set Title=?, description=?, Company_name=?, location=?, category=?, satus=? where id=?";
            // Create a PreparedStatement
            PreparedStatement stmt = conn.prepareStatement(sql);
            // Set parameters for the PreparedStatement
         
            stmt.setString(1, j.getTitle());
            stmt.setString(2, j.getDescription());
            stmt.setString(3, j.getCompany_name());
            stmt.setString(4, j.getLocation());
            stmt.setString(5, j.getCategory());
            stmt.setString(6, j.getSatus());
            stmt.setInt(7,j.getId());
            // Execute the query
            int i = stmt.executeUpdate();
            // Check if any rows were affected
            if (i == 1) {
                return true; // Job added successfully
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print the exception trace for debugging purposes
        }
        return false; // Job addition failed
    }
    
    
    public boolean deleteJobs(int id)
    {
    	boolean f=false;
    	System.out.println("delete"+id);
    	try {
    		
    		String sql="delete  from jobs where id=?";
    		PreparedStatement ps=conn.prepareStatement(sql);
    		ps.setInt(1,id);
    		int i=ps.executeUpdate();
    		 if (i == 1) {
                 return true; // Job added successfully
             }
    		
    	}catch(Exception e)
    	{
    		e.printStackTrace();
    		
    	}
    	
    	return f;
    }
    
    
    public List <Jobs> getJobsORLocationAndCat(String Category,String location)
    {
    
    List <Jobs> list =new ArrayList<Jobs>();
    Jobs j=null;
    
    try {
    	String sql="Select * from jobs where category=? or location=? order by id DESC ";
    	
        // Create a PreparedStatement
        PreparedStatement stmt = conn.prepareStatement(sql);
       stmt.setString(1,Category);
       stmt.setString(2,location);
        ResultSet rs = stmt.executeQuery();
        while (rs.next())
        {
             j = new Jobs();
            j.setId(rs.getInt(1));
            j.setTitle(rs.getString(2));
            j.setDescription(rs.getString(3));
            j.setCompany_name(rs.getString(4));
            j.setLocation(rs.getString(5));
            j.setCategory(rs.getString(6));
            j.setSatus(rs.getString(7));
            j.setPdate(rs.getString(8));
            list.add(j);// Convert timestamp to string   
        }	
    }
    catch(Exception e)
    {
    	
    	e.printStackTrace();
    }
	return list;
    
    }
}