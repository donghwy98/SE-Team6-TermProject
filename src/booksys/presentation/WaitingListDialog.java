package booksys.presentation;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Time;

public class WaitingListDialog extends Dialog {
	protected Time time;
	protected TextField arrivalTime;
	protected Label arrivalTimeLabel;
	protected TextField waitingNum;
	protected Label waitingNumLabel;
	protected TextField name;
	protected Label nameLabel;
	protected boolean   confirmed ;
	protected Button    ok ;
	protected Button    cancel ;
	
	WaitingListDialog(Frame owner, String title){
		super(owner,title,true);
		
		addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
			  confirmed = false ;
			  WaitingListDialog.this.hide() ;
			}
		      }) ;
		
		arrivalTimeLabel = new Label("ArrivalTime:", Label.RIGHT);
		arrivalTime = new TextField(time.toString());
		
		nameLabel = new Label("WaitingNum:", Label.RIGHT) ;
	    name = new TextField(3) ;
		
		waitingNumLabel = new Label("WaitingNum:", Label.RIGHT) ;
	    waitingNum = new TextField(3) ;
	    
	    ok = new Button("Ok") ;
	    ok.addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {
		  confirmed = true ;
		  WaitingListDialog.this.hide() ;
		}
	      }) ;
	    
	    cancel = new Button("Cancel") ;
	    cancel.addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {
		  confirmed = false ;
		  WaitingListDialog.this.hide() ;
		}	
		
	});
	    
	    
	
	

	}
	
	Time getTime()
	  {
	    return Time.valueOf(arrivalTime.getText()) ;
	  }
	public String getWaitingNum() {
		return waitingNum.getText();
	}
	
	public String getName() {
		return name.getText();
	}
	
	 boolean isConfirmed()
	  {
	    return confirmed ;
	  }
}
