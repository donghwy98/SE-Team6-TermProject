package booksys.application.persistency;


import booksys.application.domain.WaitingList;

class PersistentWaitingList extends WaitingList
{
  private String name;

  public PersistentWaitingList(java.sql.Time t,int wn, String n)
  {
    super(t, wn) ;
    name = n;
  }
  
  public String getName() {
	  return name;
  }



}