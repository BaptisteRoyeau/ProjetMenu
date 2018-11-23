<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
	<title>iDiet</title>
	<%-- <decorator:title></decorator:title> --%>
	<base href="<%= request.getScheme() + "://" + //http ou https
				   request.getServerName() + ":" + // localhost
				   request.getServerPort() + //8080
				   request.getContextPath() + "/" // /Formation
				   %>" />
				   
	<!-- <link rel="stylesheet" href="/Formation/src/main/webapp/style.css"> -->
	
	<decorator:head></decorator:head>
</head>
<body>
	<jsp:include page="header.jsp">
            <jsp:param name="header" value="0"/>
    </jsp:include>
	
	
	<decorator:body></decorator:body>
	
<%-- 	<jsp:include page="footer.jsp">
            <jsp:param name="footer" value="0"/>
        </jsp:include> --%>
</body>
</html>