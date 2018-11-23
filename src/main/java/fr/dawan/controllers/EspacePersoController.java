package fr.dawan.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import fr.dawan.beans.AlimentMenu;
import fr.dawan.beans.Utilisateur;
import fr.dawan.dao.DaoInterface;

@Controller
@RequestMapping("/espacePerso")
public class EspacePersoController {
	
	@Autowired
	private DaoInterface<Utilisateur> daoUtilisateur;
	
	@GetMapping("/afficher")
	public String afficher(Model model, HttpSession session) {
		Object utilisateurId = session.getAttribute("idUser");
		if(utilisateurId!=null) {
			Utilisateur user = daoUtilisateur.findById(Utilisateur.class, (Integer) utilisateurId);
			model.addAttribute("utilisateur", user);
			return "espacePerso";
		}
		return "login";
	}
}
