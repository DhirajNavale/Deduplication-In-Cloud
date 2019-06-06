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


import User.Sql;

import com.ConnectionFactory;
public class Own_download extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Own_download() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out=response.getWriter();
		
		String id=request.getParameter("name");
		System.out.println("File ID="+id);
		String filename=request.getParameter("filename");
		System.out.println("File Name is "+filename);
		
		
		ArrayList<String>al=new ArrayList<>();
		String backup="C:/"+ "Deduplication_storage"+"/"+"backup"+"/";
		String destination="C:/"+ "Deduplication_storage"+"/"+"share";
		ArrayList<File>af=new ArrayList<>();
		
		boolean bool=false;
		try
		{
			
			Connection con=ConnectionFactory.getInstance().getConnection();
			String query="select * from sharepath where File_id='"+id+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while(rs.next())
			{
				al.add(rs.getString(2));
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
			
			String[] fn=filename.split("\\.");
			System.out.println("fn="+fn[1]);
			
			String recoverpath="C:\\Deduplication_storage\\File\\"+fn[0]+".txt";
			for(File ff:af)
			{
				MergeDao md=new MergeDao();
				md.merg(ff, filename, recoverpath);
			}
			String ext=fn[1];
			if(ext.equalsIgnoreCase("pdf"))
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
	                getServletContext().getRequestDispatcher("/Own_files.jsp").include(request, response);
				}
			}
			else
			{
				System.out.println("Text File");
				response.setContentType("APPLICATION/OCTET-STREAM"); 
				response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");
				FileInputStream fi=new FileInputStream(recoverpath);
				int i;
				while ((i=fi.read())!= -1) 
				{
					   out.write(i); 
				} 
			}		
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
