package com.base;

public class User {

	int id = 0;
	String username="";
	String password = "";
	String cdid = "";
	int ygid = 0;
	public String getCdid() {
		return cdid;
	}
	public void setCdid(String cdid) {
		this.cdid = cdid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public int getYgid() {
		return ygid;
	}
	public void setYgid(int ygid) {
		this.ygid = ygid;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
}
