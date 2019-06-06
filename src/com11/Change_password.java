package com11;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ConnectionFactory;
public class Change_password extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Change_password() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		String pass=request.getParameter("password");
		String oldpass=request.getParameter("oldpassword");
		
		HttpSession session=request.getSession(false);
		String em=(String) session.getAttribute("userName");
		System.out.println(em);
		
		try 
		{
			Connection con=ConnectionFactory.getInstance().getConnection();
			
			String query="select * from user where Email='"+em+"' and Password='"+oldpass+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			if(rs.next())
			{
				String q="update user set Password='"+pass+"' where Email='"+em+"'";
				PreparedStatement ptm=con.prepareStatement(q);
				int i=ptm.executeUpdate();
				if(i>0)
				{
					out.println("<script type=\"text/javascript\">");  
					out.println("alert('Password Change Successfully');");  
					out.println("</script>");    
					request.getRequestDispatcher("/Profile.jsp").include(request, response);
				}
			}
			
			else
			{
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Enter Correct Password');");  
				out.println("</script>");    
				request.getRequestDispatcher("/Profile.jsp").include(request, response);
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

}
