package com.example.itec4020g4;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class logoutHandler
 */
public class LogoutHandler extends HttpServlet {
    private static final long serialVersionUID = 1L;

    //Constructor
    public LogoutHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

    //GET Request
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

        HttpSession s = request.getSession(true);

        if(s.getAttribute("username")!=null){
            response.sendRedirect("loggedIn");
        }else {
            response.sendRedirect("login");
        }
    }

    //POST Request
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Logout of current session and invalidate it so all attributes be deleted.
        HttpSession session = request.getSession(false);

        if(session == null) {
            response.sendRedirect("login");
        }
        else {
            session.invalidate();
            response.sendRedirect("login");
        }

    }

}
