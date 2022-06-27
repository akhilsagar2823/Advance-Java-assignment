<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Details</title>
<%@page import="java.sql.*,advjava.assignment.*" %>
<link rel="stylesheet" href="css/homep.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<style type="text/css">
	body
	{
		background-color: #e3d3cc;
	}
</style>
</head>
<body>
<p id="head">Search Details</p>
<%	
		String userName = (String) session.getAttribute("userName");
		session.getMaxInactiveInterval();
		if(userName==null){
			response.sendRedirect("LoginPage.html");
		}
		Connection con = ConnectonBuilder.getConnection();
		String search = request.getParameter("search");
		String query = "SELECT p.partyId,firstName,lastName,address,city,state,country,zip,phone,emailId,u.userId "
						+"FROM party p,userlogin u WHERE p.partyId = u.partyId ;";
		Statement stmt = con.createStatement();
		ResultSet rs= stmt.executeQuery(query);
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
			String queryRow;
			while(rs.next()){
				queryRow="";
				for(int j=1;j<12;j++){
					queryRow = queryRow + rs.getString(j);	
				}
				%><div class="divRow"><%
				if(queryRow.contains(search)==true){
					for(int i=1;i<12;i++){
						%><div class="divCell"><%=
							rs.getString(i)
						%></div><%
					} 
					%>
					<div class="divCell" ><center><input type="checkbox" name="<%= rs.getString(1) %>" id="del"></center></div>
					<div class="divCell"><center><a href = "UpdateDetails.jsp?updateId=<%= rs.getString(1) %>"><button type="button" id = "upd">
						Update
					</button></center></a></div>
					 <%
				}
				%></div><%
			}
			%></div></div>
			<div class="rectangle" id="dbox">
			<div class="sb">
			<button type="submit" id="sub">Delete</button>
		</div></div>
			</form>
		<div class="rectangle" id="lbox">
		<div class="sb"><form action="logout" method="get">
			<button type="submit" id="sub">Logout</button>
		</form></div>
		</div>
		
		<div class="rectangle" id="home">
		<div class="sb"><form action="HomePage.jsp" method="post">
			<button type="submit" id="ffh">Home <i class="fa fa-home"></i></button>
		</form></div>
		</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous">
	</script>
</body>
</html>