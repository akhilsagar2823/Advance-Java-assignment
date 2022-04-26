
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
</head>
<body>
<center><h1><b>Register New User</b></h1></center>
<form action = "register" method="post">
<table align = "center">
	<tr><td align = "left">First Name : </td><td><input type = "text" name = "first" required></td></tr>
	<tr><td align = "left">Last Name : </td><td><input type = "text" name = "last" required></td></tr>
	<tr><td align = "left">Address  : </td><td><input type = "text" name = "add"></td></tr>
	<tr><td align = "left">City : </td><td><input type = "text" name = "city"></td></tr>
	<tr><td align = "left">State : </td><td><input type = "text" name = "state"></td></tr>
	<tr><td align = "left">Country : </td><td><input type = "text" name  = "country"></td></tr>
	<tr><td align = "left">Zip : </td><td><input type = "number" name = "zip" required></td></tr>
	<tr><td align = "left">Phone : </td><td><input type = "number" name = "phn"></td></tr>
</table>
<br><br>
<table align ="center">
	<tr><td align = "left">User Id : </td><td><input type = "text" name = "user" required></td></tr>
	<tr><td>Password : </td><td><input type = "password" name = "pass" required></td></tr>	
</table>
<table align = "center">
	<tr align = "center"><td><a href="LoginPage.jsp">Already registered , Login</a></td></tr>
					<tr><td>-------------------------------</td></tr>
	<tr align = "center"><td><input type = "submit" ></td></tr>
</table>
</form>
</body>
</html>