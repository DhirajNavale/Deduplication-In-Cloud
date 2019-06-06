package User;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.*;

import com.ConnectionFactory;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.parser.PdfReaderContentParser;
import com.itextpdf.text.pdf.parser.SimpleTextExtractionStrategy;
import com.itextpdf.text.pdf.parser.TextExtractionStrategy;

import Dao.File_insert;

public class Sql 
{
	static Connection conn=null;
	static Statement stmt=null;
	static ResultSet rs=null;
	static PreparedStatement ps=null;
	
	public static ResultSet getcount() 
	{
		try 
		{
			String q="select count(*) from file_storage";
			conn=ConnectionFactory.getInstance().getConnection();
			stmt=conn.prepareStatement(q);
			rs=stmt.executeQuery(q);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return rs;	
	}
	
	public static int insertfile(String name,String filename,String sharepath,String sha256Hash,String tag,String uniqueID)
	{
		int i=0;
		try{
			File_insert dd=new File_insert();
			String ddd=dd.selectGroupId(name);
			conn=ConnectionFactory.getInstance().getConnection();
			stmt=(Statement) conn.createStatement();
			 i=stmt.executeUpdate("insert into file_storage (Username, Filename, Filepath, Tag,Proof,Fileid,groupid) values('"+name+"','"+filename+"','"+sharepath+"','"+sha256Hash+"','"+tag+"','"+uniqueID+"','"+ddd+"')");	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return i;
	}
	
	public static int insertshare(String string,String sha256Hash,String uniqueID)
	{
		int i=0;
		try{
			//Tag, Node_no, Sharename, Hashvalue
			conn=ConnectionFactory.getInstance().getConnection();
			stmt=(Statement) conn.createStatement();
			 i=stmt.executeUpdate("insert into sharePath (Sharepath, Tag,File_id) values('"+string+"','"+sha256Hash+"','"+uniqueID+"')");	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return i;
	}
	
	public static int insertback(String string,String sha256Hash,String uniqueID)
	{
		int i=0;
		try{
			
			conn=ConnectionFactory.getInstance().getConnection();
			stmt=(Statement) conn.createStatement();
			 i=stmt.executeUpdate("insert into backup (Sharepath, Tag,File_id) values('"+string+"','"+sha256Hash+"','"+uniqueID+"')");	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return i;
	}
	
	public static ResultSet checktoken(String token) 
	{
		try 
		{
			String q="select * from file_storage where Proof='"+token+"'";
			conn=ConnectionFactory.getInstance().getConnection();
			stmt=conn.prepareStatement(q);
			rs=stmt.executeQuery(q);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return rs;	
	}
		public static int insertdup(String filename,String username,String token)
	{
		int i=0;
		try{
			File_insert dd=new File_insert();
			String ddd=dd.selectGroupId(username);
			conn=ConnectionFactory.getInstance().getConnection();
			stmt=(Statement) conn.createStatement();
			 i=stmt.executeUpdate("insert into dupfiles(Filename, Username, Tag,groupid) values('"+filename+"','"+username+"','"+token+"','"+ddd+"')");	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return i;
	}
	
	public static ResultSet checktag(String tag) 
	{
		try 
		{
			String q="select * from file_storage where Tag='"+tag+"'";
			conn=ConnectionFactory.getInstance().getConnection();
			stmt=conn.prepareStatement(q);
			rs=stmt.executeQuery(q);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return rs;	
	}
	
	 public static void parsePdf(String pdf, String txt) throws IOException {
	        PdfReader reader = new PdfReader(pdf);
	        PdfReaderContentParser parser = new PdfReaderContentParser(reader);
	        PrintWriter out = new PrintWriter(new FileOutputStream(txt));
	        TextExtractionStrategy strategy;
	        for (int i = 1; i <= reader.getNumberOfPages(); i++) {
	            strategy = parser.processContent(i, new SimpleTextExtractionStrategy());
	            out.println(strategy.getResultantText());
	        }
	        out.flush();
	        out.close();
	        reader.close();
	    }
	 
	 public static boolean texttopdf(File file,String filename)
	 {
		 FileInputStream fis=null;
		 DataInputStream in=null;
		 InputStreamReader isr=null;
		 BufferedReader br=null;
		 try 
		 {
			 Document pdfdoc=new Document();
			 String outputfile=file.getParent()+"/"+filename+".pdf";
			 System.out.println("get parent="+file.getParent());
			 PdfWriter writer=PdfWriter.getInstance(pdfdoc, new FileOutputStream(outputfile));
			 pdfdoc.open();
			 
			 pdfdoc.setMarginMirroring(true);
			 pdfdoc.setMargins(36, 72, 108, 180);
			 pdfdoc.topMargin();
			 
			 Font myfont=new Font();
			 Font bold_font=new Font();
			 bold_font.setStyle(Font.BOLD);
			 bold_font.setStyle(10);
			 myfont.setStyle(Font.NORMAL);
			 myfont.setStyle(10);
			 
			 if(file.exists())
			 {
				 fis=new FileInputStream(file);
				 in=new DataInputStream(fis);
				 isr=new InputStreamReader(in);
				 br=new BufferedReader(isr);
				 String strline;
				 
				 while((strline=br.readLine())!= null)
				 {
					Paragraph para=new Paragraph(strline+"\n",myfont);
					para.setAlignment(Element.ALIGN_JUSTIFIED);
					pdfdoc.add(para);
				 }
			 }
			 else
			 {
				 System.out.println("no such file exists");
				 return false;
			}
			 pdfdoc.close();
		 } 
		 catch (Exception e) 
		 {
			 e.printStackTrace();
		 }
		return true;
	}
	 
	 public static ResultSet checkmail(String email) 
		{
			try 
			{
				String q="select * from user where Email='"+email+"'";
				conn=ConnectionFactory.getInstance().getConnection();
				stmt=conn.prepareStatement(q);
				rs=stmt.executeQuery(q);
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			return rs;	
		}
	 
	 public static ResultSet checkfilename(String filename) 
		{
			try 
			{
				String q="select * from file_storage where Filename='"+filename+"'";
				conn=ConnectionFactory.getInstance().getConnection();
				stmt=conn.prepareStatement(q);
				rs=stmt.executeQuery(q);
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			return rs;	
		}
	 
	 public static ResultSet gethash(String id) 
		{
			try 
			{
				String q="select count(*) from file_storage where Fileid='"+id+"'";
				conn=ConnectionFactory.getInstance().getConnection();
				stmt=conn.prepareStatement(q);
				rs=stmt.executeQuery(q);
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			return rs;	
		}
}
