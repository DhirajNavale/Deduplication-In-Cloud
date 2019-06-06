package User;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;

import com.itextpdf.text.log.SysoLogger;

import com11.KeyGenerator11;
import beans.File_details;
import Dao.File_insert;
import Dao.hash_insert;
import File.AESencryptor;
import User.HashGeneratorUtils;






public class textservlet extends HttpServlet 
{
	private static final long serialVersionUID = -1445651683541116182L;
	private static final String SAVE_DIR="Deduplication_storage";
	Connection con=null;
	String message = null;
	 String savepath=null;
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
            System.out.println("filename="+fileName);
            
            long starttime=System.currentTimeMillis();
            
            File_details fd=new File_details();
            
            fd.setUsername(nm);
            
           
          
    
            fd.setFilename(fileName);
            
         
            
            String fileid=UUID.randomUUID().toString();
            
              fd.setFileid(fileid);      
            
            
            File f=new File(filePath);
        	long length=f.length();
        	
        	 fd.setFilelength(length);
            
                String savePath = "C:" + "/" + SAVE_DIR+"/"+"File";
                
                savepath = "C:" + File.separator + SAVE_DIR+File.separator+"Original";
                String sharepath="C:" +"/"+ SAVE_DIR+"/"+"Share";
                String replicaPath = "C:" + File.separator + SAVE_DIR+File.separator+"Replica";
                String backup="C:" +"/" + SAVE_DIR+"/"+"backup";
                String nodepath="C:" + File.separator + SAVE_DIR+File.separator+"Nodes";
                String tpapath="C:" + File.separator + SAVE_DIR+File.separator+"TPAdata";
                ArrayList<String>al=new ArrayList<>();
                ArrayList<String>all=new ArrayList<String>();
                ArrayList<String>alist=new ArrayList<String>();
                ArrayList<String>fileList=new ArrayList<String>();
                al.add(savePath);
                
                fd.setFilepath(nodepath);
                
                System.out.println("Total File Path is "+savePath);
                
                System.out.println("Total Path is "+savePath+"/"+fileName);
                
                al.add(sharepath);
                al.add(backup);
                al.add(replicaPath);
                
                for (String s : al) 
                {
                	File fileSaveDir=new File(s);
                    if(!fileSaveDir.exists()){
                        fileSaveDir.mkdir();
                    }
				}
                
                String sha256Hash = HashGeneratorUtils.generateSHA256(f);
    			System.out.println("Hash: " + sha256Hash);
    			
    			String tag=Proof_tag.calculateRFC2104HMAC(sha256Hash, nm);
    			System.out.println(tag);
    			
    			String uniqueID = UUID.randomUUID().toString();
    			
