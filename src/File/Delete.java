package File;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.Sql;

import com.ConnectionFactory;
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Delete() {
        super();
    }
    Connection con=null;
    Statement st=null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		int count=0;
		String fileid=request.getParameter("name");
		System.out.println("File ID="+fileid);
		
		String filename=request.getParameter("filename");
		System.out.println("File Name="+filename);
		
		HttpSession session=request.getSession(false);
		String username=(String) session.getAttribute("userName");
		
		String path="C:\\Deduplication_storage\\File";
		
		try 
		{
			ResultSet rr=Sql.gethash(fileid);
			if(rr.next())
			{
				count=rr.getInt(1);
			}
			System.out.println("Count="+count);
			
			if(count==1)
			{
				path=path+File.separator+filename;
				File f=new File(path);
				f.delete();
			
				con=ConnectionFactory.getInstance().getConnection();
				String query="delete from file_storage where Fileid='"+fileid+"'";
				st=con.createStatement();
				int i=st.executeUpdate(query);
				if(i>0)
					{
						System.out.println("File Deleted From File Storage Table");
					}
				st.close();
			
				String q="select * from sharepath where File_id='"+fileid+"'";
				st=con.createStatement();
				ResultSet rs=st.executeQuery(q);
				while(rs.next())
					{
						File fi=new File(rs.getString(2));
						fi.delete();
						System.out.println("Share deleted from share Folder");
					}
				st.close();
						
				String q1="delete from sharepath where File_id='"+fileid+"'";
				st=con.createStatement();
				int z=st.executeUpdate(q1);
				if(z>0)
					{
						System.out.println("Shares Deleted From Share Table");
					}
				st.close();
			
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('File Deletion Success');");  
				out.println("</script>");    
				request.getRequestDispatcher("/Own_files.jsp").include(request, response);
			}
			else
			{
				path=path+File.separator+filename;
				File f=new File(path);
				f.delete();
			
				con=ConnectionFactory.getInstance().getConnection();
				String query="delete from file_storage where Fileid='"+fileid+"' and Username='"+username+"'";
				st=con.createStatement();
				int i=st.executeUpdate(query);
				if(i>0)
					{
						System.out.println("File Deleted From File Storage Table");
					}
				st.close();
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('File Deletion Success');");  
				out.println("</script>");    
				request.getRequestDispatcher("/Own_files.jsp").include(request, response);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
