package User;

import java.util.List;

public class Blockdup 
{
	public static void main(String[] args) 
	{
		Share2 sh=new Share2();
		List<String>dup=sh.getlist1();
		for (String s : dup) 
		{
			System.out.println("Block="+s);
		}
		
	}
}
