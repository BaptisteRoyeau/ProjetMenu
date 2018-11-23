package fr.dawan.beans;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class CompositionMenu extends DbObject {
	// Attributs
	private String nom;
	
	@OneToMany(mappedBy="menu")
	private List<AlimentMenu> aliments = new ArrayList<AlimentMenu>();
	
	@ManyToOne
	private Utilisateur utilisateur;
	
	@OneToOne
	private AlimentRef alRefTotal;

	

	// *****************************
	// Constructeurs
	// *****************************
	public CompositionMenu() {
		super();
		
	}

	public CompositionMenu(String nom, List<AlimentMenu> aliments) {
		super();
		this.nom = nom;
		this.aliments = aliments;
	}

	public CompositionMenu(List<AlimentMenu> aliments) {
		super();
		this.aliments = aliments;
	}

	// *****************************
	// getter/setter
	// *****************************
	public String getNom() {
		return nom;
	}

	public List<AlimentMenu> getAliments() {
		return aliments;
	}

	public void setAliments(List<AlimentMenu> aliments) {
		this.aliments = aliments;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public Utilisateur getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}
	
	public AlimentRef getAlRefTotal() {
		return alRefTotal;
	}

	public void setAlRefTotal(AlimentRef alRefTotal) {
		this.alRefTotal = alRefTotal;
	}
	
}
