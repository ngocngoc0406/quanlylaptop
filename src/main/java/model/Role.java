package model;

public class Role {
	private int idRole;
	private String nameRole;

	public int getIdRole() {
		return idRole;
	}
	public void setIdRole(int idRole) {
		this.idRole = idRole;
	}
	public String getNameRole() {
		return nameRole;
	}
	public void setNameRole(String nameRole) {
		this.nameRole = nameRole;
	}
	public Role(int idRole, String nameRole) {
	
		this.idRole = idRole;
		this.nameRole = nameRole;
	}
	public Role(int idRole) {
		
		this.idRole = idRole;
	}
	public Role() {
		
	}
	
	
	
}
