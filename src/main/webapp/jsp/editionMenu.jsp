<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
<spring:message code="BUTTON_SELECTION" text="ERROR" var="BUTTON_SELECTION"/>
<spring:message code="BUTTON_CREATE_MENU" text="ERROR" var="BUTTON_CREATE_MENU"/>
<spring:message code="BUTTON_ADD_FOOD" text="ERROR" var="BUTTON_ADD_FOOD"/>
<spring:message code="TABLE_TITLE_FOODD_LIST_IN_MENU" text="ERROR" var="TABLE_TITLE_FOODD_LIST_IN_MENU" arguments="<b>${sessionScope.nomMenuEnCours}</b>"/>
<spring:message code="BUTTON_ADD_FOOD" text="ERROR" var="BUTTON_ADD_FOOD"/>
<spring:message code="TABLE_HEADER_FOOD_NAME" text="ERROR" var="TABLE_HEADER_FOOD_NAME"/>
<spring:message code="TABLE_HEADER_QUANTITY" text="ERROR" var="TABLE_HEADER_QUANTITY"/>
<spring:message code="TABLE_HEADER_CALORIES" text="ERROR" var="TABLE_HEADER_CALORIES"/>
<spring:message code="TABLE_HEADER_VEGETAL_PROTEINS" text="ERROR" var="TABLE_HEADER_VEGETAL_PROTEINS"/>
<spring:message code="TABLE_HEADER_ANIMAL_PROTEINS" text="ERROR" var="TABLE_HEADER_ANIMAL_PROTEINS"/>
<spring:message code="TABLE_HEADER_LIPIDS" text="ERROR" var="TABLE_HEADER_LIPIDS"/>
<spring:message code="TABLE_HEADER_CARBS" text="ERROR" var="TABLE_HEADER_CARBS"/>
<spring:message code="BUTTON_DELETE_MENU" text="ERROR" var="BUTTON_DELETE_MENU"/>
<spring:message code="FORM_MENU_FOOD_ALREF" text="ERROR" var="FORM_MENU_FOOD_ALREF"/>
<spring:message code="BUTTON_ADD_FOOD" text="ERROR" var="BUTTON_ADD_FOOD"/>
<spring:message code="TERMINATE_BUTTON" text="ERROR" var="TERMINATE_BUTTON"/>



	<input type="hidden" name="afficheDetail" id="afficheDetail" value="${afficheDetailMenu}"/>
	<input type="hidden" name="afficheAjoutAliment" id="afficheAjoutAliment" value="${afficheAjoutAliment}"/>
	
	<div class="containerSelectionMenu">
		<form action="editionMenu/selectionMenuAEditer" method="post">
			<select name="selectionMenu" id="selectionMenu" >
				<core:forEach var="menu" items="${listeMenus}">
					<core:choose>
					    <core:when test="${idMenuEnCours == menu.id}">
					        <option value="${menu.id}" selected="selected"> ${menu.nom}</option>
					    </core:when>    
					    <core:otherwise>
					        <option value="${menu.id}"> ${menu.nom}</option>
					    </core:otherwise>
					</core:choose>
				</core:forEach>	
			</select>
			<input type="submit" class="btn btn-sm btn-primary btn-create" value ="${BUTTON_SELECTION }"/>
		</form>
		<form action="editionMenu/afficherAjoutMenu" method="post">
			<input type="submit" class="btn btn-sm btn-primary btn-create" value ="${BUTTON_CREATE_MENU }"/>
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
		                        <label for="status" class="col-sm-3 control-label">${FORM_MENU_FOOD_ALREF }</label>
		                        <div class="col-sm-9">
		                            <select class="form-control" name="selectionAlimentRef">
										<core:forEach var="aliment" items="${alsRef}">
											<option value="${aliment.id}"> ${aliment.nom}</option>
										</core:forEach>	
									</select><br/>
		                        </div>
		                    </div> 
		                    <div class="form-group">
		                        <label for="status" class="col-sm-3 control-label">${TABLE_HEADER_QUANTITY }</label>
		                        <div class="col-sm-9">
		                            <input type="number" required="required" value="0" class="form-control" id="quantite" name="quantite" min="0" step="0.01"/>
		                        </div>
		                    </div>
		          			<div class="row">
				                <div class="col-xs-12">
									<button type="submit" class="btn btn-primary btn-block">${BUTTON_ADD_FOOD }</button>
				                </div>                
				            </div>
				            <div class="row">
				                <div class="col-xs-12">
				                    <hr style="border:1px dashed #dddddd;">
				                    <a href="editionMenu/finAjout" class="btn btn-primary btn-block" id="btnTerminer">${TERMINATE_BUTTON }</a>
				                </div>                
				            </div>
		                </div>
		                       
		        </div>
			</div>
		</div>
	</form>
	</div>
	<div class="container" id="container">
    <div class="row">
    	<div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title">${TABLE_TITLE_FOODD_LIST_IN_MENU}</h3>
                  </div>
                  <div class="col col-xs-6 text-right">
                  	<form action="editionAlimentMenu/afficherAjout" method="post">
                  		<input type="hidden" name="idMenu" value="${idMenu}"/>
                  		<button type="submit" class="btn btn-sm btn-primary btn-create">${BUTTON_ADD_FOOD }</button>
                  	</form>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                    	<th scope="col">Action</th>
                          <th scope="col">${TABLE_HEADER_FOOD_NAME }</th>
					      <th scope="col">${TABLE_HEADER_QUANTITY }</th>
					      <th scope="col">${TABLE_HEADER_CALORIES }</th>
					      <th scope="col">${TABLE_HEADER_VEGETAL_PROTEINS}</th>
					      <th scope="col">${TABLE_HEADER_ANIMAL_PROTEINS }</th>
					      <th scope="col">${TABLE_HEADER_LIPIDS }</th>
					      <th scope="col">${TABLE_HEADER_CARBS }</th>
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
		<button type="submit" class="btn btn-sm btn-primary btn-create" id="deleteMenuBtn">${BUTTON_DELETE_MENU }</button>
	</form>
</div>
</body>
</html>