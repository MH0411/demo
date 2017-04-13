<%-- 
    Document   : SendEmail
    Created on : Aug 4, 2016, 12:59:12 PM
    Author     : Ho Zhen Hong
--%>

<%@page import="javax.mail.MessagingException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>

<%
//    response.addHeader("Access-Control-Allow-Origin", "*");
//    if ("OPTIONS".equalsIgnoreCase(request.getMethod())) 
//   {
//       response.addHeader("Access-Control-Allow-Credentials", "true");
//   }
    
    
    //response.header("Access-Control-Allow-Origin: *");
   
    
   String result;
   // Recipient's email ID needs to be mentioned.
   String email = (String) request.getAttribute("email");
   String subject = (String) request.getAttribute("subject");
   String msg = (String) request.getAttribute("message");
//   String email = "z.mike0411@gmail.com";
//   String subject = "test email";
//   String msg = "email from jsp";
   
   // Sender's email ID needs to be mentioned
   String from = "biocore@utem.edu.my";

   // STMP host
   String host = "smtp01.utem.edu.my";

   // Get system properties object
   Properties properties = System.getProperties();

   // Setup mail server
   properties.setProperty("mail.smtp.host", host);
   properties.setProperty("mail.user", "biocore@utem.edu.my");
   properties.setProperty("mail.password", "Bano5782"); 

   // Get the default Session object.
   Session mailSession = Session.getDefaultInstance(properties);

   try{
      // Create a default MimeMessage object.
      MimeMessage message = new MimeMessage(mailSession);

      // Set From: header field of the header.
      message.setFrom(new InternetAddress(from));

      // Set To: header field of the header.
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(email));
      message.setText(msg);

      // Set Subject: header field
      message.setSubject(subject);
      
//      if((String) request.getAttribute("fileName") != null){
//        String fileName = (String) request.getAttribute("fileName");      
//        // Create the message part 
//        BodyPart messageBodyPart = new MimeBodyPart();
//
//        // Fill the message
//        messageBodyPart.setText(msg);
//
//        // Create a multipar message
//        Multipart multipart = new MimeMultipart();
//
//        // Set text message part
//        multipart.addBodyPart(messageBodyPart);
//
//        // Part two is attachment
//        messageBodyPart = new MimeBodyPart();
//        String filename = fileName;
//        DataSource source =  new ByteArrayDataSource(byte, "application/pdf");
//        messageBodyPart.setDataHandler(new DataHandler(source));
//        messageBodyPart.setFileName(filename);
//        multipart.addBodyPart(messageBodyPart);
//
//        // Send the complete message parts
//        message.setContent(multipart );
//      }

      // Send message
      Transport.send(message);
      result = "Sent message successfully....";
   }catch (MessagingException mex) {
      mex.printStackTrace();
      result = "Error: unable to send message....";
   }

   out.println("Result: " + result + "\n");
%>

