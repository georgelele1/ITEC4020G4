package com.example.itec4020g4;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;



public class imageHandler extends HttpServlet {
    private static final long serialVersionUID = 1L;

    //Constructor
    public imageHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

    //GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Checks if user is logged-in by session authentication
        String id = request.getParameter("id");

        //Gets current session
        HttpSession s = request.getSession();

        //If id is null redirect to the loginpage
        if(id == null) {
            response.sendRedirect("login");
        }
        else if (id.equals("1")) {

            //Gets the root web app folder
            ServletContext cntx= request.getServletContext();
            // Get the absolute path of the image
            String filename = cntx.getRealPath("/Images/cp.JPG");
            // retrieve mimeType dynamically
            String Mime = cntx.getMimeType(filename);
            if (Mime == null) {
                //Gives error if problem
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                return;
            }

            response.setContentType(Mime);
            File file = new File(filename);
            response.setContentLength((int)file.length());

            FileInputStream in = new FileInputStream(file);
            OutputStream out = response.getOutputStream();

            // Copy the contents of the file to stream
            byte[] buf = new byte[1024];
            int count = 0;
            while ((count = in.read(buf)) >= 0) {
                out.write(buf, 0, count);
            }
            out.close();
            in.close();

        }
        else if(id.equals("2")) {
            //Gets the root web app folder
            ServletContext cntx= request.getServletContext();
            // Get the absolute path of the image
            String filename = cntx.getRealPath("/Images/account.png");
            // retrieve mimeType dynamically
            String mime = cntx.getMimeType(filename);
            if (mime == null) {
                //Gives error if problem
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                return;
            }

            response.setContentType(mime);
            File file = new File(filename);
            response.setContentLength((int)file.length());

            FileInputStream in = new FileInputStream(file);
            OutputStream out = response.getOutputStream();

            // Copy the contents of the file to the output stream
            byte[] buf = new byte[1024];
            int count = 0;
            while ((count = in.read(buf)) >= 0) {
                out.write(buf, 0, count);
            }
            out.close();
            in.close();
        }
        else {
            //Prints error
            response.setContentType("text/plain");

            PrintWriter scan = response.getWriter();
            scan.write("ERROR in printing image");

            return;
        }
    }

    //POST
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Redirect
        response.sendRedirect("login");
    }






}
