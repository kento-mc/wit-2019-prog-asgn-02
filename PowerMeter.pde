public class PowerMeter {
  
  //-------------------instance variables---------------------// 
  
  private int boxWidth = 50;
  private int boxHeight = 150;

  //----------------------constructors------------------------//

  public PowerMeter() {
  }
 

  //-------------------------methods--------------------------//
  
  public void display() {
  rect(width*.01, height*.7, boxWidth, boxHeight);
  rect(width*.01, (height*.7 + boxHeight), boxWidth, height*.01);
    
  }
  
  //-------------------------getters--------------------------//
  
  
  //-------------------------setters--------------------------//
  
}
