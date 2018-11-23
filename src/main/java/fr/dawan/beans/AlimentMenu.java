package fr.dawan.beans;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class AlimentMenu extends DbObject {
	private double quantite;
	
	@ManyToOne
	private AlimentRef alimentRef;	
	
	@ManyToOne
	private CompositionMenu menu;

	public AlimentMenu() {		
	}

	public AlimentMenu(double quantite, AlimentRef alimentRef) {
		this.quantite = quantite;
		this.alimentRef = alimentRef;
	}

	public double getQuantite() {
		return quantite;
	}

	public void setQuantite(double quantite) {
		this.quantite = quantite;
	}

	public AlimentRef getAlimentRef() {
		return alimentRef;
	}
	
	public void setAlimentRef(AlimentRef alimentRef) {
		this.alimentRef = alimentRef;
	}

	public CompositionMenu getMenu() {
		return menu;
	}

	public void setMenu(CompositionMenu menu) {
		this.menu = menu;
	}

	@Override
	public String toString() {
		return "AlimentMenu [quantite=" + quantite + ", alimentRef=" + alimentRef + ", menu=" + menu + ", getId()="
				+ getId() + "]";
	}

}
