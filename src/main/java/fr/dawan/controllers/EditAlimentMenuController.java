package fr.dawan.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.bouncycastle.jcajce.util.AlgorithmParametersUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.dawan.beans.AlimentMenu;
import fr.dawan.beans.AlimentRef;
import fr.dawan.beans.CompositionMenu;
import fr.dawan.dao.DaoInterface;

@Controller
@RequestMapping("/editionAlimentMenu")
public class EditAlimentMenuController {

	@Autowired
	private DaoInterface<AlimentRef> daoAlimentRef;

	@Autowired
	private DaoInterface<CompositionMenu> daoMenu;

	@Autowired
	private DaoInterface<AlimentMenu> daoAlimentMenu;

	@PostMapping("/afficherAjout")
	public String afficherAjout(Model model, HttpSession session) {
		Object utilisateurId = session.getAttribute("idUser");
		if(utilisateurId!=null) {
			CompositionMenu menu = daoMenu.findById(CompositionMenu.class, (int) session.getAttribute("idMenuEnCours"));
			List<AlimentMenu> alimentsMenu = daoAlimentMenu.findAllbyId(AlimentMenu.class, "menu_id",(int) session.getAttribute("idMenuEnCours"));
			model.addAttribute("listeAlimentsMenu", alimentsMenu);
			List<AlimentRef> alsRef = daoAlimentRef.findAllbyId(AlimentRef.class, "utilisateur_id",	(Integer) session.getAttribute("idUser"));
	
			model.addAttribute("alsRef", alsRef);
			List<CompositionMenu> menus = daoMenu.findAllbyId(CompositionMenu.class, "utilisateur_id", (int) session.getAttribute("idUser"));
			model.addAttribute("listeMenus", menus);
			model.addAttribute("afficheDetailMenu", "1");
			model.addAttribute("afficheAjoutAliment", "1");
			model.addAttribute("total", daoAlimentRef.findById(AlimentRef.class, menu.getAlRefTotal().getId()));
			return "editionMenu";
		}
		return "redirect:/login";
	}

	@PostMapping("/ajouterAlimentMenu")
	public String ajouterAlimentMenu(Model model, HttpSession session, @RequestParam("quantite") double quantite,
			@RequestParam("selectionAlimentRef") int idAlimentRef) {
		
		AlimentMenu alimentMenu = new AlimentMenu();
		alimentMenu.setQuantite(quantite);

		AlimentRef alimentRef = daoAlimentRef.findById(AlimentRef.class, idAlimentRef);

		CompositionMenu menu = daoMenu.findById(CompositionMenu.class, (int) session.getAttribute("idMenuEnCours"));
		
		alimentMenu.setAlimentRef(alimentRef);

		alimentMenu.setMenu(menu);

		alimentMenu = daoAlimentMenu.createOrUpdate(alimentMenu);

		//Calcul total
		List<AlimentMenu> alimentsMenu = daoAlimentMenu.findAllbyId(AlimentMenu.class, "menu_id",(int) session.getAttribute("idMenuEnCours"));
		model.addAttribute("listeAlimentsMenu", alimentsMenu);

		AlimentRef alRefTotal = daoAlimentRef.findById(AlimentRef.class, menu.getAlRefTotal().getId());
		
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
		alRefTotal = daoAlimentRef.createOrUpdate(alRefTotal);

		model.addAttribute("listeAlimentsMenu", alimentsMenu);
		model.addAttribute("total", daoAlimentRef.findById(AlimentRef.class, menu.getAlRefTotal().getId()));
		
		List<CompositionMenu> menus = daoMenu.findAllbyId(CompositionMenu.class, "utilisateur_id", (int) session.getAttribute("idUser"));
		model.addAttribute("listeMenus", menus);
		
		List<AlimentRef> alsRef = daoAlimentRef.findAllbyId(AlimentRef.class, "utilisateur_id",	(Integer) session.getAttribute("idUser"));
		model.addAttribute("alsRef", alsRef);
		
		model.addAttribute("afficheDetailMenu", "1");
		model.addAttribute("afficheAjoutAliment", "1");
		return "editionMenu";
	}

	@PostMapping("delete")
	public String supprimerUnAlimentRef(Model model, AlimentRef alRef, HttpSession session,
			@RequestParam("idToDelete") int id) {
		CompositionMenu menu = daoMenu.findById(CompositionMenu.class, (int) session.getAttribute("idMenuEnCours"));

		daoAlimentMenu.delete(AlimentMenu.class, id);

		List<AlimentMenu> alimentsMenu = daoAlimentMenu.findAllbyId(AlimentMenu.class, "menu_id",(int) session.getAttribute("idMenuEnCours"));
		model.addAttribute("listeAlimentsMenu", alimentsMenu);

		AlimentRef alRefTotal = new AlimentRef();
		if (daoAlimentRef.findById(AlimentRef.class, menu.getAlRefTotal().getId()).equals(null)) {
			alRefTotal.setTotal(true);
		}
		else {
			alRefTotal = daoAlimentRef.findById(AlimentRef.class, menu.getAlRefTotal().getId());
	
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
		alRefTotal = daoAlimentRef.createOrUpdate(alRefTotal);
		
		model.addAttribute("total", daoAlimentRef.findById(AlimentRef.class, menu.getAlRefTotal().getId()));
		model.addAttribute("listeAlimentsMenu", alimentsMenu);
		List<CompositionMenu> menus = daoMenu.findAllbyId(CompositionMenu.class, "utilisateur_id", (int) session.getAttribute("idUser"));
		model.addAttribute("listeMenus", menus);
		model.addAttribute("afficheDetailMenu", "1");
		return "editionMenu";
	}
}
