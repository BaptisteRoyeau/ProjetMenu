<html>
<head>
<base href="<%=request.getScheme() + "://"
		+ request.getServerName() + ":"
		+ request.getServerPort()
		+ request.getContextPath() + "/"
		%>" />
</head>
<body>
	<jsp:forward page="login"></jsp:forward>
</body>
</html>
