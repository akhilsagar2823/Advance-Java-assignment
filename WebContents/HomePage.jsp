<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="advjava.assignment.*"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
<title>HomePage</title>
<link rel="stylesheet" href="css/homep.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style type="text/css">
	body
	{
		background-color: #e3d3cc;
	}
</style>
</head>
<body>
<p id="head">Home Page</p>
<%

	String userName = (String) session.getAttribute("userName");
	session.getMaxInactiveInterval();
	if(userName==null){
		response.sendRedirect("LoginPage.html");
	}
	
%>


<%	
		Connection 	con = ConnectonBuilder.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs= stmt.executeQuery("SELECT p.partyId,firstName,lastName,address,city,state,country,zip,phone,emailId,u.userId "
										+"FROM party p,userlogin u WHERE p.partyId = u.partyId;");
%>		
		<form action="delete" method="get">
		<div class="rectangle" id="tb">
		<div class="divTable" id = "pd">
			<div class="headRow">
				<div class="divCell"><b> PartyId </b></div>
				<div class="divCell"><b> First Name </b></div>
				<div class="divCell"><b> Last Name </b></div>				
				<div class="divCell"><b> Address </b></div>
				<div class="divCell"><b> City </b></div>
				<div class="divCell"><b> State </b></div>
				<div class="divCell"><b> Country </b></div>
				<div class="divCell"><b> Pin Code </b></div>
				<div class="divCell"><b> Phone </b></div>
				<div class="divCell"><b> Email Id </b></div>
				<div class="divCell"><b> User Id </b></div>
				<div class="divCell"><b> Delete </b></div>
				<div class="divCell"><b> Update </b></div>
			</div><%
			while(rs.next()){
				%>
				<div class="divRow"><%
					for(int i=1;i<12;i++){
						%><div class="divCell"><%=
							rs.getString(i)
						%></div><%
					} 
					%>
					<div class="divCell" ><center><input type="checkbox" name="<%= rs.getString(1) %>" id="del"></center></div>
					<div class="divCell"><center><a href = "UpdateDetails.jsp?updateId=<%= rs.getString(1) %>"><button type="button" id = "upd">
						Update
					</button></a></center></div>
					 <%

				%></div><%
			}
			%></div></div>
			<div class="rectangle" id="dbox">
			<div class="sb">
			<button type="submit" id="sub">Delete</button>
		</div></div>
			</form>
	<div class="rectangle" id="sbox">
		<div class="sb"><form action="SearchDetails.jsp" method="get">
			<input type="text" placeholder="Search..." name="search" id="search" required>
			<button type="submit" id="ffs"><i class="fa fa-search"></i></button>
		</form></div>
	</div>
		<div class="rectangle" id="lbox">
		<div class="sb"><form action="logout" method="get">
			<button type="submit" id="sub">Logout</button>
		</form></div>
	</div>
</body>
</html>