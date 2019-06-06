package com.project.mail;

import java.util.Properties;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

public class Mail {

	
	public void mailSendFileId(String userEmail,String fileName,String fileId){
		
		 



			    String host = "smtp.gmail.com";
			    String from = "mproject102@gmail.com";  // its chnages by your email id 
				    String pass = "projectmail123";       // its also change with email Password 
			    Properties props = System.getProperties();
			    props.put("mail.smtp.starttls.enable", "true"); // added this line
			    props.put("mail.smtp.host", host);
			    props.put("mail.smtp.user", from);
			    props.put("mail.smtp.password", pass);
			    props.put("mail.smtp.port", "587");
			    props.put("mail.smtp.auth", "true");

			    String[] to = {userEmail}; // added this line

			    Session session = Session.getDefaultInstance(props, null);
			    MimeMessage message = new MimeMessage(session);
			    try {
					message.setFrom(new InternetAddress(from));
					
					  InternetAddress[] toAddress = new InternetAddress[to.length];

					    // To get the array of addresses
					    for( int i=0; i < to.length; i++ ) { // changed from a while loop
					        toAddress[i] = new InternetAddress(to[i]);
					    }
					    System.out.println(Message.RecipientType.TO);

					    for( int i=0; i < toAddress.length; i++) { // changed from a while loop
					        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
					    }
					    message.setSubject("Welcome To DEDUPLICATION  ");
					    message.setText("Your file Id of File is  "+fileName +"And File ID is "+fileId);
					   
					    Transport transport = session.getTransport("smtp");
					    transport.connect(host, from, pass);
					    transport.sendMessage(message, message.getAllRecipients());
					    transport.close();
					   // JOptionPane.showMessageDialog(null,"KEY sucessfully send to mail");
				} catch (AddressException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			  
			}
	
	public void mailSendForgotPassword(String userEmail,String userPassword){
		
	    String host = "smtp.gmail.com";
	    String from = "mproject102@gmail.com";  // its chnages by your email id 
	    String pass = "projectmail123";      // its also change with email Password 
	    Properties props = System.getProperties();
	    props.put("mail.smtp.starttls.enable", "true"); // added this line
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.user", from);
	    props.put("mail.smtp.password", pass);
	    props.put("mail.smtp.port", "587");
	    props.put("mail.smtp.auth", "true");

	    String[] to = {userEmail}; // added this line

	    Session session = Session.getDefaultInstance(props, null);
	    MimeMessage message = new MimeMessage(session);
	    try {
			message.setFrom(new InternetAddress(from));
			
			  InternetAddress[] toAddress = new InternetAddress[to.length];

			    // To get the array of addresses
			    for( int i=0; i < to.length; i++ ) { // changed from a while loop
			        toAddress[i] = new InternetAddress(to[i]);
			    }
			    System.out.println(Message.RecipientType.TO);

			    for( int i=0; i < toAddress.length; i++) { // changed from a while loop
			        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
			    }
			    message.setSubject("Welcome To Data Deduplicaion ");
			    message.setText("Your Forgot Password is  : "  +  userPassword);
			   
			    Transport transport = session.getTransport("smtp");
			    transport.connect(host, from, pass);
			    transport.sendMessage(message, message.getAllRecipients());
			    transport.close();
			   // JOptionPane.showMessageDialog(null,"KEY sucessfully send to mail");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	  
	}
	
	public void mailSendUserToken(String userEmail,String userToken){
		
	    String host = "smtp.gmail.com";
	    String from = "mproject102@gmail.com";  // its chnages by your email id 
	    String pass = "projectmail123";      // its also change with email Password 
	    Properties props = System.getProperties();
	    props.put("mail.smtp.starttls.enable", "true"); // added this line
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.user", from);
	    props.put("mail.smtp.password", pass);
	    props.put("mail.smtp.port", "587");
	    props.put("mail.smtp.auth", "true");

	    String[] to = {userEmail}; // added this line

	    Session session = Session.getDefaultInstance(props, null);
	    MimeMessage message = new MimeMessage(session);
	    try {
			message.setFrom(new InternetAddress(from));
			
			  InternetAddress[] toAddress = new InternetAddress[to.length];

			    // To get the array of addresses
			    for( int i=0; i < to.length; i++ ) { // changed from a while loop
			        toAddress[i] = new InternetAddress(to[i]);
			    }
			    System.out.println(Message.RecipientType.TO);

			    for( int i=0; i < toAddress.length; i++) { // changed from a while loop
			        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
			    }
			    message.setSubject("Welcome To  Data Deduplication");
			    message.setText("Your Activated Token is   : "  +  userToken);
			   
			    Transport transport = session.getTransport("smtp");
			    transport.connect(host, from, pass);
			    transport.sendMessage(message, message.getAllRecipients());
			    transport.close();
			   // JOptionPane.showMessageDialog(null,"KEY sucessfully send to mail");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	  
	}
	
	public void mailSendChangePassword(String userEmail,String userNewPassword){
		
	    String host = "smtp.gmail.com";
	    String from = "mproject102@gmail.com";  // its chnages by your email id 
	    String pass = "projectmail123";       // its also change with email Password 
	    Properties props = System.getProperties();
	    props.put("mail.smtp.starttls.enable", "true"); // added this line
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.user", from);
	    props.put("mail.smtp.password", pass);
	    props.put("mail.smtp.port", "587");
	    props.put("mail.smtp.auth", "true");

	    String[] to = {userEmail}; // added this line

	    Session session = Session.getDefaultInstance(props, null);
	    MimeMessage message = new MimeMessage(session);
	    try {
			message.setFrom(new InternetAddress(from));
			
			  InternetAddress[] toAddress = new InternetAddress[to.length];
			  
			  
			  System.out.println("Mail Methoids");

			    // To get the array of addresses
			    for( int i=0; i < to.length; i++ ) { // changed from a while loop
			        toAddress[i] = new InternetAddress(to[i]);
			    }
			    System.out.println(Message.RecipientType.TO);

			    for( int i=0; i < toAddress.length; i++) { // changed from a while loop
			        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
			    }
			    message.setSubject("Welcome To Data Deduplication  ");
			    message.setText("Your new Password is : "  + userNewPassword);
			   
			    Transport transport = session.getTransport("smtp");
			    transport.connect(host, from, pass);
			    transport.sendMessage(message, message.getAllRecipients());
			    transport.close();
			   // JOptionPane.showMessageDialog(null,"KEY sucessfully send to mail");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	  
	}
	
	public void mailSendKeyFromUser(String userEmail,String fileName,String userKey){
		
	    String host = "smtp.gmail.com";
	    String from = "mproject102@gmail.com";  // its chnages by your email id 
	    String pass = "projectmail123";       // its also change with email Password 
	    Properties props = System.getProperties();
	    props.put("mail.smtp.starttls.enable", "true"); // added this line
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.user", from);
	    props.put("mail.smtp.password", pass);
	    props.put("mail.smtp.port", "587");
	    props.put("mail.smtp.auth", "true");

	    String[] to = {userEmail}; // added this line

	    Session session = Session.getDefaultInstance(props, null);
	    MimeMessage message = new MimeMessage(session);
	    try {
			message.setFrom(new InternetAddress(from));
			
			  InternetAddress[] toAddress = new InternetAddress[to.length];

			    // To get the array of addresses
			    for( int i=0; i < to.length; i++ ) { // changed from a while loop
			        toAddress[i] = new InternetAddress(to[i]);
			    }
			    System.out.println(Message.RecipientType.TO);

			    for( int i=0; i < toAddress.length; i++) { // changed from a while loop
			        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
			    }
			    message.setSubject("Welcome To Data Deduplication  ");
			    message.setText("Your file"+fileName+ " is decrypted with  Key  "+ userKey );
			   
			    Transport transport = session.getTransport("smtp");
			    transport.connect(host, from, pass);
			    transport.sendMessage(message, message.getAllRecipients());
			    transport.close();
			   // JOptionPane.showMessageDialog(null,"KEY sucessfully send to mail");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	  
	}
	
	
	public void mailSendToUpdateKeyGroupMember(String userEmail,String fileName,String userKey){
		
	    String host = "smtp.gmail.com";
	    String from = "mproject102@gmail.com";  // its chnages by your email id 
	    String pass = "projectmail123";       // its also change with email Password 
	    Properties props = System.getProperties();
	    props.put("mail.smtp.starttls.enable", "true"); // added this line
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.user", from);
	    props.put("mail.smtp.password", pass);
	    props.put("mail.smtp.port", "587");
	    props.put("mail.smtp.auth", "true");

	    String[] to = {userEmail}; // added this line

	    Session session = Session.getDefaultInstance(props, null);
	    MimeMessage message = new MimeMessage(session);
	    try {
			message.setFrom(new InternetAddress(from));
			
			  InternetAddress[] toAddress = new InternetAddress[to.length];

			    // To get the array of addresses
			    for( int i=0; i < to.length; i++ ) { // changed from a while loop
			        toAddress[i] = new InternetAddress(to[i]);
			    }
			    System.out.println(Message.RecipientType.TO);

			    for( int i=0; i < toAddress.length; i++) { // changed from a while loop
			        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
			    }
			    message.setSubject("Welcome To Data Deduplication  ");
			    message.setText("Sorry !  For the inconvenience your file"+fileName+ " is decrypted with  New Key onwords  "+ userKey );
			   
			    Transport transport = session.getTransport("smtp");
			    transport.connect(host, from, pass);
			    transport.sendMessage(message, message.getAllRecipients());
			    transport.close();
			   // JOptionPane.showMessageDialog(null,"KEY sucessfully send to mail");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	  
	}
	
	}

