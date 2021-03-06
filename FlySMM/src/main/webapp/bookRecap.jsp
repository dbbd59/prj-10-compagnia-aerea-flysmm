<%@page import="booking.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="sale.Flight"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<font face="Arial" />
<!-- Inizio sezione per Semantic ui -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/semantic-ui/0.19.3/css/semantic.css"
	rel="stylesheet" />
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/semantic-ui/0.19.3/javascript/semantic.js"></script>
<!-- Fine sezione per Semantic ui -->
<title>FlySMM</title>
</head>
<body>
	<div class="ui stackable inverted menu">

		<a href="index.jsp" class="item">FlySMM</a> 

		<%
			if (request.getSession().getAttribute("customer") == null) {
		%>

		<a href="loginPage.html" class="right item"> Login </a>

		<%
			} else {
		%>
		<%
			if (request.getSession().getAttribute("customer").getClass().toString()
						.matches("class customer.FidelityCustomer")) {
		%>
		<a href="homeFidelityCustomer.jsp" class="right item"> Home </a>
		<%
			} else {
		%>
		<a href="homeCustomer.jsp" class="right item"> Home </a>
		<%
			}
		%>

		<!-- <a href="./logoutServlet " class="right item"> Home </a> -->
		<a href="./logoutServlet " class="right item"> Log out </a>

		<%
			}
		%>
	</div>
	<table class="ui celled table">
		<thead>
			<tr>
				<th>Book Id</th>
				<th>Flight Id</th>
				<th>Fiscal code passenger</th>
				<th>Departure Date</th>
				<th>Airplane Id</th>
				<th>Price</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${listBook}" var="book">
				<tr>
					<td>${book.bookId}</td>
					<td>${book.flightId}</td>
					<td>${book.documentP}</td>
					<td>${book.departureDate}</td>
					<td>${book.airplaneId}</td>
					<td>${book.totalPrice}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tr>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th>Total Price</th>
			<th>${totalPrice}</th>
		</tr>
		</tfoot>
	</table>


	<%
		Flight f = (Flight) request.getSession().getAttribute("chosenDeparture");
		Date d = new Date();
		if ((f.getDepartureDate().getTime() - d.getTime()) < (86400000 * 3)) {
	%>
	<form class="ui form" name="payment" method="post"
		action="./LastMinutePayment">
		<input class="ui red submit button" type="submit" value="Pay!">
		<input type="hidden" name="command" value="Payment"> 
	</form>
	<%
		} else {
	%>

	<form class="ui form" name="fSearchFly" method="post"
		action="./BookServlet">
		<input class="ui blue submit button" type="submit" value="Book!">
		<input type="hidden" name="command" value="Book" />
	</form>
	<%
		}
	%>



	<!-- <form class="ui form" name="fSearchFly" method="post"
		action="./BookServlet">
		<input class="ui blue submit button" type="submit" value="Book!">
		<input type="hidden" name="command" value="Book" />
	</form> -->
</body>
</html>
