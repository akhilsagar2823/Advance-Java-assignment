<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="advjava.assignment.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@page import="java.sql.*" %>
<link rel="stylesheet" href="css/homep.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Home</title>
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
				<div class="divCell"><b> FirstName </b></div>
				<div class="divCell"><b> LastName </b></div>				
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
					<div class="divCell"><input type="checkbox" name="<%= rs.getString(1) %>"></div>
					<div class="divCell"><a href = "UpdateDetails.jsp?updateId=<%= rs.getString(1) %>"><button type="button" id = "upd">
						Update
					</button></a></div>
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
			<input type="text" placeholder="search by name..." name="search" id="search" required>
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