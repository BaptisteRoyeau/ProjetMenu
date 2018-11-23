<%@page import="fr.dawan.dao.GenericDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@page import="fr.dawan.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=request.getScheme() + "://"
		+ request.getServerName() + ":"
		+ request.getServerPort()
		+ request.getContextPath() + "/"
		%>" />
<meta charset="ISO-8859-1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'><title>Ajout d'un aliment r�f</title>
<link rel="stylesheet" href="css/editAlimentRef.css" type="text/css" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>

	<input type="hidden" name="affForm" id="affForm" value="${afficheForm}"/>
	
	<div class="all">
	<form action="editionAlimentRef/ajout" method="post" class="formulaireAjout" id="myForm">
		<div class="containerFormAdd">
			<div class="row">
		        <!-- panel preview -->
		        
		            
		            <div class="panel panel-default">
		                <div class="panel-body form-horizontal payment-form">
		                    <div class="form-group">
		                        <label for="concept" class="col-sm-3 control-label">Nom</label>
		                        <div class="col-sm-9">
		                            <input type="text" required="required" class="form-control" id="nom" name="nom">
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="description" class="col-sm-3 control-label">Prot��nes Animales</label>
		                        <div class="col-sm-9">
		                            <input type="number" required="required" value="0" class="form-control" id="proteinesAnimales" name="proteinesAnimales" min="0" step="0.01"/>
		                        </div>
		                    </div> 
		                    <div class="form-group">
		                        <label for="amount" class="col-sm-3 control-label">Prot��nes V�g�tales</label>
		                        <div class="col-sm-9">
		                            <input type="number" required="required" value="0" class="form-control" id="proteinesVegetales" name="proteinesVegetales" min="0" step="0.01"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="status" class="col-sm-3 control-label">Lipides</label>
		                        <div class="col-sm-9">
		                            <input type="number" required="required" value="0" class="form-control" id="lipides" name="lipides" min="0" step="0.01"/>
		                        </div>
		                    </div>   
		                    <div class="form-group">
		                        <label for="status" class="col-sm-3 control-label">Glucides</label>
		                        <div class="col-sm-9">
		                            <input type="number" required="required" value="0" class="form-control" id="glucides" name="glucides" min="0" step="0.01"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="status" class="col-sm-3 control-label">Calories</label>
		                        <div class="col-sm-9">
		                            <input type="number" class="form-control" required="required" value="0" id="calories" name="calories" min="0" step="0.01"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="status" class="col-sm-3 control-label">Quantit� de r�f�rence </label>
		                        <div class="col-sm-9">
		                            <input type="number" required="required" value="0" class="form-control" id="quantiteRef" name="quantiteRef" min="0" step="0.01"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="status" class="col-sm-3 control-label">Unit� de r�f�rence</label>
		                        <div class="col-sm-9">
		                            <select class="form-control" name="uniteRef">
										<core:forEach var="unite" items="<%= UniteDeRef.values() %>">
											<option value="${unite}"> ${unite}</option>
										</core:forEach>	
									</select><br/>
		                        </div>
		                    </div> 
		                    <div class="form-group">
		                        <label for="status" class="col-sm-3 control-label">Cat�gorie</label>
		                        <div class="col-sm-9">
		                            <select class="form-control" name="categorie">
										<core:forEach var="categorie" items="<%= Categorie.values() %>">
											<option value="${categorie}"> ${categorie}</option>
										</core:forEach>	
									</select><br/>
		                        </div>
		                    </div> 
		                
		                    
		                    <div class="row">
				                <div class="col-xs-12">
									<button type="submit" class="btn btn-primary btn-block">Ajouter</button>
				                </div>                
				            </div>
				            <div>
		                    	<input type="hidden" value="false" name="total"/>
		                    </div>
				            <div class="row">
				                <div class="col-xs-12">
				                    <hr style="border:1px dashed #dddddd;">
				                    <a href="editionAlimentRef/finAjout" class="btn btn-primary btn-block" id="btnTerminer">Terminer</a>
				                </div>                
				            </div>
		                </div>
		                       
		        </div>
			</div>
		</div>
	</form>
	
	<div class="container">
    <div class="row">
    	<div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title">Mes aliments</h3>
                  </div>
                  <div class="col col-xs-6 text-right">
                    <button type="button" class="btn btn-sm btn-primary btn-create ajout" id="myBtn">Ajouter  un aliment ref</button>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                    	<th scope="col">Action</th>
                          <th scope="col">Nom</th>
					      <th scope="col">Quantit�</th>
					      <th scope="col">Calories</th>
					      <th scope="col">Prot�ines v�g�tales</th>
					      <th scope="col">Prot�ines Animales</th>
					      <th scope="col">Lipides</th>
					      <th scope="col">Glucides</th>
                    </tr> 
                  </thead>
                  <tbody>
				  	<core:forEach var="aliment" items="${listeAlRef}">
						<tr>
							<td>
								<form action="editionAlimentRef/ajout" method="post">
                          			<input type="hidden" name="nom" value="${aliment.nom}">
                          			<input type="hidden" name="calories" value="${aliment.calories}">
                          			<input type="hidden" name="quantiteRef" value="${aliment.quantiteRef}">
                          			<input type="hidden" name="proteinesVegetales" value="${aliment.proteinesVegetales}">
                          			<input type="hidden" name="proteinesAnimales" value="${aliment.proteinesAnimales}">
                          			<input type="hidden" name="lipides" value="${aliment.lipides}">
                          			<input type="hidden" name="glucides" value="${aliment.glucides}">
                              		<button type="submit" class="btn btn-default"><em class="fa fa-pencil"></em></button>
                              	</form>
                              	<form action="editionAlimentRef/delete" method="post">
                              		<input type="hidden" name="idToDelete" value="${aliment.id}"/>
                              		<button type="submit" class="btn btn-danger"><em class="fa fa-trash"></em></button>
                              	</form>
                              
                            </td>
							<td contenteditable='true'>${aliment.nom}</td>
							<td contenteditable='true'>${aliment.calories}</td>
							<td contenteditable='true'>${aliment.quantiteRef}</td>
							<td contenteditable='true'>${aliment.proteinesVegetales}</td>
							<td contenteditable='true'>${aliment.proteinesAnimales}</td>
							<td contenteditable='true'>${aliment.lipides}</td>
							<td contenteditable='true'>${aliment.glucides}</td>
						</tr>
					</core:forEach>	
				  </tbody>
                </table>
            
              </div>
            </div>

</div></div></div>
			
	</div>
	
	<script src="js/editAlRef.js"></script>
</body>
</html>