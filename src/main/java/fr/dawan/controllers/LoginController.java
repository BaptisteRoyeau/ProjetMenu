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
	public String afficherInscription(Model model) {
		return "inscription";
	}

	@PostMapping("/identification")
	public String validationIdentification(Model model, Utilisateur utilisateur, HttpSession session) {
		List<Utilisateur> user = daoUtilisateur.findAll(Utilisateur.class);
		
		utilisateur.setPassword(convertToMD5(utilisateur.getPassword()));

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
		
		try {
			utilisateur.setPassword(convertToMD5(utilisateur.getPassword()));
			daoUtilisateur.createOrUpdate(utilisateur);
			return "redirect:/login";
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("emailError",
					"/!\\ Email déjà utilisé ! Veuillez vous connecter avec votre compte ou utiliser une autre adresse email.");
			model.addAttribute("username", utilisateur.getUsername());
			model.addAttribute("lastName", utilisateur.getLastName());
			model.addAttribute("sexe", utilisateur.getSexe());
			model.addAttribute("size", utilisateur.getTaille());
			model.addAttribute("weight", utilisateur.getPoids());
			return "inscription";
		}

	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

	public String convertToMD5(String stringToConvert) {
		try {
			java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
			byte[] array = md.digest(stringToConvert.getBytes());
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < array.length; ++i) {
				sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
			}
			return sb.toString();
		} catch (java.security.NoSuchAlgorithmException e) {
		}
		return null;
	}
}
