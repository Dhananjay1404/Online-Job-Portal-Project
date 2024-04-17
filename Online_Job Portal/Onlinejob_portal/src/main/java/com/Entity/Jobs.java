package com.Entity;

public class Jobs {
	
	
	private int id;
	private String Title;
	private String description;
	private String Company_name;
	private String location;
	private String category;
	private String satus;
	private String pdate;
	
	
	
	@Override
	public String toString() {
		return "Jobs [id=" + id + ", Title=" + Title + ", description=" + description + ", Company_name=" + Company_name
				+ ", location=" + location + ", category=" + category + ", satus=" + satus + ", pdate=" + pdate
				+ ", getId()=" + getId() + ", getTitle()=" + getTitle() + ", getDescription()=" + getDescription()
				+ ", getCompany_name()=" + getCompany_name() + ", getLocation()=" + getLocation() + ", getCategory()="
				+ getCategory() + ", getSatus()=" + getSatus() + ", getPdate()=" + getPdate() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	public Jobs(String description, String company_name, String location, String category, String satus, String pdate)
	{
		super();
		this.description = description;
		Company_name = company_name;
		this.location = location;
		this.category = category;
		this.satus = satus;
		this.pdate = pdate;
	}
	public Jobs() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCompany_name() {
		return Company_name;
	}
	public void setCompany_name(String company_name) {
		Company_name = company_name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSatus() {
		return satus;
	}
	public void setSatus(String satus) {
		this.satus = satus;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

}
