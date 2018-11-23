package fr.dawan.beans;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;

@Entity
public class AlimentRef extends DbObject {
	private String nom;
	private double proteinesAnimales;
	private double proteinesVegetales;
	private double lipides;
	private double glucides;
	private double calories;
	private double quantiteRef;
	private boolean total;


	@ManyToOne
	private Utilisateur utilisateur;

	@Enumerated(EnumType.STRING)
	private UniteDeRef uniteRef;
	@Enumerated(EnumType.STRING)
	private Categorie categorie;

	// *****************************
	// Constructeurs
	// *****************************
	public AlimentRef() {

	}

	public AlimentRef(String nom, Categorie categorie) {
		this();
		this.nom = nom;
		this.categorie = categorie;
	}

	public AlimentRef(String nom, double proteinesAnimales, double proteinesVegetales, double lipides, double glucides,
			double calories, double quantiteRef, UniteDeRef uniteRef, Categorie categorie) {
		this(nom, categorie);
		this.proteinesAnimales = proteinesAnimales;
		this.proteinesVegetales = proteinesVegetales;
		this.lipides = lipides;
		this.glucides = glucides;
		this.calories = calories;
		this.quantiteRef = quantiteRef;
		this.uniteRef = uniteRef;
	}

	// *****************************
	// getter/setter
	// *****************************
	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public double getProteinesAnimales() {
		return proteinesAnimales;
	}

	public void setProteinesAnimales(double proteinesAnimales) {
		this.proteinesAnimales = proteinesAnimales;
	}

	public double getProteinesVegetales() {
		return proteinesVegetales;
	}

	public void setProteinesVegetales(double proteinesVegetales) {
		this.proteinesVegetales = proteinesVegetales;
	}

	public double getLipides() {
		return lipides;
	}

	public void setLipides(double lipides) {
		this.lipides = lipides;
	}

	public double getGlucides() {
		return glucides;
	}

	public void setGlucides(double glucides) {
		this.glucides = glucides;
	}

	public double getCalories() {
		return calories;
	}

	public void setCalories(double calories) {
		this.calories = calories;
	}

	public double getQuantiteRef() {
		return quantiteRef;
	}

	public void setQuantiteRef(double quantiteRef) {
		this.quantiteRef = quantiteRef;
	}

	public UniteDeRef getUniteRef() {
		return uniteRef;
	}

	public void setUniteRef(UniteDeRef uniteRef) {
		this.uniteRef = uniteRef;
	}

	public Categorie getCategorie() {
		return categorie;
	}

	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}

	public Utilisateur getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}
	
	public boolean isTotal() {
		return total;
	}

	public void setTotal(boolean total) {
		this.total = total;
	}

//	@Override
//	public String toString() {
//		return "AlimentRef [nom=" + nom + ", proteinesAnimales=" + proteinesAnimales + ", proteinesVegetales="
//				+ proteinesVegetales + ", lipides=" + lipides + ", glucides=" + glucides + ", calories=" + calories
//				+ ", quantiteRef=" + quantiteRef + ", total=" + total + ", utilisateur=" + utilisateur + ", uniteRef="
//				+ uniteRef + ", categorie=" + categorie + "]";
//	}

	


}
