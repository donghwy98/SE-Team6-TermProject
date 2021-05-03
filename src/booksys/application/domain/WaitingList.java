package booksys.application.domain;

import java.sql.Time;

public class WaitingList {
	int wn;
	Time time;
	
	public WaitingList(Time t, int n){
		wn = n;
		time = t;
	}
	
	public int getWaitingNumber() {
	    return wn ;
	  }

}
