/*package User;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;

import com11.KeyGenerator11;
import Dao.File_insert;
import Dao.hash_insert;
import File.AESencryptor;
import User.HashGeneratorUtils;
import User.Node;
import beans.File_details;

@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)
public class userUploadingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR="Deduplication_storage";
       
    *//**
     * @see HttpServlet#HttpServlet()
     *//*
    public userUploadingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	*//**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(request, response);
		
	}

	*//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
    	{
    		response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            
            Integer n=Integer.parseInt(request.getParameter("NOF"));
            System.out.println(n);
            
            HttpSession session=request.getSession(false);  
            String  name=(String)session.getAttribute("userName");
          
            File_details fd=new File_details();
            
           // Integer n=Integer.parseInt(request.getParameter("NOF"));
           
            Part part=request.getPart("file");
            long length=part.getSize();
        
           
            Long FileSizeMB = (length/1024);
            String fileName=extractFileName(part);
            ResultSet rm=null;
            if(rm.next())
            {
            	System.out.println("File Name Exists. Please Change File Name");
            	out.println("<script type=\"text/javascript\">");  
				out.println("alert('File Name Exists. Please Change File Name.........');");  
				out.println("</script>");    
				request.getRequestDispatcher("/File_upload.jsp").include(request, response);
            }
        
      
     
          
            else
            {
           if (length<10000000 && n<=5 ||length>10000000 && n>5 && n<10)
				
		
            {
            
            fd.setFilelength(length);
            fd.setUsername(name);
    
            fd.setFilename(fileName);
            
            fd.setUsername(name);
            
            String fileid=UUID.randomUUID().toString();
            
              fd.setFileid(fileid);      
              String original= "C:" + File.separator + SAVE_DIR+File.separator+"File";
               savepath = "C:" + File.separator + SAVE_DIR+File.separator+"Original";
              String replicaPath = "C:" + File.separator + SAVE_DIR+File.separator+"Replica";
              String nodepath="C:" + File.separator + SAVE_DIR+File.separator+"Nodes";
              String tpapath="C:" + File.separator + SAVE_DIR+File.separator+"TPAdata";
              
              fd.setFilepath(nodepath);
              
              ArrayList<String>list=new ArrayList<String>();//create list
              ArrayList<String>all=new ArrayList<String>();
              list.add(original);
              list.add(savepath);
              list.add(tpapath);
              list.add(replicaPath);
              for(String s:list)
              {
                  File fileSaveDir=new File(s);
                  if(!fileSaveDir.exists()){
                      fileSaveDir.mkdir();
                  }
              }
      
                 long starttime=System.currentTimeMillis();
                 file=savepath+File.separator+fileName;
                 file1=tpapath+File.separator+fileName;
                 file3=replicaPath+File.separator+fileName;
                 
                  String  file2=original+File.separator+fileName;
                  OutputStream op=new FileOutputStream(new File(file2));
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
               
                  
                   fs=(int) (length/n);
                  File inputFile = new File(file2);
  				FileInputStream inputStream;
  		        String newFileName,replicaname;
  		        FileOutputStream filePart,filereplica;
  		        int fileSize = (int) length;
  		        int nChunks = 65, read1 = 0;
  				int readLength = fs;
  		        byte[] byteChunkPart;
  		        
  		      System.out.println("11111111111111111111111122222222222222222222222222222");
  		        
  		        ArrayList<String>al=new ArrayList<String>();
  		        ArrayList<String>alist=new ArrayList<String>();
  		        
  		        inputStream = new FileInputStream(inputFile);
  	            while (fileSize > 0) {
  	                if (fileSize <= 5) {
  	                    readLength = fileSize;
  	                }
  	                
  	              System.out.println("111111111111111111111111333333333333333333333333");
  	                byteChunkPart = new byte[readLength];
  	                read1 = inputStream.read(byteChunkPart, 0, readLength);
  	                fileSize -= read1;
  	                assert (read1 == byteChunkPart.length);
  	                nChunks++;
  	                newFileName = file+".part" +(char)(nChunks-1);
  	                replicaname=file3+".copy"+(char)(nChunks - 1);
  	                
  	                al.add(newFileName);
  	                alist.add(replicaname);
  	                
  	                filePart = new FileOutputStream(new File(newFileName));
  	                filePart.write(byteChunkPart);
  	                filePart.flush();
  	                filePart.close();
  	              System.out.println("111111111111111111111111444444444444444444444444444444444");
  	                filereplica=new FileOutputStream(new File(replicaname));
  	                filereplica.write(byteChunkPart);
  	                filereplica.flush();
  	                filereplica.close();
  	                
  	                byteChunkPart = null;

  	                filePart = null;
  	            }
  	          System.out.println("111111111111111111111111555555555555555555555555555");
  	            inputStream.close();
  	            
  	            File fff=new File(file2);
  	            fff.delete();
  	          Random r=new Random();
	            KeyGenerator11 keygen=new KeyGenerator11();
	            System.out.println(new java.util.Date());
	          String s1=new String(Base64.encodeBase64(keygen.generateString(r,name+new java.util.Date(),16).getBytes()));
	          System.out.println("keeeeeeeeeeeeeeeeee"+s1);
	        String publicKey=keygen.generateString(r,s1,16);
	      
	        System.out.println("11111111111111111111111166666666666666666666666666666");  
  	            for(String s:al)
  	            {
  	            	System.out.println(s);
  	            	AESencryptor a=new AESencryptor();
  	            	a.encrypt(s,publicKey);
  	            	
  	            	String sr=s+".aes";
  	            	String[] src=sr.split("\\"+File.separator);
  	            	System.out.println("Source="+src[3]);
  	            	
  	            	File source=new File(sr);
  	            	File dest=new File(tpapath+"\\"+src[3]);
  	            	
  	            	FileUtils.copyFile(source, dest);
  	            	
  	            	all.add(s+".aes");
  	            	File f=new File(s);
	                    f.delete();
  	            }
  	            
  	            for(String s:alist)
  	            {
  	            	AESencryptor a=new AESencryptor();
  	            	a.encrypt(s,publicKey);
  	            	File f=new File(s);
  	                   f.delete();
  	            }
  	            
  	            
  	            
  	            
  	        
  	          long endtime=System.currentTimeMillis();
	    
	          	
	          	fd.setUploadtime(+endtime-starttime);
  	            File_insert.insert(fd);
  	            File_insert.select(fd, fileName);
  	           
   	            int id=File_insert.id;
   	        
  	          
  	           
  	    
  	            
  	           
   	         for (String str : all) 
	           {
	        	  String hashvalue= HashGeneratorUtils.generateSHA256(str);
   	        	 
   	        String hashvalue=HashGeneratorUtils.generateSHA256(str);
   	        	 
   	        	
	        	          	 
	        	  String[] ss=str.split("\\"+File.separator);
	        	  hash_insert hs=new hash_insert();
	        	  hs.insert_hash(id,ss[3], hashvalue);
	           } 
   	      System.out.println("1111111111111111111111110000000000000000000000000000000");
   	             Node node=new Node();
	            node.createNode(nodepath);
	            System.out.println("1111111111111111111111118888888888888888888888");
 	            
 	          	File_insert.uploadtime(length,(endtime-starttime),fileName);
 	          
	            node.insertFragtoNode(savepath, nodepath,id);
	            node.insertReplicatoNode(replicaPath, nodepath, id);
	            
	            message = "File uploaded to cloud and Details saved into database";
                  request.setAttribute("Message", message);
                  out.println("<script type=\"text/javascript\">");  
          		out.println("alert('File uploaded successfully');");  
          		out.println("</script>");    
                  getServletContext().getRequestDispatcher("/File_upload.jsp").include(request, response);
            
            }
                else {
            	 
               // request.setAttribute("Message", "File uploaded successfully");
                out.println("<script type=\"text/javascript\">");  
        		out.println("alert('File  not uploaded successfully please check no.of fragments and its file size');");  
        		out.println("</script>");    
                getServletContext().getRequestDispatcher("/File_upload.jsp").include(request, response);
				
			}}}
    	   
    	catch (Exception e) 
    	{
			e.printStackTrace();
		}
    	
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : ims) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }}*/