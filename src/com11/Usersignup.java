package com11;

import User.Sql;

import com.ConnectionFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Usersignup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection = null;
	PreparedStatement ptmt = null;
	ResultSet resultSet = null;
    public Usersignup() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String n=request.getParameter("name");
		System.out.println(n);
		String em=request.getParameter("email");
		System.out.println(em);
		String up=request.getParameter("password");
		System.out.println(up);
		String c=request.getParameter("Contact");
		System.out.println(c);
		String groupname=request.getParameter("groupname");
		String groupid=request.getParameter("groupid");
		try {
			
			ResultSet rr=Sql.checkmail(em);
			if(rr.next())
			{
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Mail ID Already exists.Please change mail id.......');");  
				out.println("</script>");    
				request.getRequestDispatcher("/user_signin.jsp").include(request, response);
			}
			else
			{	
				String queryString = "insert into user(Name, Email, Password, Contact,groupname,groupid) values(?,?,?,?,?,?)";
				connection =ConnectionFactory.getInstance().getConnection();
				System.out.println("hiiiiiiii");
				ptmt = connection.prepareStatement(queryString);
				ptmt.setString(1,n);
				ptmt.setString(2,em);
				ptmt.setString(3,up);
				ptmt.setString(4,c);
				ptmt.setString(5,groupname);
				ptmt.setString(6,groupid);
				int i = ptmt.executeUpdate();
				if(i>0)
					{
						out.println("<script type=\"text/javascript\">");  
						out.println("alert('Register Successfully go to Login Page');");  
						out.println("</script>");    
						request.getRequestDispatcher("/user_signin.jsp").include(request, response);
					}
				else
					{					
						ServletContext context=getServletContext();	
						RequestDispatcher dispatcher=context.getRequestDispatcher("/Index.jsp");
						dispatcher.forward(request, response);
					}
			}
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
	}

}
