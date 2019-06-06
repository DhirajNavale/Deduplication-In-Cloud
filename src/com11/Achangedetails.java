package com11;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ConnectionFactory;
public class Achangedetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Achangedetails() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(false);
		String username=(String) session.getAttribute("userName");
		System.out.println("username="+username);
		
		String change=request.getParameter("change");
		System.out.println("change="+change);
		
		String value=request.getParameter("value");
		System.out.println("value="+value);
		
		try 
		{
			Connection con=ConnectionFactory.getInstance().getConnection();
			String update="update admin set "+change+"='"+value+"' where Email='"+username+"'";
			Statement st=con.createStatement();
			int i=st.executeUpdate(update);
			if(i>0)
			{
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Changes Saved Successfully');");  
				out.println("</script>");    
				request.getRequestDispatcher("/Aprofile.jsp").include(request, response);
			}
			else
			{
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Changes Saved Failed');");  
				out.println("</script>");    
				request.getRequestDispatcher("/Aprofile.jsp").include(request, response);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
