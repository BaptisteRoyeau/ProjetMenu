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

</head>
<body>
	<h1>Bienvenue sur l'édition aliment menu pour le menu ${sessionScope.nomMenuEnCours}</h1>
	
	<form action="editionAlimentMenu/ajouterAlimentMenu" method="post">
		<select name="selectionAlimentRef" >
			<core:forEach var="aliment" items="${alsRef}">
				<option value="${aliment.id}"> ${aliment.nom}</option>
			</core:forEach>	
		</select>
		Quantité : <input type="number" name="quantite" step="0.01" min="0"/>
		<input type="submit" value ="Selectionner"/>
	</form>
</body>
</html>