<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/inscription.css">
<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
<base href="<%=request.getScheme() + "://"
		+ request.getServerName() + ":"
		+ request.getServerPort()
		+ request.getContextPath() + "/"
		%>" />
<meta charset="ISO-8859-1">
<title>Inscription</title>
</head>
<body>
	<!-- <form action="ajoutUtilisateur" method="post">
		Votre nouvel identifiant : <input type="text" name="username" placeholder="Identifiant"/>
		Votre nouveau mot de passe : <input type="password" name="password" placeholder="Mot de passe"/>
		Votre adresse : <input type="text" name="adresse" placeholder="Votre adresse"/>
		<input type="submit" value="Inscription"/>
	</form> -->
	<input id="preSelectSexe" type="hidden" value="${sexe}">
	
	<div class="container">
			<div class="row main">
				<div class="main-login main-center">
					<form class="form-horizontal" method="post" action="ajoutUtilisateur">
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Prénom</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="username" id="username"  placeholder="Enter your first name" value="${username}" required="required"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Nom</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="lastName" id="lastName"  placeholder="Enter your last name" value="${lastName}" required="required"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<!-- <label for="sexe">Sexe</label> -->
								<div class="cols-sm-10">
									<div class="input-group">  
										<label for="sexe" class="cols-sm-2 control-label">Sexe</label></br>
										Homme <input type="radio" name="sexe" id="sexeH" value="Homme" required="required"/> 
										
										Femme <input type="radio" name="sexe" id="sexeF" value="Femme" required="required"/>
 									</div>
								</div> 
						</div>
				
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Taille (cm)</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
										<input type="number"  step="0,01" min="0" class="form-control" name="taille" id="taille" value="${size}" required="required"/>
									</div>
								</div>
						</div>
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Poids (kg)</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
										<input type="number"  step="0,01" min="0" class="form-control" name="poids" id="poids" value="${weight}" required="required"/>
									</div>
								</div>
						</div>
	
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Email</label>
							<div class="emailError" id="emailError">${emailError}</div>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email" required="required"/>
								</div>
							</div>
						</div>

						

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Mot de passe</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password" required="required"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="confirmPassword" class="cols-sm-2 control-label">Confirmer votre mot de passe</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="confirmPassword" id="confirm_password"  placeholder="Enter your Password" required="required"/>
								</div>
							</div>
						</div>

						<div class="form-group ">
							<input type="submit" class="btn btn-primary btn-lg btn-block login-button" value="S'enregistrer"/>
						</div>
						
						
					</form>
				</div>
			</div>
		</div>
		
		<script src="js/inscription.js"></script>
</body>
</html>