<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

<div class="container">
    <div class="row">
    	<div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title"><spring:message code="ACCOUNT_TABLE_TITLE" arguments="<b>${utilisateur.username}</b>,<b>iDiet</b>" text="texte par défaut si aucune clé n’est trouvée" /></h3>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                          <th scope="col"><spring:message code="ACCOUNT_TABLE_HEADER_FIRSTNAME" text="texte par défaut si aucune clé n’est trouvée" /></th>
                          <td>${utilisateur.username}</td>
                    </tr> 
                  </thead>
                  <tbody>
						<tr>
							<th scope="col"><spring:message code="ACCOUNT_TABLE_HEADER_LASTNAME" text="texte par défaut si aucune clé n’est trouvée" /></th>
							<td>${utilisateur.lastName}</td>
						</tr>
					 </tbody>
					 <tbody>
						<tr>
							<th scope="col"><spring:message code="ACCOUNT_TABLE_HEADER_SEX" text="texte par défaut si aucune clé n’est trouvée" /></th>
							<td>${utilisateur.sexe}</td>
						</tr>
					 </tbody>
					 <tbody>
						<tr>
							<th scope="col"><spring:message code="ACCOUNT_TABLE_HEADER_HEIGHT" text="texte par défaut si aucune clé n’est trouvée" /></th>
							<td>${utilisateur.taille} cm</td>
						</tr>
					 </tbody>
					 <tbody>
						<tr>
							<th scope="col"><spring:message code="ACCOUNT_TABLE_HEADER_WEIGHT" text="texte par défaut si aucune clé n’est trouvée" /></th>
							<td>${utilisateur.poids} kg</td>
						</tr>
					 </tbody>
					 <tbody>
						<tr>
							<th scope="col"><spring:message code="ACCOUNT_TABLE_HEADER_EMAIL" text="texte par défaut si aucune clé n’est trouvée" /></th>
							<td>${utilisateur.email}</td>
						</tr>
					 </tbody>
                </table>
            
              </div>
            </div>

</div></div></div>
</body>
</html>