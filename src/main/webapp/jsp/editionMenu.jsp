<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=request.getScheme() + "://"
		+ request.getServerName() + ":"
		+ request.getServerPort()
		+ request.getContextPath() + "/"
		%>" />
<meta charset="ISO-8859-1">

<script src="js/editMenu.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'><title>Ajout d'un aliment réf</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="css/editMenu.css" type="text/css" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>

</head>
<body>

	<input type="hidden" name="afficheDetail" id="afficheDetail" value="${afficheDetailMenu}"/>
	<input type="hidden" name="afficheAjoutAliment" id="afficheAjoutAliment" value="${afficheAjoutAliment}"/>
	
	<div class="containerSelectionMenu">
		<form action="editionMenu/selectionMenuAEditer" method="post">
			<select name="selectionMenu" >
				<core:forEach var="menu" items="${listeMenus}">
					<option value="${menu.id}"> ${menu.nom}</option>
				</core:forEach>	
			</select>
			<input type="submit" class="btn btn-sm btn-primary btn-create" value ="Selectionner"/>
		</form>
		<form action="editionMenu/afficherAjoutMenu" method="post">
			<input type="submit" class="btn btn-sm btn-primary btn-create" value ="Créer un nouveau menu"/>
		</form>
	</div>
	
	<br>
	<div class="ajoutAlimentMenu" id="ajoutAlimentMenu">
	<form action="editionAlimentMenu/ajouterAlimentMenu" method="post"> 
		<div class="containerFormAdd">
			<div class="row">
		        <!-- panel preview -->
		        <div class="panel panel-default">
		                <div class="panel-body form-horizontal payment-form">
		                    
		                    <div class="form-group">
		                        <label for="status" class="col-sm-3 control-label">Aliment</label>
		                        <div class="col-sm-9">
		                            <select class="form-control" name="selectionAlimentRef">
										<core:forEach var="aliment" items="${alsRef}">
											<option value="${aliment.id}"> ${aliment.nom}</option>
										</core:forEach>	
									</select><br/>
		                        </div>
		                    </div> 
		                    <div class="form-group">
		                        <label for="status" class="col-sm-3 control-label">Quantité</label>
		                        <div class="col-sm-9">
		                            <input type="number" required="required" value="0" class="form-control" id="quantite" name="quantite" min="0" step="0.01"/>
		                        </div>
		                    </div>
		          			<div class="row">
				                <div class="col-xs-12">
									<button type="submit" class="btn btn-primary btn-block">Ajouter</button>
				                </div>                
				            </div>
				            <div class="row">
				                <div class="col-xs-12">
				                    <hr style="border:1px dashed #dddddd;">
				                    <a href="editionMenu/finAjout" class="btn btn-primary btn-block" id="btnTerminer">Terminer</a>
				                </div>                
				            </div>
		                </div>
		                       
		        </div>
			</div>
		</div>
	</form>
	</div>
<%-- 		<select name="selectionAlimentRef" >
			<core:forEach var="aliment" items="${alsRef}">
				<option value="${aliment.id}"> ${aliment.nom}</option>
			</core:forEach>	
		</select>
		Quantité : <input type="number" name="quantite" step="0.01" min="0"/>
		<input type="submit" value ="Selectionner"/>
	</form> --%>
	<div class="container" id="container">
    <div class="row">
    	<div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title">Aliments de mon menu <b>${sessionScope.nomMenuEnCours}</b></h3>
                  </div>
                  <div class="col col-xs-6 text-right">
                  	<form action="editionAlimentMenu/afficherAjout" method="post">
                  		<input type="hidden" name="idMenu" value="${idMenu}"/>
                  		<button type="submit" class="btn btn-sm btn-primary btn-create">Ajouter un aliment</button>
                  	</form>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                    	<th scope="col">Action</th>
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
                  
                  	
				  	<core:forEach var="aliment" items="${listeAlimentsMenu}">
						<tr>
							<td align="center">
                              <a class="btn btn-default"><em class="fa fa-pencil"></em></a>
                              
                              	<form action="editionAlimentMenu/delete" method="post">
                              		<input type="hidden" name="idToDelete" value="${aliment.id}"/>
                              		<button type="submit" class="btn btn-danger"><em class="fa fa-trash"></em></button>
                              	</form>
                              
                            </td>
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
						<td>TOTAL</td>
						<td></td>
						<td></td>
						<td>
							${total.calories}
						</td>
						<td>
							${total.proteinesVegetales}
						</td>
						<td>
							${total.proteinesAnimales}
						</td>
						<td>
							${total.lipides}
						</td>
						<td>
							${total.glucides}
						</td>						
					</tr>
				  </tbody>
                </table>
            
              </div>
            </div>
		</div>
	</div>
</div>
<div id="formDelete">
	<form action="editionMenu/delete" method="post">
		<input type="hidden" name="idMenu" value="${idMenu}"/>
		<button type="submit" class="btn btn-sm btn-primary btn-create" id="deleteMenuBtn">Supprimer mon menu</button>
	</form>
</div>
</body>
</html>