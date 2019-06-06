package User;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)

public class GenerateTag extends HttpServlet {
	private static final long serialVersionUID = -1445651683541116182L;
	private static final String SAVE_DIR="Deduplication_storage";
	Connection con=null;
	String message = null;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
            {
    	try
    	{
    			response.setContentType("text/html;charset=UTF-8");
            	PrintWriter out=response.getWriter();
            	HttpSession session=request.getSession(true);
            
                String savePath = "C:" + File.separator + SAVE_DIR+File.separator+"File";
                String sharepath="C:" + File.separator + SAVE_DIR+File.separator+"Share";
                String backup="C:" + File.separator + SAVE_DIR+File.separator+"backup";
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
                Part part=request.getPart("file");
                String fileName=extractFileName(part);
                
                ResultSet rs=Sql.checkfilename(fileName);
                if(rs.next())
                {
                	out.println("<script type=\"text/javascript\">");  
    				out.println("alert('File Name Already exists.Please change File Name.......');");  
    				out.println("</script>");    
    				request.getRequestDispatcher("/file_upload.jsp").include(request, response);
                }
                else
                {	
                	String filePath= savePath + File.separator + fileName ;
                	part.write(filePath);
                
                	String[] fn=fileName.split("\\.");
                	System.out.println("extension="+fn[1]);
                 
                	if(fn[1].equals("pdf"))
                		{
                			System.out.println("this is pdf file");
                			String pdf=filePath;
                			String text=savePath+File.separator+fn[0]+".txt";
                			Sql.parsePdf(pdf, text);
                			File f=new File(pdf);
                			f.delete();
                	
                			session.setAttribute("filepath", text);
                			session.setAttribute("filename", fn[0]+".txt");
                			response.sendRedirect("pdfservlet");
                	
                		}
                	else
                		{
                		    session.setAttribute("FileParts", part);
                			session.setAttribute("filepath", filePath);
                			session.setAttribute("filename", fileName);
                			System.out.println("this is text file");
                			response.sendRedirect("textservlet");
                		}
                }
       	}
    	catch (Exception e) 
    	{
			e.printStackTrace();
		}
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}