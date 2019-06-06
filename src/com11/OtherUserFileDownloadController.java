package com11;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ConnectionFactory;
import com.project.mail.Mail;

/**
 * Servlet implementation class OtherUserFileDownloadController
 */
public class OtherUserFileDownloadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OtherUserFileDownloadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// user Session 
	/*	
		HttpSession userSession=request.getSession();
		
		String userEmail=(String)request.getAttribute("userName");
		
		System.out.println("UserEmail is "+userEmail);*/
		
		String userEmail=request.getParameter("userEmail");
		
		System.out.println("userEmail is "+userEmail);
		
		
		String file=request.getParameter("file");
		
		String fileId=null,fileName=null;
		
		System.out.println("file is "+file);
		
		HttpSession session=request.getSession();
		 Connection con=null;
		    Statement st=null;
		
		session.setAttribute("id", file);
		
		String query="select * from file_storage where  id='"+file+"'";
		
		try {
			con=ConnectionFactory.getInstance().getConnection();
			
			st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			
			while(rs.next()){
				
				//id, Username, Filename, Filepath, Tag, Proof, Fileid
				
				 fileId=rs.getString(7);
				
				fileName=rs.getString(3);
				
				System.out.println("file Name is "+fileName);
				
				System.out.println("File id is "+fileId);
				
				System.out.println("userEmail is "+userEmail);
				
				
			}
			
			Mail mail=new Mail();
			
			mail.mailSendFileId(userEmail, fileName, fileId);
			
			System.out.println("Mail Sends!!!");
			
			
			request.getRequestDispatcher("/Other_download.jsp").forward(request, response);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
