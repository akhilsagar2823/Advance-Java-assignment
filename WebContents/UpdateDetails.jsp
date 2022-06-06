<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="updateD.css">
<style>.rectangle#sbox
{
	position: fixed;
	margin-left: 1250px;
	margin-top: 130px;
	margin-right: 50px;
	background-color: #4b4949;
}
.rectangle#ubox
{
	position: fixed;
	margin-left: 1250px;
	margin-top: 250px;
	margin-right: 50px;
	background-color: #4b4949;
}button#sub
{
	background-color: #ccc;
	border: 1px solid black;
	width: 300px;
	height: 45px;
	font-size: x-large;
	font-family: cursive;
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
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava_assignment","root","123456");
		Statement stmt = con.createStatement();
		ResultSet rs= stmt.executeQuery("SELECT * FROM party,userlogin where userlogin.partyId = (SELECT partyId FROM userlogin WHERE userId = '"
										+userName+"') AND party.partyId = userlogin.partyId;");
		rs.next();
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
				
		</div></div><%
	}catch(ClassNotFoundException | SQLException  e) {
		//e.printStackTrace(out);
	}
%>
	<form action="/update" method="get">
	<div class="rectangle" id="sbox">
		<div class="sb">
		<label for="details">Select :</label><br>
		<select name="details" id="details">
			<option value="firstName">First Name</option>
			<option value="lastName">Last Name</option>
			<option value="address">Address</option>
			<option value="city">City</option>
			<option value="state">State</option>
			<option value="country">Country</option>
			<option value="zip">Pin Code</option>
			<option value="phone">Phone</option>
			<option value="userId">User Id</option>
		</select>
		</div>
	</div>
	<div class="rectangle" id="ubox">
		<div class="sb">
			<button type="submit" id="sub">Confirm Update</button>
		</div>
	</div>
	</form>
</body>
</html>