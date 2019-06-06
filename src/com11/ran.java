package com11;

import java.util.Random;

public class ran {
	public int nodeno()
	{
	Random r = new Random();  //random values
	int ii = r.nextInt(7 - 3) + 3;
	
	/*String user_otp = ii + "";
	String l = "1";*/
	
	return ii;
	}
}
