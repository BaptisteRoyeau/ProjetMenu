<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                    <h3 class="panel-title"><b>${utilisateur.username}</b>, voici les informations de votre compte <b>iDiet</b> : </h3>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                          <th scope="col">Prénom</th>
                          <td>${utilisateur.username}</td>
                    </tr> 
                  </thead>
                  <tbody>
						<tr>
							<th scope="col">Nom</th>
							<td>${utilisateur.firstName}</td>
						</tr>
					 </tbody>
					 <tbody>
						<tr>
							<th scope="col">Sexe</th>
							<td>${utilisateur.sexe}</td>
						</tr>
					 </tbody>
					 <tbody>
						<tr>
							<th scope="col">Taille</th>
							<td>${utilisateur.taille} cm</td>
						</tr>
					 </tbody>
					 <tbody>
						<tr>
							<th scope="col">Poids</th>
							<td>${utilisateur.poids} kg</td>
						</tr>
					 </tbody>
					 <tbody>
						<tr>
							<th scope="col">Email</th>
							<td>${utilisateur.email}</td>
						</tr>
					 </tbody>
                </table>
            
              </div>
            </div>

</div></div></div>
</body>
</html>