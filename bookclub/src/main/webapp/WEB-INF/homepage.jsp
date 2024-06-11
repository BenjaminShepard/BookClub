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
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="/css/sketchy.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container border border-2 border-primary">
		<h1>Welcome, <c:out value="${user.username}" /></h1>
		<p>Books from everyone's shelves:</p>
		<a href="/books/new">Add a new book!</a>
		<table class="table mx-auto align-center text-center">
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Posted By</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${books}">
					<tr>
						<td>${book.id}</td>
						<td><a href="/books/${book.id}">${book.title}</a></td>
						<td>${book.author}</td>
						<td>${book.user.username}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/logout">Logout</a>
	</div>
</body>
</html>