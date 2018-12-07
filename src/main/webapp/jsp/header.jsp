<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
	
	<link rel="stylesheet" href="css/header.css" type="text/css" />	  
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- css/js navbar source -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="retourAccueil"><span class="glyphicon glyphicon-home"> iDiet</a>
    </div>
    <ul class="nav navbar-nav">
      <!-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li> -->
      <li><a href="editionMenu/afficherListeMenus"><spring:message code="NAVBAR_MENU" text="texte par défaut si aucune clé n’est trouvée"/></a></li>
      <li><a href="editionAlimentRef"><spring:message code="NAVBAR_REF_FOOD" text="texte par défaut si aucune clé n’est trouvée"/></a></li>
      <li><a href="retourAccueil"><spring:message code="NAVBAR_CONTACT_US" text="texte par défaut si aucune clé n’est trouvée"/></a></li>
      <li><a href="retourAccueil"><spring:message code="NAVBAR_QUESTION" text="texte par défaut si aucune clé n’est trouvée"/></a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="espacePerso/afficher"><span class="glyphicon glyphicon-user"></span><spring:message code="NAVBAR_MY_ACCOUNT" text="texte par défaut si aucune clé n’est trouvée"/></a></li>
      <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span><spring:message code="NAVBAR_LOGOUT" text="texte par défaut si aucune clé n’est trouvée"/></a></li>
    </ul>
  </div>
</nav>
	
	

