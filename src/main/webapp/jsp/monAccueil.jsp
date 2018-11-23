<%@page import="fr.dawan.beans.AlimentMenu"%>
<%@page import="fr.dawan.dao.GenericDao"%>
<%@page import="fr.dawan.beans.CompositionMenu"%>
<%@page import="fr.dawan.dao.DaoInterface"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>

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
	<!-- <header> -->
		<h1>Bienvenue sur votre accueil personnalisé ${utilisateur}</h1>


	
	        <core:forEach var="menu" items="${listeMenu}">
	        	
	        
	        
	        <div class="container">
			    <div class="row">
			    	<div class="col-md-10 col-md-offset-1">
			
			            <div class="panel panel-default panel-table">
			              <div class="panel-heading">
			                <div class="row">
			                  <div class="col col-xs-6">
			                    <h3 class="panel-title">Mon menu <b>${menu.nom}</b></h3>
			                  </div>
			                </div>
			              </div>
			              <div class="panel-body">
			                <table class="table table-striped table-bordered table-list">
			                  <thead>
			                    <tr>
			                    	
			                          <th scope="col">Nom</th>
								      <th scope="col">Quantité</th>
								      <th scope="col">Calories</th>
								      <th scope="col">Protéines végétales</th>
								      <th scope="col">Protéines Animales</th>
								      <th scope="col">Lipides</th>
								      <th scope="col">Glucides</th>
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
		  <%-- <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		    <ol class="carousel-indicators">
		      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		      <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
		    </ol>
		    
		    <div class="carousel-inner" role="listbox">
		    
		      <!-- Slide One - Set the background image for this slide in the line below -->
		      <div class="carousel-item active" style="background-image: url('../static/css/redi_montage.gif')">
		        
		        <div class="carousel-caption d-none d-md-block">
		          <h3 class="display-4">${nomMenu}</h3>
		          <p class="lead">Composition de votre menu ${nomMenu}</p>
		        </div>
		      </div>
		      
		      <!-- Slide Two - Set the background image for this slide in the line below -->
		      <div class="carousel-item" style="background-image: url('https://source.unsplash.com/wfh8dDlNFOk/1920x1080')">
		        <div class="carousel-caption d-none d-md-block">
		          <h3 class="display-4">Second Slide</h3>
		          <p class="lead">This is a description for the second slide.</p>
		        </div>
		      </div>
		      
		      <!-- Slide Three - Set the background image for this slide in the line below -->
		      <div class="carousel-item" style="background-image: url('https://source.unsplash.com/O7fzqFEfLlo/1920x1080')">
		        <div class="carousel-caption d-none d-md-block">
		          <h3 class="display-4">Third Slide</h3>
		          <p class="lead">This is a description for the third slide.</p>
		        </div>
		      </div>
		      
		    </div>
		    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		          <span class="sr-only">Previous</span>
		        </a>
		    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		          <span class="carousel-control-next-icon" aria-hidden="true"></span>
		          <span class="sr-only">Next</span>
		        </a>
		  </div> --%>
<!-- 	</header> -->	
</body>
</html>