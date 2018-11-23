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
@RequestMapping("/editionAlimentRef")
public class EditAlimentRefController {
	@Autowired
	private DaoInterface<AlimentRef> daoAlRef;
	
	@Autowired
	private DaoInterface<Utilisateur> daoUtilisateur;
	
	@Autowired
	private DaoInterface<AlimentMenu> daoAlMenu;
	
	@Autowired
	private DaoInterface<CompositionMenu> daoMenu;
	
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
			//first delete all alMenu link to alRef
			List<AlimentMenu> alsMenu = daoAlMenu.findAllbyId(AlimentMenu.class, "alimentRef_id", id);
			for (AlimentMenu alimentMenu : alsMenu) {
				daoAlMenu.delete(AlimentMenu.class, alimentMenu.getId());
			}
			
			//delete alRef
			daoAlRef.delete(AlimentRef.class, id);
		
			model.addAttribute("listeAlRef", daoAlRef.findAllbyId(AlimentRef.class, "utilisateur_id",(Integer) utilisateurId));
			
			//update alref for every menu after delete an alRef
			updateAlRef(model, session);
			
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
	
	private void updateAlRef(Model model, HttpSession session) {
		List<CompositionMenu> menus = daoMenu.findAllbyId(CompositionMenu.class, "utilisateur_id",(Integer) session.getAttribute("idUser"));
		
		for (CompositionMenu compositionMenu : menus) {
			List<AlimentMenu> alimentsMenu = daoAlMenu.findAllbyId(AlimentMenu.class, "menu_id", compositionMenu.getId());

			AlimentRef alRefTotal = new AlimentRef();
			if (daoAlRef.findById(AlimentRef.class, compositionMenu.getAlRefTotal().getId()).equals(null)) {
				alRefTotal.setTotal(true);
			}
			else {
				alRefTotal = daoAlRef.findById(AlimentRef.class, compositionMenu.getAlRefTotal().getId());
		
			}
			
			alRefTotal.setCalories(0);
			alRefTotal.setGlucides(0);
			alRefTotal.setLipides(0);
			alRefTotal.setProteinesAnimales(0);
			alRefTotal.setProteinesVegetales(0);

			for (AlimentMenu alimentMenu2 : alimentsMenu) {
				AlimentRef alimentRef2 = alimentMenu2.getAlimentRef();

				alRefTotal.setCalories(alRefTotal.getCalories()
						+ ((alimentRef2.getCalories() * alimentMenu2.getQuantite()) / (alimentRef2.getQuantiteRef())));
				alRefTotal.setGlucides(alRefTotal.getGlucides()
						+ ((alimentRef2.getGlucides() * alimentMenu2.getQuantite()) / (alimentRef2.getQuantiteRef())));
				alRefTotal.setLipides(alRefTotal.getLipides()
						+ ((alimentRef2.getLipides() * alimentMenu2.getQuantite()) / (alimentRef2.getQuantiteRef())));
				alRefTotal.setProteinesAnimales(alRefTotal.getProteinesAnimales()
						+ ((alimentRef2.getProteinesAnimales() * alimentMenu2.getQuantite())
								/ (alimentRef2.getQuantiteRef())));
				alRefTotal.setProteinesVegetales(alRefTotal.getProteinesVegetales()
						+ ((alimentRef2.getProteinesVegetales() * alimentMenu2.getQuantite())
								/ (alimentRef2.getQuantiteRef())));
			}
			alRefTotal = daoAlRef.createOrUpdate(alRefTotal);
		}
		
	}
	
}
