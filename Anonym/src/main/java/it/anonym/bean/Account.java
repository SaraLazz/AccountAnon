package it.anonym.bean;

public class Account implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;

	public Account(){

	}

	public Account(String username,String password){
		this.username=username;
		this.password=password;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Username:" + username + "\nPassword: " + password;
	}
	
}
