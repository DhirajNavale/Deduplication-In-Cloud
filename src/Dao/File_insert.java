package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import beans.File_details;

import com.ConnectionFactory;

public class File_insert {

	static Connection con;
	static PreparedStatement pt;
	static Statement st;
	 //public static  String id;
	 ResultSet rs;
	 public static int id;
String groupid=null;

		public static void select(File_details fd,String fileName)
		{
			try 
			{
				con=ConnectionFactory.getInstance().getConnection();
				String qury="select * from file where Filename='"+fileName+"'";
				 Statement stm=con.createStatement();
		           ResultSet rs=stm.executeQuery(qury);
		           
		           while(rs.next())
		           {
		        	   id=rs.getInt(1);
		           }
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}

		public String selectGroupId(String userName)
		{
			try 
			{
				con=ConnectionFactory.getInstance().getConnection();
				String qury="select groupid from user where Email='"+userName+"'";
				 Statement stm=con.createStatement();
		           ResultSet rs=stm.executeQuery(qury);
		           
		           while(rs.next())
		           {
		        	   groupid=rs.getString(1);
		           }
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			return groupid;
		}
	public static void insert(File_details fd)
	{
		try 
		{
			con=ConnectionFactory.getInstance().getConnection();
			String query="INSERT INTO file (Username, Filename, Filepath, Filelength,Fileid,time) values (?,?,?,?,?,?)";
			pt=con.prepareStatement(query);
			pt.setString(1, fd.getUsername());
			pt.setString(2, fd.getFilename());
			pt.setString(3, fd.getFilepath());
			pt.setLong(4, fd.getFilelength());
			pt.setString(5, fd.getFileid());
			/*pt.setLong(6, fd.getUploadtime());*/
			pt.setLong(6, 156030);
			pt.executeUpdate();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
	}
	
	public static int uploadtime(long filelength,long time, String filename) 
	{
		int i=0;
		
		try
		{
			con=ConnectionFactory.getInstance().getConnection();
			st=(Statement) con.createStatement();
			i=st.executeUpdate("insert into uploadingtime (Filelength, Time,filename) values('"+filelength+"','"+time+"','"+filename+"')");	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return i;	
	}
	public static int downloadtime(long filelength,long time) 
	{
		int i=0;
		
		try
		{
			con=ConnectionFactory.getInstance().getConnection();
			st=(Statement) con.createStatement();
			 i=st.executeUpdate("insert into downloadtime (Filelength, Time) values('"+filelength+"','"+time+"')");	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return i;
	}
	
	public static int integrityresult(int nof,long time) 
	{
		int i=0;
		
		try
		{
			con=ConnectionFactory.getInstance().getConnection();
			st=(Statement) con.createStatement();
			 i=st.executeUpdate("insert into integrityresult (NoOfNodes, Time) values('"+nof+"','"+time+"')");	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return i;
		
	}
	public void insert_hash(int id,String fragname,String hashvalue)
	{
		try 
		{
			con=ConnectionFactory.getInstance().getConnection();
			String insert="insert into hashtable (Frag_name, Hashvalue,File_id) values (?,?,?)";
			pt=con.prepareStatement(insert);
			pt.setString(1,fragname );
			pt.setString(2, hashvalue);
			pt.setInt(3, id);
			
			pt.executeUpdate();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	public static ResultSet getExpireTime(String FileId,String id)
	{ ResultSet rs=null;
		try 
		{
			con=ConnectionFactory.getInstance().getConnection();
			String qury="select * from response where FileKey='"+FileId+"'";
			 Statement stm=con.createStatement();
	            rs=stm.executeQuery(qury);
	       
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return rs;
	}
	
}
