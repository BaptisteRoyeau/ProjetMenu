<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
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
	<div class="containerSelectionMenu">
		<form action="editionMenu/selectionMenuAEditer" method="post">
			<select name="selectionMenu" >
				<core:forEach var="menu" items="${listeMenus}">
					<option value="${menu.id}"> ${menu.nom}</option>
				</core:forEach>	
			</select>
			<input type="submit" value ="Selectionner"/>
		</form>
		<form action="editionMenu/afficherAjoutMenu" method="post">
			<input type="submit" value ="Créer un nouveau menu"/>
		</form>
	</div>
</body>
</html>