package File;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class randomno {

	public List<Integer> nodediff(){
		
		List<Integer> list = new ArrayList<Integer>();
	
		
		
		
		for (int i=1; i<30; i=i+2) {
		     
			if(i<=30){
			
				
				list.add(i);
			}/*else
			{
				int k=i-15;
				list.add(k);
			}*/
			
		}
	
		//and here is the point. Java already have this implemented for you
		Collections.shuffle(list);
		System.out.println(list);

		List<Integer>l=new ArrayList<Integer>();
		l.addAll(list);
		return l;
		
		
}
	
}
