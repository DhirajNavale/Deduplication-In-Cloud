package User;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import java.util.ArrayList;
import java.util.List;


public class Share_generation 
{
	 ArrayList<String>al=new ArrayList<>();
     ArrayList<String>al2=new ArrayList<>();
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
            al.add(newFileName);
            al2.add(backname);
            filePart = new FileOutputStream(new File(newFileName));
            filePart.write(byteChunkPart);
            filePart.flush();
            filePart.close();
            filepart1=new FileOutputStream(new File(backname));
            filepart1.write(byteChunkPart);
            filepart1.flush();
            filepart1.close();
            byteChunkPart = null;
            filePart = null;
        }
 	}
        catch (Exception e)
        {
        	e.printStackTrace();
        }
	}
	
	public List<String>getlist()
	{
		return al;
		
	}
	public List<String> getback() 
	{
		return al2;
	}
}
