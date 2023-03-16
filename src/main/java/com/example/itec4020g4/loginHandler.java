package com.example.itec4020g4;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class loginHandler
 */
public class loginHandler extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String[][] accounts = new String[3][2];

    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginHandler() {
        super();
        // TODO Auto-generated constructor stub
        accounts[0][0] = "admin";
        accounts[0][1] = "123";
        accounts[1][0] = "yanbo";
        accounts[1][1] = "123";
        accounts[2][0] = "test";
        accounts[2][1] = "123";
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //request parameters/data from post request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        int verified = 0;
        for(int i = 0; i<accounts.length; i++) {
            if(accounts[i][0].equals(username)) {
                if(accounts[i][1].equals(password)) {
                    verified = 1;
                }
            }
        }

        if (verified == 1) {

            //Creates a session if it doesn't exist and if it does then use it.
            HttpSession session = request.getSession(true);

            //session timeout if specific seconds pass and all attributes will be deleted
            session.setMaxInactiveInterval(120);

            //Set session attributes for authentication
            session.setAttribute("username", username);

            session.setAttribute("password", password);

            //Redirect to LoggedIn Page
            response.sendRedirect("loggedIn");

            return;

        }
        else {
            //ERROR Response if invalid username and password
            response.setContentType("text/html");

            PrintWriter scan = response.getWriter();

            //Security code to prevent caching
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");

            //Response expires in 1 min
            response.setDateHeader("Expires",1);

            response.setHeader("Refresh", "3;url=login");

            scan.write("<h2> Invalid username or password back to login 3s</h2>");

            scan.write("<script> document.addEventListener('contextmenu', event => event.preventDefault());"
                    +"</script>");

            return;
        }


    }

}
