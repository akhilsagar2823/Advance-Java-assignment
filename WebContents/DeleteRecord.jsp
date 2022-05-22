<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@page import="java.sql.*" %>
<link rel="stylesheet" href="delsel.css">
<title>Confirmation</title>
</head>
<body>


	<%	
		try{
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava_assignment", "root","123456");
			
			Statement st1 = con.createStatement();

			PreparedStatement st3 = con.prepareStatement("DELETE FROM userlogin WHERE partyid=?");
			PreparedStatement st4 = con.prepareStatement("DELETE FROM party WHERE partyid=?");
			
			ResultSet rs = st1.executeQuery("SELECT * FROM party");
			while(rs.next()){
				String partyId = rs.getString(1);
				String sta = request.getParameter(partyId);
				
				if(sta!=null){
					st3.setString(1,partyId);
					st4.setString(1,partyId);
					st3.executeUpdate();
					st4.executeUpdate();
				}
			}
		}catch(SQLException e){
			out.print(e);
		}
	response.sendRedirect("HomePage.jsp");	  
%></body>
</html>