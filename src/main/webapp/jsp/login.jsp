<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="icon" type="image/png" href="iconBurger.png"/>
<base href="<%=request.getScheme() + "://"
		+ request.getServerName() + ":"
		+ request.getServerPort()
		+ request.getContextPath() + "/"
		%>" />
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/login.css" type="text/css" />
<title>iDiet</title>
</head>
<body>
	<%-- <h2>Accueil - Login</h2>

	<form action="identification" method="post">
		Login : <input type="text" name="username" id="username" placeholder="Votre login"/>
		Mot de passe : <input type="password" name="password" id="password" placeholder="Votre login"/>
		<input type="submit"/>
	</form>
	${erreurConnexion} 
	
	<a href="inscription">Inscription</a>  --%>
	
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3>Authentification</h3>
					<!-- <div class="d-flex justify-content-end social_icon">
						<span><i class="fab fa-facebook-square"></i></span> <span><i
							class="fab fa-google-plus-square"></i></span> <span><i
							class="fab fa-twitter-square"></i></span>
					</div> -->
				</div>
				<div class="card-body">
					<form action="identification" method="post">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="Nom d'utilisateur" name="username">

						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="Mot de passe" name="password">
						</div>
						<div class="d-flex justify-content-left">
							<a id="forgetPassword" href="#">Mot de passe oublié ? </a>
						</div>
						<div class="form-group">
							<input type="submit" value="GO" class="btn float-right login_btn">
						</div>
						<!-- <div class="row align-items-center remember">
							<input type="checkbox">Remember Me
						</div> -->
						
					</form>		
				</div>
				<div class="card-body">
					Vous n'avez pas de compte ? <a id="creer" href="inscription">&nbsp Créer</a>
				</div>
				<div class="card-footer">
					<div class="d-flex justify-content-center links">
						<!-- <a id="btnDemo" href="#" >DÉMO</a> -->
						<form action="identification" method="post">
							<input type="hidden" class="form-control" name="username" value="Demo">
							<input type="hidden" class="form-control" name="password" value="demo">
							<input type="submit" value="Démo">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>