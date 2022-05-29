<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="deleteDetails.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@page import="java.sql.*" %>
<meta charset="ISO-8859-1">
<title>Delete Records</title>
</head>
<body>
<p id="head">Delete Details</p>

<form action="DeleteRecord.jsp" method="post">

<%
	try{
		String userName = (String) session.getAttribute("userName");
		session.getMaxInactiveInterval();
		if(userName==null){
			response.sendRedirect("LoginPage.html");
		}
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava_assignment","root","123456");
		Statement stmt = con.createStatement();
		ResultSet rs= stmt.executeQuery("SELECT * FROM party;");
		%>
		<div class="rectangle" id="tb">
		<div class="divTable" id = "pd">
			<div class="headRow">
				<div class="divCell"><b> Check Box </b></div>
				<div class="divCell"><b> PartyId </b></div>
				<div class="divCell"><b> FirstName </b></div>
				<div class="divCell"><b> LastName </b></div>				
				<div class="divCell"><b> Address </b></div>
				<div class="divCell"><b> City </b></div>
				<div class="divCell"><b> State </b></div>
				<div class="divCell"><b> Country </b></div>
				<div class="divCell"><b> Zip </b></div>
				<div class="divCell"><b> Phone </b></div>
			</div><%
			while(rs.next()){
				%><div class="divRow">
					<div class="divCell"><input type="checkbox" name="<%= rs.getString(1) %>"></div><%
					for(int i=1;i<10;i++){
						%><div class="divCell"><%=
							rs.getString(i)
						%></div><%
					}
				%></div><%
			}
		%></div></div><%
	}catch(SQLException  e){}
		%>
		<div class="rectangle" id="dbox">
		<button type="submit" id="del">Confirm Delete</button>
		</div>
	</form>

		<div class="rectangle" id="home">
		<div class="sb"><form action="HomePage.jsp" method="post">
			<button type="submit" id="ffh">Home <i class="fa fa-home"></i></button>
		</form></div>
		</div>
</body>
</html>