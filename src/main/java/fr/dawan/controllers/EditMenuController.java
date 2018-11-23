package fr.dawan.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.dawan.beans.AlimentMenu;
import fr.dawan.beans.AlimentRef;
import fr.dawan.beans.CompositionMenu;
import fr.dawan.beans.Utilisateur;
import fr.dawan.dao.DaoInterface;

@Controller
@RequestMapping("/editionMenu")
public class EditMenuController {
	
	@Autowired
	private DaoInterface<AlimentMenu> daoAlimentMenu;
	
	@Autowired
	private DaoInterface<CompositionMenu> daoMenu;
	
	@Autowired
	private DaoInterface<Utilisateur> daoUtilisateur;
	
	@Autowired
	private DaoInterface<AlimentRef> daoAlRef;
	
	@GetMapping("/afficherListeMenus")
	public String afficherMesMenus(Model model, HttpSession session) {
		Object utilisateurId = session.getAttribute("idUser");
		if(utilisateurId != null) {
			List<CompositionMenu> menus = daoMenu.findAllbyId(CompositionMenu.class, "utilisateur_id", (int) utilisateurId);
			model.addAttribute("listeMenus", menus);
			return "editionMenu";
		}
		return "redirect:/login";
	}
	
	@PostMapping("/selectionMenuAEditer")
	public String selectionMenuAEditer(Model model, @RequestParam("selectionMenu") int idMenu, HttpSession session) {
		Object utilisateurId = session.getAttribute("idUser");
		if(utilisateurId != null) {
			List<CompositionMenu> menus = daoMenu.findAllbyId(CompositionMenu.class, "utilisateur_id", (int) utilisateurId);
			model.addAttribute("listeMenus", menus);
			
			List<AlimentMenu> alimentsMenu = daoAlimentMenu.findAllbyId(AlimentMenu.class, "menu_id", idMenu);
			CompositionMenu menu = daoMenu.findById(CompositionMenu.class, idMenu);
			
			model.addAttribute("listeAlimentsMenu", alimentsMenu);
			model.addAttribute("total", menu.getAlRefTotal());
			session.setAttribute("idMenuEnCours", idMenu);
			session.setAttribute("nomMenuEnCours", daoMenu.findById(CompositionMenu.class, idMenu).getNom());
			model.addAttribute("afficheDetailMenu", "1");
			return "editionMenu";
		}
		return "redirect:/login";
	}
	
	@PostMapping("/afficherAjoutMenu")
	public String afficherAjoutMenu() {
		return "ajoutMenu";
	}
	
	@PostMapping("ajoutMenu")
	public String ajoutMenu(Model model, CompositionMenu menu, HttpSession session) {
		Object utilisateurId = session.getAttribute("idUser");
		if(utilisateurId != null) {
			Utilisateur user = daoUtilisateur.findById(Utilisateur.class, (int) session.getAttribute("idUser"));
			AlimentRef alRef = new AlimentRef();
			alRef.setTotal(true);
			alRef = daoAlRef.createOrUpdate(alRef);
			menu.setAlRefTotal(alRef);
			menu.setUtilisateur(user);
			
			daoMenu.createOrUpdate(menu);
			List<CompositionMenu> menus = daoMenu.findAllbyId(CompositionMenu.class, "utilisateur_id", (int) session.getAttribute("idUser"));
			model.addAttribute("listeMenus", menus);
			return "editionMenu";
		}
		return "redirect:/login";
	}
	
	@GetMapping("/finAjout")
	public String finAjout(Model model, HttpSession session) {
		Object utilisateurId = session.getAttribute("idUser");
		if(utilisateurId != null) {
			
			List<CompositionMenu> menus = daoMenu.findAllbyId(CompositionMenu.class, "utilisateur_id", (int) session.getAttribute("idUser"));
			model.addAttribute("listeMenus", menus);
			
			List<AlimentMenu> alimentsMenu = daoAlimentMenu.findAllbyId(AlimentMenu.class, "menu_id", (int) session.getAttribute("idMenuEnCours"));
			model.addAttribute("listeAlimentsMenu", alimentsMenu);
			
			CompositionMenu menu = daoMenu.findById(CompositionMenu.class, (int) session.getAttribute("idMenuEnCours"));
			model.addAttribute("total", daoAlRef.findById(AlimentRef.class, menu.getAlRefTotal().getId()));
		
			model.addAttribute("afficheDetailMenu", "1");
			model.addAttribute("afficheAjoutAliment", "0");
			
			List<AlimentRef> alsRef = daoAlRef.findAllbyId(AlimentRef.class, "utilisateur_id",	(Integer) session.getAttribute("idUser"));
			model.addAttribute("alsRef", alsRef);
			
			return "editionMenu";
		}
		return "redirect:/login"; 
	}
	
}
