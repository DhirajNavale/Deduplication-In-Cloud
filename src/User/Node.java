package User;


import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import File.randomno;

import com.ConnectionFactory;

import com11.ran;

public class Node {

	
	public void createNode(String path)
	{
		
		for(int i= 1;i<=30;i++)
		{
		 if (!new File(path+"/"+i).exists())
         {
             boolean status = new File(path+"/"+i).mkdirs();
             System.out.println("Status  " +status);
             System.out.println("node path:"+path+"/"+i);
         }
		}		
	}
	
	public void insertFragtoNode(String fragpath,String nodepath,int Fileid) throws SQLException
	{
		
		System.out.println("in methods Calll.....................................");
		File direct=null;
	File[] flist=null;
	 direct=new File(fragpath);
		
		System.out.println("Frag path is "+fragpath);
		 flist=direct.listFiles();
		System.out.println("for flist size:"+flist.length);
		
		File f;
		int j=0;//for file
		int k=0;
		Connection con=ConnectionFactory.getInstance().getConnection();
		String query="insert into Frag_details values(?,?,?)";
		PreparedStatement ptm=con.prepareStatement(query);

		randomno ran=new randomno();
	       List<Integer> ar=ran.nodediff();
		
		Collections.shuffle(ar);
	

		List<Integer>l=new ArrayList<Integer>();
		l.addAll(ar);
		
		for(int i=1;i<=31;i=i+2)//for node
		{
			for(int m=0;m<l.size();m++){
			
			if(i<16 && j<flist.length)
			{
				ran randomnode=new ran();
				int h=randomnode.nodeno();
				f=flist[j];
				ptm.setInt(1, Fileid);
				ptm.setInt(2, l.get(m));
				ptm.setString(3, f.getName());
				ptm.executeUpdate();
				f.renameTo(new File(nodepath+"/"+l.get(m)+"/"+f.getName()));
				j++;
				
			}else if(i>16 && j<flist.length){
				ran randomnode=new ran();
				int h=randomnode.nodeno();
				k=i-15;
				f=flist[j];
				ptm.setInt(1, Fileid);
				ptm.setInt(2,l.get(m));
				ptm.setString(3, f.getName());
				ptm.executeUpdate();
				f.renameTo(new File(nodepath+"/"+l.get(m)+"/"+f.getName()));
				j++;
			}
		} }
	}
	
	public void insertReplicatoNode(String replipath,String nodepath,int Fileid) throws SQLException
	{
		File direct1=new File(replipath);
		File[] Rlist=direct1.listFiles();
		
		File f;
		int j=Rlist.length-1;//for file
		int k=0;
		Connection con=ConnectionFactory.getInstance().getConnection();
		String query="insert into replica_details values(?,?,?)";
		PreparedStatement ptm=con.prepareStatement(query);
		
		randomno ran=new randomno();
        List<Integer> ar=ran.nodediff();
	
	Collections.shuffle(ar);
	

	List<Integer>l=new ArrayList<Integer>();
	l.addAll(ar);
		
		
		for(int i=1;i<=31;i=i+2)//for node
		{
			
			for(int m=0;m<l.size();m++){
			if(i<16 && j<=Rlist.length && j>=0)
			{
				f=Rlist[j];
				ptm.setInt(1, Fileid);
				ptm.setInt(2, l.get(m));
				ptm.setString(3, f.getName());
				ptm.executeUpdate();
				f.renameTo(new File(nodepath+"/"+l.get(m)+"/"+f.getName()));
				j--;
				
			}else if(i>16 &&  j<=Rlist.length && j>=0){
				k=i-15;
				f=Rlist[j];
				ptm.setInt(1, Fileid);
				ptm.setInt(2, l.get(m));
				ptm.setString(3, f.getName());
				ptm.executeUpdate();
				f.renameTo(new File(nodepath+"/"+l.get(m)+"/"+f.getName()));
				j--;
			}
		} 
	}}
}
