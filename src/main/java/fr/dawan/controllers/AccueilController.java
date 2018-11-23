package fr.dawan.controllers;

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
public class AccueilController {

	@Autowired
	private DaoInterface<Utilisateur> daoUtilisateur;
	
	@Autowired
	private DaoInterface<CompositionMenu> daoMenu;
	
	@Autowired
	private DaoInterface<AlimentMenu> daoAlimentMenu;
	
	@GetMapping("/monAccueil")
	public String afficherAccueil(Model model, HttpSession session) {
		Object utilisateurId = session.getAttribute("idUser");
		if(utilisateurId!=null) {
			Object username = session.getAttribute("user");
			model.addAttribute("utilisateur", username.toString());
			
			List<CompositionMenu> menus = daoMenu.findAllbyId(CompositionMenu.class, "utilisateur_id",(int) session.getAttribute("idUser"));
			
			for (CompositionMenu menu : menus) {
				System.out.println(menu.getNom());
			}
	
			for (CompositionMenu compositionMenu : menus) {
				List<AlimentMenu> alsMenu = daoAlimentMenu.findAllbyId(AlimentMenu.class, "menu_id", compositionMenu.getId());
				compositionMenu.setAliments(alsMenu);
				System.out.println(compositionMenu.getAliments().toString());
			}
			
			model.addAttribute("listeMenu", menus);
			return "monAccueil";
		}
		return "redirect:/login";
	}
}
