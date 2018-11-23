package fr.dawan.beans;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
public class Utilisateur extends DbObject {
	@OneToMany(mappedBy = "utilisateur")
	private List<CompositionMenu> menus = new ArrayList<CompositionMenu>();

	@OneToMany(mappedBy = "utilisateur")
	private List<AlimentRef> alimentsRef = new ArrayList<AlimentRef>();
	private String username;
	private String firstName;
	private String password;
	private float poids;
	private float taille;
	private String sexe;
	private String email;

	public Utilisateur() {

	}

	public Utilisateur(List<CompositionMenu> menus) {

		this.menus = menus;
	}

	public List<CompositionMenu> getMenus() {
		return menus;
	}

	public void setMenus(List<CompositionMenu> menus) {
		this.menus = menus;
	}

	public String getPassword() {
		return password;
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

	public List<AlimentRef> getAlimentsRef() {
		return alimentsRef;
	}

	public void setAlimentsRef(List<AlimentRef> alimentsRef) {
		this.alimentsRef = alimentsRef;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public float getPoids() {
		return poids;
	}

	public void setPoids(float poids) {
		this.poids = poids;
	}

	public float getTaille() {
		return taille;
	}

	public void setTaille(float taille) {
		this.taille = taille;
	}

	public String getSexe() {
		return sexe;
	}

	public void setSexe(String sexe) {
		this.sexe = sexe;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Utilisateur [menus=" + menus + ", alimentsRef=" + alimentsRef + ", username=" + username
				+ ", firstName=" + firstName + ", password=" + password + ", poids=" + poids + ", taille=" + taille
				+ ", sexe=" + sexe + "]";
	}

}
