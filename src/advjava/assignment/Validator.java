package advjava.assignment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(asyncSupported = true, urlPatterns = { "/HomePage" })
public class Validator extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String userLoginID = req.getParameter("userName");
		String password = req.getParameter("password");
		password = PasswordEncryptor.encrypt(password);
		boolean invalid = true;
		
		PrintWriter out = res.getWriter();
		
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava_assignment","root","123456");
			
			Statement st = con.createStatement();
						
			ResultSet rs = st.executeQuery("select * from userlogin");
			HttpSession httpSession = req.getSession(true);
			RequestDispatcher rd;
			while(rs.next()) {
				if(userLoginID.equals(rs.getString(1)) || userLoginID.equals(rs.getString(2))) {
					if(password.equals(rs.getString(3))) {
						invalid = false;
					
						httpSession.setAttribute("userName", userLoginID);
						httpSession.setMaxInactiveInterval(300);
			            out.println("<script type=\"text/javascript\">");
			            out.println("alert('Login successfull');");
			            out.println("</script>");
			            rd = req.getRequestDispatcher("HomePage.jsp");
			            rd.include(req, res);
					}
				}
			}
			if(invalid==true) {
	            out.println("<script type=\"text/javascript\">");
	            out.println("alert('User or password incorrect please try again!');");
	            out.println("</script>");
	            rd = req.getRequestDispatcher("LoginPage.html");	            
	            rd.include(req, res);
			}
				
		}catch(Exception e) {	
			e.printStackTrace(out);
		}
	}
}
