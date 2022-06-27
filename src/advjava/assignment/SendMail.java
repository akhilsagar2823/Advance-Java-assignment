package advjava.assignment;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(asyncSupported = true, urlPatterns = { "/sendmail" })
public class SendMail extends HttpServlet {
 public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
	 PrintWriter out = res.getWriter();
	 String to = (String) req.getAttribute("emailId");
	 String text="Hello, "+req.getAttribute("name")+"\n\n"+
			 	"You have successflly registred to the assignment web application of Akhilsagar Prajapat.\n"+
			 	"Your User Id is "+req.getAttribute("userId")+".\n\n"+
			 	"Thankyou\n";
     try {    
		 Properties properties = new Properties();    
	     properties.put("mail.smtp.host", "smtp.gmail.com");    
         properties.put("mail.smtp.socketFactory.port", "465");    
         properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");    
         properties.put("mail.smtp.auth", "true");    
	     properties.put("mail.smtp.port", "465");
	     Session session = Session.getInstance(properties, new Authenticator() {
	    	    @Override
	    	    protected PasswordAuthentication getPasswordAuthentication() {
	    	        return new PasswordAuthentication("akhilprajapat28@gmail.com", "ijnvpecbjgrnbqoh");
	    	    }
	    	});	     session.getDebug();
      MimeMessage message = new MimeMessage(session);    
      message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
      message.setSubject("Registration Successful !!");    
      message.setText(text);    
      Transport.send(message);
      RequestDispatcher rd = req.getRequestDispatcher("LoginPage.html");
      rd.forward(req, res);
     } catch (MessagingException | ServletException e) {
    	 e.printStackTrace();	 
     }    

 }
}
