package User;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ConnectionFactory;

public class Share2 
{
	 ArrayList<String>al=new ArrayList<>();
     ArrayList<String>al2=new ArrayList<>();
     ArrayList<String>al3=new ArrayList<>();
     ArrayList<String>al4=new ArrayList<>();
     String hashvalue=null;
     Connection con=null;
     //String query12="insert into sharepath (Sharepath, Tag,File_id) values(?,?,?)";
    // String query13="insert into backup (Sharepath, Tag,File_id) values(?,?,?)";
     PreparedStatement pt=null,pt1=null;
     
	public void createShare(String Path,long length,String id,String filename)
	{
		String sharepath="C:" + "/" + "Deduplication_storage"+"/"+"Share"+"/"+filename;
		String backpath="C:" + "/" + "Deduplication_storage"+"/"+"backup"+"/"+filename;
		int fs=1024;
		File inputfile=new File(Path);
		FileInputStream inputStream;
        String newFileName;
        FileOutputStream filePart,filepart1;
        int fileSize = (int) length;
        int nChunks = 65, read1 = 0;
		int readLength = fs;
        byte[] byteChunkPart;
        try
        {
        inputStream = new FileInputStream(inputfile);
        while (fileSize > 0) {
            if (fileSize <= 5) {
                readLength = fileSize;
            }
            byteChunkPart = new byte[readLength];
            read1 = inputStream.read(byteChunkPart, 0, readLength);
            fileSize -= read1;
            assert (read1 == byteChunkPart.length);
            nChunks++;
            newFileName = sharepath + ".part"+ (char)(nChunks - 1);
            String backname=backpath+".part"+(char)(nChunks - 1);
            filePart = new FileOutputStream(new File(newFileName));
            filePart.write(byteChunkPart);
            
            File file=new File(newFileName);
            hashvalue=HashGeneratorUtils.generateSHA256(file);
            System.out.println("Hash Value="+hashvalue);
            
            con=ConnectionFactory.getInstance().getConnection();
            String query="select * from share where Tag='"+hashvalue+"'";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(query);
            if(rs.next())
            {
            	System.out.println("Block is Duplicate"+newFileName);
            	al2.add(newFileName);
            	System.out.println("This Block is available at:"+rs.getString(2));
            	al4.add(rs.getString(2));
            	//pt=con.prepareStatement(query12);
            	pt.setString(1, rs.getString(2));
            	pt.setString(2, hashvalue);
            	pt.setString(3, id);
            	pt.executeUpdate();
            	pt.close();            	
            	
            	//pt1=con.prepareStatement(query13);
            	pt1.setString(1, rs.getString(2));
            	pt1.setString(2, hashvalue);
            	pt1.setString(3, id);
            	pt1.executeUpdate();
            }
            
            else 
            {
            	System.out.println("block is not duplicate"+newFileName);
            	al.add(newFileName);
            	
            	//pt=con.prepareStatement(query12);
            	pt.setString(1, newFileName);
            	pt.setString(2, hashvalue);
            	pt.setString(3, id);
            	pt.executeUpdate();
            	
            	 filepart1=new FileOutputStream(new File(backname));
                 filepart1.write(byteChunkPart);
                 filepart1.flush();
                 filepart1.close();
                 al3.add(backname);
                 
               // pt1=con.prepareStatement(query13);
             	pt1.setString(1,backname);
             	pt1.setString(2, hashvalue);
             	pt1.setString(3, id);
             	pt1.executeUpdate();
			}
            
            filePart.flush();
            filePart.close();
           
            byteChunkPart = null;
            filePart = null;
        }
        for (String sb : al2) 
        {
        	System.out.println("Duplicate Blocks="+sb);
        	File fi=new File(sb);
        	fi.delete();
		}
 	}
        
        catch (Exception e)
        {
        	e.printStackTrace();
        }
	}
	public List<String> getlist() 
	{
		return al;
	}
	
	public List<String> getlist1() 
	{
		return al2;
	}
	public List<String> getlist2() 
	{
		return al3;
	}
	
	public List<String> getlist3() 
	{
		return al4;
	}

}
