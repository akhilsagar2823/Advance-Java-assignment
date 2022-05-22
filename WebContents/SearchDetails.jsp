<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Details</title>
<%@page import="java.sql.*" %>
<link rel="stylesheet" href="search.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<p id="head">Search Details</p>
<%	
	String search = request.getParameter("search");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava_assignment","root","123456");
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM party WHERE FirstName = ?;");
		stmt.setString(1, search);
		ResultSet rs= stmt.executeQuery();
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
				<div class="divCell"><b> Zip </b></div>
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
		<div class="rectangle" id="home">
		<div class="sb"><form action="HomePage.jsp" method="post">
			<button type="submit" id="ffh">Home <i class="fa fa-home"></i></button>
		</form></div>
		</div>
</body>
</html>