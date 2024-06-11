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
<title>Edit Book</title>
<link rel="stylesheet" type="text/css" href="/css/sketchy.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>Edit ${book.title}</h1>
	
	<form:form action="/books/${book.id}" method="post" modelAttribute="book">
		<form:input path="id" type="hidden" name="bookId" value="${book.id}" />
		<input type="hidden" name="_method" value="put">
			<form:label path="title">Book Title:</form:label>
			<form:errors path="title" class="form-control"/>
			<form:input path="title" class="form-control"/>
			
			<form:label path="author">Author:</form:label>
			<form:errors path="author" class="form-control"/>
			<form:input path="author" class="form-control"/>
			
			<form:label path="thoughts">Thoughts:</form:label>
			<form:errors path="thoughts" class="form-control"/>
			<form:input type="textarea" path="thoughts" class="form-control"/>
			
		<button type="submit" class="btn btn-primary mt-3">Submit</button>
	</form:form>
</body>
</html>