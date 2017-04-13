/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MH0411
 */
public class EmailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EmailServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EmailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        // Recipient's email ID needs to be mentioned.
        String to = "z.mike0411@gmail.com";

        // Sender's email ID needs to be mentioned
        String from = "biocore@utem.edu.my";

        // Assuming you are sending email from localhost
        String host = "smtp01.utem.edu.my";

        // Get system properties
        Properties properties = System.getProperties();
        properties.put("mail.smtp.starttls.enable", true); 
        properties.put("mail.smtp.auth", true);
        
        // Setup mail server
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.user", "biocore@utem.edu.my");
        properties.setProperty("mail.password", "jlk508#@!"); 


        // Get the default Session object.
        Session session = Session.getDefaultInstance(properties);

        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try{
//           // Create a default MimeMessage object.
//           MimeMessage message = new MimeMessage(session);
//           // Set From: header field of the header.
//           message.setFrom(new InternetAddress(from));
//           // Set To: header field of the header.
//           message.addRecipient(Message.RecipientType.TO,
//                                    new InternetAddress(to));
//           // Set Subject: header field
//           message.setSubject("This is the Subject Line!");
//           // Now set the actual message
//           message.setText("This is actual message");
//           // Send message
//           Transport.send(message);
//           String title = "Send Email";
//           String res = "Sent message successfully....";
//           String docType =
//           "<!doctype html public \"-//w3c//dtd html 4.0 " +
//           "transitional//en\">\n";
//           out.println(docType +
//           "<html>\n" +
//           "<head><title>" + title + "</title></head>\n" +
//           "<body bgcolor=\"#f0f0f0\">\n" +
//           "<h1 align=\"center\">" + title + "</h1>\n" +
//           "<p align=\"center\">" + res + "</p>\n" +
//           "</body></html>");
        }catch (Exception mex) {
           mex.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
