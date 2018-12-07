<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
</head>
<body>
	<spring:message code="CREATE_BTN" text="texte par défaut si aucune clé n’est trouvée" var="CREATE_BTN"/>
	<form action="editionMenu/ajoutMenu" method="post">
		<spring:message code="FORM_CREATE_MENU_NAME" text="texte par défaut si aucune clé n’est trouvée"/><input type="text" required="required" name="nom"/>
		<input type="submit" value="${CREATE_BTN}"/>
	</form>
</body>
</html>