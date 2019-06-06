package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.ConnectionFactory;

public class hash_insert {
	static Connection con;
	static PreparedStatement pt;
	
/*	public void insert_hash(int id,String fragname,String hashvalue)
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
	}*/

	public void insert_hash( int id, String fragname,String hashvalue) {
		try 
		{
			con=ConnectionFactory.getInstance().getConnection();
			String insert="insert into hashtable (Frag_name, Hashvalue,File_id) values (?,?,?)";
		System.out.println(fragname);
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
}
