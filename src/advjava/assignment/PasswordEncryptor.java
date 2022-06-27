package advjava.assignment;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordEncryptor {
	public static String encrypt(String password) {
		String encryptedpassword = null;  
        try   
        {  
            MessageDigest encryptor = MessageDigest.getInstance("MD5");  
            encryptor.update(password.getBytes());                
            byte[] bytes = encryptor.digest();                
            StringBuilder s = new StringBuilder();  
            for(int i=0; i< bytes.length ;i++)  
            {
                s.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));  
            }                
            encryptedpassword = s.toString();  
        }   
        catch (NoSuchAlgorithmException e)   
        {
            e.printStackTrace();  
        }            
		return encryptedpassword;
	}
}
