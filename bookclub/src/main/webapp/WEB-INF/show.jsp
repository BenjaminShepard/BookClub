<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!-- For JSTL Forms -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<meta charset="ISO-8859-1">
<title>Book Details</title>
<link rel="stylesheet" type="text/css" href="/css/sketchy.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container border border-2 border-primary">
		<h1>Book Details</h1>
			<p>Title: ${book.title}</p>
			<p>Author: ${book.author}</p>
			<p>Thoughts: ${book.thoughts}</p>
			<p>Posted By: ${book.user.username}</p>
			
			
		<a href="/books">Back to All Books</a>
	</div>
</body>
</html>