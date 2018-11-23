<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

	<form action="editionMenu/ajoutMenu" method="post">
		Nom du menu : <input type="text" required="required" name="nom"/>
		<input type="submit" value="Créer"/>
	</form>
</body>
</html>