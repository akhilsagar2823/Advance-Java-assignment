<%@page import="advjava.assignment.ConnectonBuilder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/updateD.css">
<style type="text/css">
	body
	{
		background-color: #e3d3cc;
	}
</style>
<title>Update</title>
</head>
<body>
<p id="head">Update Page</p>
<%
	try {
		String userName = (String) session.getAttribute("userName");
		session.getMaxInactiveInterval();
		if(userName==null){
			response.sendRedirect("LoginPage.html");
		}
		Connection con = ConnectonBuilder.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs= stmt.executeQuery("SELECT * FROM party,userlogin where party.partyId = '"
										+request.getParameter("updateId")+"'AND party.partyId = userlogin.partyId;");
		rs.next();
		
		String partyId = request.getParameter("updateId");
		session.setAttribute("partyId",partyId );	
		
		%>
		<div class="rectangle" id="tb">
		<div class="divTable" id = "pd">
			<div class="divRow">
				<div class="divCell"><b> PartyId </b></div>
				<div class="divCell"> <%=rs.getString(1)%> </div>
			</div>
			<div class="divRow">
				<div class="divCell"><b> FirstName </b></div>
				<div class="divCell"> <%=rs.getString(2)%> </div>
			</div>
			<div class="divRow">
				<div class="divCell"><b> LastName </b></div>
				<div class="divCell"> <%=rs.getString(3)%> </div>
			</div>
			<div class="divRow">				
				<div class="divCell"><b> Address </b></div>
				<div class="divCell"> <%=rs.getString(4)%> </div>
			</div>
			<div class="divRow">
				<div class="divCell"><b> City </b></div>
				<div class="divCell"> <%=rs.getString(5)%> </div>
			</div>
			<div class="divRow">
				<div class="divCell"><b> State </b></div>
				<div class="divCell"> <%=rs.getString(6)%> </div>
			</div>
			<div class="divRow">
				<div class="divCell"><b> Country </b></div>
				<div class="divCell"> <%=rs.getString(7)%> </div>
			</div>
			<div class="divRow">
				<div class="divCell"><b> Pin Code </b></div>
				<div class="divCell"> <%=rs.getString(8)%> </div>
			</div>
			<div class="divRow">
				<div class="divCell"><b> Phone </b></div>
				<div class="divCell"> <%=rs.getString(9)%> </div>
			</div>
			<div class="divRow">
				<div class="divCell"><b> User Id </b></div>
				<div class="divCell"> <%=rs.getString(10)%> </div>
			</div>
			<div class="divRow">
				<div class="divCell"><b> Email Id </b></div>
				<div class="divCell"> <%=rs.getString(11)%> </div>
			</div>
				
		</div></div><%
	}catch(SQLException  e) {
	}
%>
	<form action="update" method="get">
	<div class="rectangle" id="sbox">
		<div class="sb">
		<label for="details">Select :</label><br>
		<select name="column" id="details" >
			<option value="firstName">First Name</option>
			<option value="lastName">Last Name</option>
			<option value="address">Address</option>
			<option value="city">City</option>
			<option value="state">State</option>
			<option value="country">Country</option>
			<option value="zip">Pin Code</option>
			<option value="phone">Phone</option>
			<option value="userId">User Id</option>
			<option value="emailId">Email Id</option>
			
		</select>
		</div>
	</div>

	<div class="rectangle" id="dbox">
		<div class="sb">
			<input type="text" name="newValue" placeholder="Enter new value">
		</div>
	</div>
	<div class="rectangle" id="ubox">
		<div class="sb">
			<button type="submit" id="sub">Confirm Update</button>
		</div>
	</div>
	</form>
	<div class="rectangle" id="home">
		<div class="sb"><form action="HomePage.jsp" method="post">
			<button type="submit" id="ffh">Home <i class="fa fa-home"></i></button>
		</form></div>
		</div>
	
</body>
</html>