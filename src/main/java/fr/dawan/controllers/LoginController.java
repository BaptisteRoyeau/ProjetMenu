package fr.dawan.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import fr.dawan.beans.AlimentMenu;
import fr.dawan.beans.CompositionMenu;
import fr.dawan.beans.Utilisateur;
import fr.dawan.dao.DaoInterface;

@Controller
public class LoginController {

	@Autowired
	private DaoInterface<Utilisateur> daoUtilisateur;

	@Autowired
	private DaoInterface<CompositionMenu> daoMenu;

	@Autowired
	private DaoInterface<AlimentMenu> daoAlimentMenu;

	@GetMapping("/login")
	public String afficherLogin() {
		return "login";
	}

	@GetMapping("/inscription")
	public String afficherInscription() {
		return "inscription";
	}

	@PostMapping("/identification")
	public String validationIdentification(Model model, Utilisateur utilisateur, HttpSession session) {
		List<Utilisateur> user = daoUtilisateur.findAll(Utilisateur.class);

		for (Utilisateur utilisateur2 : user) {
			System.out.println(utilisateur2.getUsername());
			if ((utilisateur2.getUsername().equals(utilisateur.getUsername()))
					&& (utilisateur2.getPassword().equals(utilisateur.getPassword()))
					&& (utilisateur.getUsername() != null) && (utilisateur.getUsername() != "")
					&& (utilisateur.getPassword() != null) && (utilisateur.getPassword() != "")) {

				session.setAttribute("user", utilisateur2.getUsername());
				session.setAttribute("idUser", utilisateur2.getId());

//				model.addAttribute("listeAlimentMenu", alsMenu);

				return "redirect:/monAccueil";
			}
		}

		model.addAttribute("erreurConnexion", "Erreur d'authentification");
		return "redirect:/login";
	}

	@GetMapping("/retourAccueil")
	public String retourAccueil() {
		return "redirect:/monAccueil";
	}

	@PostMapping("/ajoutUtilisateur")
	public String ajoutUtilisateur(Model model, Utilisateur utilisateur) {
		daoUtilisateur.createOrUpdate(utilisateur);
		return "redirect:/login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
}
