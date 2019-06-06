package File;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.FileChannel;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.Sql;

import com.ConnectionFactory;
import com.project.mail.Mail;

public class Otherdownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Otherdownload() {
        super();
    }
    Connection con=null;
    Statement st=null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		String fileid=request.getParameter("identity");
		
		System.out.println("In Other Download is controller  identity "+fileid);
		System.out.println("File ID="+fileid);
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		System.out.println("id="+id);
		
	String fileIdSession=(String)request.getAttribute("FileId");
	
	System.out.println("file Id fileIdSession is "+fileIdSession);
		
		ArrayList<String>al=new ArrayList<>();
		String backup="C:" + File.separator + "Deduplication_storage"+File.separator+"backup"+File.separator;
		String destination="C:" + File.separator + "Deduplication_storage"+File.separator+"share";
		ArrayList<File>af=new ArrayList<>();
		
		boolean bool=false;
		
		try 
		{
			String query="select * from file_storage where Fileid='"+fileid+"' and id='"+id+"'";
			con=ConnectionFactory.getInstance().getConnection();
			st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			if(rs.next())
			{
				con=ConnectionFactory.getInstance().getConnection();
				String query1="select * from sharepath where File_id='"+fileid+"'";
				Statement st=con.createStatement();
				ResultSet rst=st.executeQuery(query1);
				while(rst.next())
				{
					al.add(rst.getString(2));
				}
				
				for (String s : al) 
				{
					File fi=new File(s);
					bool=fi.exists();
					
					if(bool==true)
					{
						System.out.println("File exists in folder");
					}
					else
					{
						System.out.println("File doesnot exists in folder:");
						String[] str=s.split("\\"+File.separator);
						String bn=backup+str[3];
						File f=new File(bn);
						destination=destination+File.separator+str[3];
						File f2=new File(destination);
						f2.createNewFile();
						
						FileChannel source=new FileInputStream(f).getChannel();
						FileChannel dest=new FileOutputStream(f2).getChannel();
						
						if(dest!=null && source!=null)
						{
							dest.transferFrom(source,0, source.size());
						}
						System.out.println("File Copied in share folder");	
						source.close();
					}
				}
				
				for(String s:al)
				{
					File f=new File(s);
					af.add(f);
				}
				
				String filename=rs.getString(3);
				String[] fn=filename.split("\\.");
				System.out.println(fn[1]);
				
				String recoverpath="C:\\Deduplication_storage\\recover\\"+fn[0]+".txt";
				for(File ff:af)
				{
					MergeDao md=new MergeDao();
					md.merg(ff, rs.getString(3), recoverpath);
					System.out.println("In file loops ");
				}
				
				
				if(fn[1].equalsIgnoreCase("pdf"))
				{
					System.out.println("pdf file");
					File f=new File(recoverpath);
					boolean b=Sql.texttopdf(f,fn[0]);
					if(b)
					{
						response.setContentType("APPLICATION/OCTET-STREAM"); 
						response.setHeader("Content-Disposition","attachment; filename=\"" + fn[0]+".pdf" + "\"");
						FileInputStream fi=new FileInputStream("C:\\Deduplication_storage\\recover\\"+fn[0]+".pdf");
						int i;
						while ((i=fi.read())!= -1) 
						{
							   out.write(i); 
						} 
					}
					else
					{
						out.println("<script type=\"text/javascript\">");  
		            	out.println("alert('No Such File Exists........');");  
		            	out.println("</script>");    
		                getServletContext().getRequestDispatcher("/View_files.jsp").include(request, response);
					}
				}
				else
				{
					System.out.println("Text File");
					
					System.out.println("file Name is "+filename);
					response.setContentType("APPLICATION/OCTET-STREAM"); 
					response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");
					
					
					
					
					/*FileInputStream fi=new FileInputStream(recoverpath);
					int i;
					while ((i=fi.read())!= -1) 
					{
						   out.write(i); 
					} */
				}	
			}
			else 
			{
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Enter Correct File ID');");  
				out.println("</script>");    
				request.getRequestDispatcher("/Other_download.jsp").include(request, response);
			}
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
