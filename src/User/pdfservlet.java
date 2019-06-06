package User;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;

import java.util.UUID;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class pdfservlet extends HttpServlet 
{
	private static final long serialVersionUID = -1445651683541116182L;
	private static final String SAVE_DIR="Deduplication_storage";
	Connection con=null;
	String message = null;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
            {
    	try
    	{
    		response.setContentType("text/html;charset=UTF-8");
            	PrintWriter out = response.getWriter();
            	
           HttpSession session1=request.getSession(false);
            String nm= (String) session1.getAttribute("Username");
            String filePath=(String) session1.getAttribute("filepath");
            String fileName=(String) session1.getAttribute("filename");
            String[] fn=fileName.split("\\.");
            
            File f=new File(filePath);
        	long length=f.length();
            
                String savePath = "C:/"+ SAVE_DIR+"/"+"File";
                String sharepath="C:/"+ SAVE_DIR+"/"+"Share";
                String backup="C:" + "/" + SAVE_DIR+"/"+"backup";
                ArrayList<String>al=new ArrayList<>();
                al.add(savePath);
                al.add(sharepath);
                al.add(backup);
                
                for (String s : al) 
                {
                	File fileSaveDir=new File(s);
                    if(!fileSaveDir.exists()){
                        fileSaveDir.mkdir();
                    }
				}
                
                String sha256Hash = HashGeneratorUtils.generateSHA256(f);
    			System.out.println("SHA-256 Hash: " + sha256Hash);
    			
    			String tag=Proof_tag.calculateRFC2104HMAC(sha256Hash, nm);
    			System.out.println(tag);
    			
    			String uniqueID = UUID.randomUUID().toString();
    			
    			ResultSet rs=Sql.getcount();
    			while(rs.next())
    			{
    				if(rs.getInt(1)==0)
    				{
    					Sql.insertfile(nm, fn[0]+".pdf", sharepath, sha256Hash, tag, uniqueID);
    					
    					Share_generation sg=new Share_generation();
        				sg.createShare(filePath, length,uniqueID,fileName);
        				
    					List<String> sharelist=sg.getlist();
        				List<String> backlist=sg.getback();
        				
        				for (String s : sharelist) 
        				{
        					File file12=new File(s);
        		        	String sha256Hash1 = HashGeneratorUtils.generateSHA256(file12);
        					System.out.println("SHA-256 Hash: " + sha256Hash1);
        					
        					Sql.insertshare(s, sha256Hash1, uniqueID);
						}
        				
        				for (String string : backlist) 
        				{
        					File file12=new File(string);
        		        	String sha256Hash1 = HashGeneratorUtils.generateSHA256(file12);
        					System.out.println("SHA-256 Hash: " + sha256Hash1);
        					
        					Sql.insertback(string, sha256Hash1, uniqueID);
        				}
        				out.println("<script type=\"text/javascript\">");  
                    	out.println("alert('File Uploaded successfully');");  
                    	out.println("</script>");    
                        getServletContext().getRequestDispatcher("/file_upload.jsp").include(request, response);
    				}
    				
    				else
    				{
    					ResultSet rst=Sql.checktoken(tag);
    					if(rst.next())
    					{
    						System.out.println("File is Duplicatede other file Uploaded Sorry !");
    						
    						System.out.println("File Is Duplicate");
    						Sql.insertdup(fn[0]+".pdf", nm, tag);
    						f.delete();
    						HttpSession session=request.getSession(true);
    						session.setAttribute("Tag", tag);
    						out.println("<script type=\"text/javascript\">");  
    		            	out.println("alert('File is duplicate');");  
    		            	out.println("</script>");    
    		                getServletContext().getRequestDispatcher("/Prove.jsp").include(request, response);
    					}
    					else
    					{
    						System.out.println("file is not duplicate");
    						
    						ResultSet rsmt=Sql.checktag(sha256Hash);
    						if(rsmt.next())
    						{
    							System.out.println("tag is duplicate");
    							Sql.insertfile(nm, rsmt.getString(3), rsmt.getString(4), rsmt.getString(5), tag, rsmt.getString(7));
    							out.println("<script type=\"text/javascript\">");  
    	                    	out.println("alert('File Uploaded successfully');");  
    	                    	out.println("</script>");    
    	                        getServletContext().getRequestDispatcher("/file_upload.jsp").include(request, response);
    						}
    						else
    						{
    							Share2 sh=new Share2();
    							sh.createShare(filePath, length,uniqueID,fileName);
    							
    							Sql.insertfile(nm, fn[0]+".pdf", sharepath, sha256Hash, tag, uniqueID);
    							
    							out.println("<script type=\"text/javascript\">");  
    			            	out.println("alert('Duplication perfromed');");  
    			            	out.println("</script>");    
    			                getServletContext().getRequestDispatcher("/file_upload.jsp").include(request, response);
    							
    						}
    					}
    				}
    			}
    	}
    	catch (Exception e) {
			e.printStackTrace();
		}
    }
}