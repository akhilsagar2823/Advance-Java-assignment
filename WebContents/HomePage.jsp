<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@page import="java.sql.*" %>
<link rel="stylesheet" href="homep.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Home</title>
</head>
<body>
<p id="head">Home Page</p>
<%
	try {
		String userName = (String) session.getAttribute("userName");
		session.getMaxInactiveInterval();
		if(userName==null){
			response.sendRedirect("LoginPage.html");
		}
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava_assignment","root","123456");
		Statement stmt = con.createStatement();
		ResultSet rs= stmt.executeQuery("SELECT * FROM party;");
		%>
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
			</div><%
			while(rs.next()){
				%><div class="divRow"><%
					for(int i=1;i<10;i++){
						%><div class="divCell"><%=
							rs.getString(i)
						%></div><%
					} 
				%></div><%
			}
			%></div></div><%
	}catch(ClassNotFoundException | SQLException  e) {
		//e.printStackTrace(out);
	}
%>

	<div class="rectangle" id="sbox">
		<div class="sb"><form action="SearchDetails.jsp" method="get">
			<input type="text" placeholder="search by name..." name="search" id="search" required>
			<button type="submit" id="ffs"><i class="fa fa-search"></i></button>
		</form></div>
	</div>
	<div class="rectangle" id="dbox">
		<div class="sb"><form action="DeleteDetails.jsp" method="get">
			<button type="submit" id="sub">Delete</button>
		</form></div>
	</div>
	<div class="rectangle" id="ubox">
		<div class="sb"><form action="UpdateDetails.jsp" method="get">
			<button type="submit" id="sub">Update</button>
		</form></div>
	</div>
		<div class="rectangle" id="lbox">
		<div class="sb"><form action="logout" method="get">
			<button type="submit" id="sub">Logout</button>
		</form></div>
	</div>
</body>
</html>