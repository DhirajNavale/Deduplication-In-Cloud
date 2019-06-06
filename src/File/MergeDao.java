package File;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class MergeDao
{
	String path=null;
	public String merg(File flist,String filename,String path)
	{
		FileOutputStream fos = null;
		FileInputStream fis;
		byte[] fileBytes=null;
		int bytesRead = 0;
		try{
			  fos = new FileOutputStream(path,true);
				fis = new FileInputStream(flist);
		        fileBytes = new byte[(int) flist.length()];
		      
		        bytesRead = fis.read(fileBytes, 0,(int)  flist.length());
		        
		        assert(bytesRead == fileBytes.length);
		        assert(bytesRead == (int) flist.length());
		        
		        fos.write(fileBytes);
		        fos.flush();
		        fileBytes = null;
		        
		        fis.close();
		        fis = null;
		        
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return path;
	}	
	
}
