<%@page import="fr.dawan.beans.AlimentMenu"%>
<%@page import="fr.dawan.dao.GenericDao"%>
<%@page import="fr.dawan.beans.CompositionMenu"%>
<%@page import="fr.dawan.dao.DaoInterface"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/accueil.css" type="text/css" />
	
	<!-- css/js for snippet source -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" type="text/css" />
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</head>
<body>	
		<h1><spring:message code="WELCOME_TEXT_HOME" arguments="${utilisateur}" text="texte par défaut si aucune clé n’est trouvée"/> </h1>


	
	        <core:forEach var="menu" items="${listeMenu}">
	        	
	        
	        
	        <div class="container">
			    <div class="row">
			    	<div class="col-md-10 col-md-offset-1">
			
			            <div class="panel panel-default panel-table">
			              <div class="panel-heading">
			                <div class="row">
			                  <div class="col col-xs-6">
			                    <h3 class="panel-title"><spring:message code="HOME_TABLE_NAME" arguments="<b>${menu.nom}</b>" text="texte par défaut si aucune clé n’est trouvée"/></h3>
			                  </div>
			                </div>
			              </div>
			              <div class="panel-body">
			                <table class="table table-striped table-bordered table-list">
			                  <thead>
			                    <tr>
			                    	
			                          <th scope="col"><spring:message code="TABLE_HEADER_FOOD_NAME" text="texte par défaut si aucune clé n’est trouvée"/></th>
								      <th scope="col"><spring:message code="TABLE_HEADER_QUANTITY" text="texte par défaut si aucune clé n’est trouvée"/></th>
								      <th scope="col"><spring:message code="TABLE_HEADER_CALORIES" text="texte par défaut si aucune clé n’est trouvée"/></th>
								      <th scope="col"><spring:message code="TABLE_HEADER_ANIMAL_PROTEINS" text="texte par défaut si aucune clé n’est trouvée"/></th>
								      <th scope="col"><spring:message code="TABLE_HEADER_VEGETAL_PROTEINS" text="texte par défaut si aucune clé n’est trouvée"/></th>
								      <th scope="col"><spring:message code="TABLE_HEADER_LIPIDS" text="texte par défaut si aucune clé n’est trouvée"/></th>
								      <th scope="col"><spring:message code="TABLE_HEADER_CARBS" text="texte par défaut si aucune clé n’est trouvée"/></th>
			                    </tr> 
			                  </thead>
			                  <tbody>
			                   
							  	<core:forEach var="aliment" items="${menu.aliments}">
									<tr>
										
										<td>${aliment.alimentRef.nom}</td>
										
										<td>${aliment.quantite}</td>
										
										<td>
											${(aliment.alimentRef.calories*aliment.quantite)/(aliment.alimentRef.quantiteRef)}
											
										</td>
										
										
										<td>
											<core:set var="proteinesVegetales" value="${(aliment.alimentRef.proteinesVegetales*aliment.quantite)/(aliment.alimentRef.quantiteRef)}" />
											<core:out value="${proteinesVegetales}">${proteinesVegetales}</core:out> 
										</td>
										<td>
											<core:set var="proteinesAnimales" value="${(aliment.alimentRef.proteinesAnimales*aliment.quantite)/(aliment.alimentRef.quantiteRef)}" />
											<core:out value="${proteinesAnimales}">${proteinesAnimales}</core:out> 
										</td>
										<td>
											<core:set var="lipides" value="${(aliment.alimentRef.lipides*aliment.quantite)/(aliment.alimentRef.quantiteRef)}" />
											<core:out value="${lipides}">${lipides}</core:out> 
										</td>
										<td>
											<core:set var="glucides" value="${(aliment.alimentRef.glucides*aliment.quantite)/(aliment.alimentRef.quantiteRef)}" />
											<core:out value="${glucides}">${glucides}</core:out> 
										</td>
									</tr>
								</core:forEach>	
								<tr>
								
									<td><b>TOTAL</b></td>
									<td></td>
									<td>
										<b>${menu.alRefTotal.calories}</b>
									</td>
									<td>
										<b>${menu.alRefTotal.proteinesVegetales}</b>
									</td>
									<td>
										<b>${menu.alRefTotal.proteinesAnimales}</b>
									</td>
									<td>
										<b>${menu.alRefTotal.lipides}</b>
									</td>
									<td>
										<b>${menu.alRefTotal.glucides}</b>
									</td>	
									
														
								</tr>
								 
							  </tbody>
			                </table>
			            
			              </div>
			            </div>
			
			</div></div></div>
		</core:forEach> 
</body>
</html>