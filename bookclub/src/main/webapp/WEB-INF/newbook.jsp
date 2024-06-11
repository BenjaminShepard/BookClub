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
<title>New Book</title>
<link rel="stylesheet" type="text/css" href="/css/sketchy.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container border border-2 border-primary">	
		<h1>Add a Book to Your Shelf!</h1>
		<form:form action="/books/create" method="post" modelAttribute="book">
			<p>
				<form:label path="title">Title:</form:label>
				<form:errors path="title" class="text-danger" />
				<form:input path="title" />
			</p>
			<p>
				<form:label path="author">Author:</form:label>
				<form:errors path="author" class="text-danger" />
				<form:input path="author" />
			</p>
			<p>
				<form:label path="thoughts">Thoughts:</form:label>
				<form:errors path="thoughts" class="text-danger" />
				<form:textarea path="thoughts" />
			</p>
			<input type="submit" value="Add Book" />
		</form:form>
		<a href="/books" class="mb-3">Back to Book List</a>
	</div>
</body>
</html>