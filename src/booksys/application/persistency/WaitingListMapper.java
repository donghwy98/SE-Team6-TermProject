package booksys.application.persistency;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.Vector;
import booksys.application.domain.WaitingList;
import booksys.storage.Database;

public class WaitingListMapper {
	
	 private static WaitingListMapper uniqueInstance ;

	  public static WaitingListMapper getInstance()
	  {
	    if (uniqueInstance == null) {
	      uniqueInstance = new WaitingListMapper() ;
	    }
	    return uniqueInstance ;
	  }

	  public Vector getWaitingList()
	  {
	    Vector v = new Vector() ;
	    try
	    {
	      Statement stmt
		= Database.getInstance().getConnection().createStatement() ;
	      ResultSet rset
		= stmt.executeQuery("SELECT * FROM WaitingList") ;
	      while (rset.next()) {
		int wn = rset.getInt(1);
		Time atime = rset.getTime(2) ;
		String name = rset.getString(3);
		PersistentWaitingList w = new PersistentWaitingList(atime, wn, name);
		
		v.add(w) ;
	      }
	      rset.close() ;
	     stmt.close() ;
	    }
	    catch (SQLException e) {
	      e.printStackTrace() ;
	    }
	    return v ;
	  }
	  
	  
	  public PersistentWaitingList createWaitingList(Time time, int wn, String name)

	  {
		  performUpdate("INSERT INTO WaitingList " + "VALUES ('"+wn +"', '" + time.toString() + "', '"
+ name + "')" ) ;
		  return new PersistentWaitingList(time, wn, name) ;
	  } 
	  
	  public void deleteWaitingList(WaitingList w)
	  {
	    int wn = w.getWaitingNumber() ;
	    performUpdate("DELETE FROM WaitingList WHERE WaitingNumber = '"
			  + wn +"'" ) ;
	  }
	  
	  private void performUpdate(String sql)
	  {
	    try {
	      Statement stmt
		= Database.getInstance().getConnection().createStatement() ;
	      int updateCount
		= stmt.executeUpdate(sql) ;
	      stmt.close() ;
	    }
	    catch (SQLException e) {
	      e.printStackTrace() ;
	    }
	  }

	

}
