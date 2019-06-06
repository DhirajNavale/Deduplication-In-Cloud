package com11;

import java.util.Random;

public class KeyGenerator11 {

	  public static String generateString(Random rng, String characters, int length)
	    {
	    System.out.println("String:"+characters);
	    char[] text = new char[length];  //array size is 16
	    for (int i = 0; i < length; i++)
	    {
	        text[i] = characters.charAt(rng.nextInt(characters.length()));
	    }
	   // System.out.println("text is:"+ new String(text));
	    return new String(text);
	    }
	
}