    			ResultSet rs=Sql.getcount();
    			while(rs.next())
    			{
    				if(rs.getInt(1)==0)
    				{
    					System.out.println("rs value is "+rs.getInt(1));
    					
    					Sql.insertfile(nm, fileName, sharepath, sha256Hash, tag, uniqueID);
    					
    					Share_generation sg=new Share_generation();
        				sg.createShare(filePath, length,uniqueID,fileName);
        				
        			      
        				
    					List<String> sharelist=sg.getlist();
        				List<String> backlist=sg.getback();
        				
        				for (String s : sharelist) 
        				{
        					File file12=new File(s);
        		        	String sha256Hash1 = HashGeneratorUtils.generateSHA256(file12);
        					System.out.println("SHA-256 Hash: " + sha256Hash1);
        					
			              System.out.println("In Servlet are textServlet is called Shar Table Insert");
        					
        					System.out.println("Value of String value is"+s);
        					
        					System.out.println("sha256Hash1 value is "+sha256Hash1);
        					
        					System.out.println("uniqueID value is "+uniqueID);
        					
        					Sql.insertshare(s, sha256Hash1, uniqueID);
        					
        					System.out.print("after insert into table ..................");
        					
        				}	
        				
        				// T Colouring Code 
        				
        				System.out.println("Starting T Colouring Code ......................................");
        				
        				int n=5; // no of Spliting 
        				
        				 String  file2=savePath+File.separator+fileName;
        				 String  file3=replicaPath+File.separator+fileName;
                         OutputStream op=new FileOutputStream(new File(file2));
                        /* Part part=request.getPart("file");*/
                         
                         HttpSession session=request.getSession();
                         
                         Part part=(Part)session.getAttribute("FileParts");
                         
                         InputStream ip=part.getInputStream();
                         
                       int read=0;
                         final byte[] bytes=new byte[1024];
                         while ((read = ip.read(bytes)) != -1)
                         {
                             op.write(bytes, 0, read);
                         }
                        
                         ip.close();
                         op.close();
                         
                         System.out.println("111111111111111111111111");
                      
                        int  fs=(int) (length/n);
                         File inputFile = new File(file2);
         				FileInputStream inputStream;
         		        String newFileName,replicaname;
         		        FileOutputStream filePart,filereplica;
         		        int fileSize = (int) length;
         		        int nChunks = 65, read1 = 0;
         				int readLength = fs;
         		        byte[] byteChunkPart;
			  	
          		        inputStream = new FileInputStream(inputFile);
          	            while (fileSize > 0) {
          	                if (fileSize <= 5) {
          	                    readLength = fileSize;
          	                }
          	                
          	              System.out.println("111111111111111111111122222222222222222222222222222222222222");
          	                byteChunkPart = new byte[readLength];
          	                read1 = inputStream.read(byteChunkPart, 0, readLength);
          	                fileSize -= read1;
          	                assert (read1 == byteChunkPart.length);
          	                nChunks++;
          	                newFileName = file2+".part" +(char)(nChunks-1);
          	                replicaname=file3+".copy"+(char)(nChunks - 1);
          	                
          	                System.out.println("File Name is "+file2);
          	                
          	                
          	                System.out.println("New File name is "+newFileName);
          	                
          	              fileList.add(newFileName);
          	                alist.add(replicaname);
          	                
          	                filePart = new FileOutputStream(new File(newFileName));
          	                filePart.write(byteChunkPart);
          	                filePart.flush();
          	                filePart.close();
          	              System.out.println("11111111111111111111111133333333333333333333333333333333");
          	                filereplica=new FileOutputStream(new File(replicaname));
          	                filereplica.write(byteChunkPart);
          	                filereplica.flush();
          	                filereplica.close();
          	                
          	                byteChunkPart = null;

          	                filePart = null;
          	            }
          	          System.out.println("11111111111111111111111144444444444444444444444444444444444444444444444");
          	            inputStream.close();
          	            
          	            File fff=new File(file2);
          	            fff.delete();
          	          Random r=new Random();
        	            KeyGenerator11 keygen=new KeyGenerator11();
        	            System.out.println(new java.util.Date());
        	          String s1=new String(Base64.encodeBase64(keygen.generateString(r,fileName+new java.util.Date(),16).getBytes()));
        	          System.out.println("keeeeeeeeeeeeeeeeee"+s1);
        	         String publicKey=keygen.generateString(r,s1,16);
        	      
        	        System.out.println("1111111111111111111111115555555555555555555555555555555555555555555555555555555555");  
          	            for(String s:fileList)
          	            {
          	            	
          	            	System.out.println("File Name is in loop parts  "+file2);
          	            	System.out.println(s);
          	            	AESencryptor a=new AESencryptor();
          	            	a.encrypt(s,publicKey);
          	            	String sr=s+".aes";
          	            	String[] src=sr.split("\\"+File.separator);
          	            	
          	            	for(int i=1;i<src.length;i++){
          	            		System.out.println("Path is "+src[i]);
          	            	}
          	            	
          	            /*	System.out.println("Source="+src[3]);*/
          	            	
          	            	System.out.println("AAAAAA");
          	            	
          	            	File source=new File(sr);
          	            	File dest=new File(tpapath+"\\"+src);
          	            	
          	            	FileUtils.copyFile(source, dest);
          	            	
          	            	System.out.println("BBBBBBBBBBBBBB");
          	            	
          	            	all.add(s+".aes");
          	            	File f1=new File(s);
        	                    f.delete();
          	           }
        	                    
        	                    
          	           
          	           for(String s:alist)
          	            {
          	           	AESencryptor a=new AESencryptor();
        	                    
        	                    System.out.println("CCCCCCCC");
          	            	a.encrypt(s,publicKey);
          	            File f11=new File(s);
          	                   f.delete();
          	            }
          	            
          	            
          	            System.out.println("DDDDDDDDDDDDDDDDDDDD");
          	            
          	        
          	          long endtime=System.currentTimeMillis();
          	          
          	          System.out.println("end Time is "+endtime);
        	    
        	          	
        	          	fd.setUploadtime(+endtime-starttime);
          	            File_insert.insert(fd);
          	            File_insert.select(fd, fileName);
          	           
           	            int id=File_insert.id;
           	        
          	          
          	           System.out.print("EEEEEEEEEEEEEEEEEEEEEE");
          	    
          	     /*       
          	           
           	         for (String str : all) 
        	           {
        	        	  String hashvalue= HashGeneratorUtils.generateSHA256(str);
           	        	 
           	            String hashvalue=HashGeneratorUtils.generateSHA256(str);
           	        	 
           	        	
        	        	          	 
        	        	  String[] ss=str.split("\\"+File.separator);
        	        	  hash_insert hs=new hash_insert();
        	        	  hs.insert_hash(id,ss[3], hashvalue);
        	           }*/ 
           	        System.out.println("1111111111111111111111166666666666666666666666666666666666666");
           	             Node node=new Node();
        	            node.createNode(nodepath);
        	            System.out.println("111111111111111111111117777777777777777777777777777777777777777777777777");
         	            
         	        /*  	File_insert.uploadtime(length,(endtime-starttime),fileName);*/
         	          
        	            System.out.println("GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG");
        	            
        	            System.out.println("Save Path is "+savePath);
        	            
        	            System.out.println("Node path is "+nodepath);
        	            
        	            System.out.println("Id is "+id);
        	            
        	            node.insertFragtoNode(savePath, nodepath,id);
        	           /*node.insertReplicatoNode(replicaPath, nodepath, id);*/
         		        
         		        
         		        System.out.print("HHHHHHHHHHHHHHHHHHHHHHHH Sai ram !!!");
         		        
         		        
         		        
        	            System.out.println("End  T Colouring Code ......................................");
         		        
         		        
         		        
         		        
         		        
         		        
         		        
         		        // end of T Colouring Code 
         		        
        				for (String string : backlist) 
        				{
        					File file12=new File(string);
        		            String  sha256Hash1 = HashGeneratorUtils.generateSHA256(file12);
        					System.out.println("SHA-256 Hash: " + sha256Hash1);
        					
        					System.out.println("In Servlet are textServlet is called");
        					
        					System.out.println("Value of String value is"+string);
        					
        					System.out.println("sha256Hash1 value is "+sha256Hash1);
        					
        					System.out.println("uniqueID value is "+uniqueID);
        					
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
    						System.out.println("File Is Duplicate");
    						Sql.insertdup(fileName, nm, tag);
    						f.delete();
    						HttpSession session=request.getSession(true);
    						session.setAttribute("Tag", tag);
    						out.println("<script type=\"text/javascript\">");  
    		            	out.println("alert('File is duplicate. Prove owner ship to get file path');");  
    		            	out.println("</script>");    
    		                getServletContext().getRequestDispatcher("/file_upload.jsp").include(request, response);
    					}
    					else
    					{
    						System.out.println("file is not duplicate");
    						
    						System.out.println("In 1111111111111111111111111111");
    						
    						ResultSet rsmt=Sql.checktag(sha256Hash);
    						if(rsmt.next())
    						{
    							
    							System.out.println("In 1111111111111111111111111111222222222222222222222222222222");
    							
    					
    							
    							
    							System.out.println("tag is duplicate");
    							Sql.insertfile(nm, fileName, rsmt.getString(4), rsmt.getString(5), tag, rsmt.getString(7));
    							out.println("<script type=\"text/javascript\">");  
    	                    	out.println("alert('File Uploaded successfully');");  
    	                    	out.println("</script>");    
    	                        getServletContext().getRequestDispatcher("/file_upload.jsp").include(request, response);
    						}
    						else
    						{
    							Share2 sh=new Share2();
    							sh.createShare(filePath, length,uniqueID,fileName);
    							
    							Sql.insertfile(nm, fileName, sharepath, sha256Hash, tag, uniqueID);
    							
    							out.println("<script type=\"text/javascript\">");  
    			            	out.println("alert('Block level Duplication perfromed. See Console For Output........');");  
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