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
import fr.dawan.beans.Utilisateur;
import fr.dawan.dao.DaoInterface;

@Controller
@RequestMapping("/editionAlimentRef")
public class EditAlimentRefController {
	@Autowired
	private DaoInterface<AlimentRef> daoAlRef;
	
	@Autowired
	private DaoInterface<Utilisateur> daoUtilisateur;
	
	@Autowired
	private DaoInterface<AlimentMenu> daoAlMenu;
	
	@GetMapping("")
	public String afficherMesAlimentsRef(Model model, HttpSession session) {
		Object utilisateurId = session.getAttribute("idUser");
		if(utilisateurId!=null) {
			List<AlimentRef> alimentsRef = daoAlRef.findAllbyId(AlimentRef.class, "utilisateur_id",(Integer) utilisateurId);
			model.addAttribute("listeAlRef", alimentsRef);
			return "editAlimentRef";
		}
		
		return "redirect:/login";
	}
	
	@PostMapping("ajout")
	public String ajoutUnAlimentRef(Model model, AlimentRef alRef, HttpSession session) {
		Object utilisateurId = session.getAttribute("idUser");
		if(utilisateurId!=null) {
			Utilisateur utilisateur = daoUtilisateur.findById(Utilisateur.class, (Integer) utilisateurId);
			
	//		System.out.println("Id session : " + session.getAttribute("idUser") + "\n mon user : " + utilisateur);
			alRef.setUtilisateur(utilisateur);
			alRef = daoAlRef.createOrUpdate(alRef);
		
			model.addAttribute("listeAlRef", daoAlRef.findAllbyId(AlimentRef.class, "utilisateur_id", (Integer) utilisateurId));
			
			model.addAttribute("afficheForm", "1");
			return "editAlimentRef";
		}
		return "redirect:/login";
	}
	
	@PostMapping("delete")
	public String supprimerUnAlimentRef(Model model, AlimentRef alRef, HttpSession session,@RequestParam("idToDelete") int id) {
		Object utilisateurId = session.getAttribute("idUser");
		if(utilisateurId!=null) {
			List<AlimentMenu> alsMenu = daoAlMenu.findAllbyId(AlimentMenu.class, "alimentRef_id", id);
			for (AlimentMenu alimentMenu : alsMenu) {
				daoAlMenu.delete(AlimentMenu.class, alimentMenu.getId());
			}
			daoAlRef.delete(AlimentRef.class, id);
		
			model.addAttribute("listeAlRef", daoAlRef.findAllbyId(AlimentRef.class, "utilisateur_id",(Integer) utilisateurId));
			return "editAlimentRef";
		}
		return "redirect:/login";
	}
	
	@GetMapping("finAjout")
	public String finAjout(Model model, HttpSession session) {
		Object utilisateurId = session.getAttribute("idUser");
		if(utilisateurId!=null) {
			model.addAttribute("afficheForm", "0");
			model.addAttribute("listeAlRef", daoAlRef.findAllbyId(AlimentRef.class, "utilisateur_id",(Integer) utilisateurId));
			return "editAlimentRef";
		}
		return "redirect:/login";
	}
	
}
