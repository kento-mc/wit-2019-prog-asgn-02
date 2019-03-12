public class Bow {
  
//-------------------instance variables---------------------// 

  private float xPos = 0;    
  private float yPos = height-10;
  private int bowWidth = 100;
  
  // drawPower

  //----------------------constructors------------------------//

  public Bow(float xPos) {
    this.xPos = xPos;
  }

  //-------------------------methods--------------------------//

  void display() {
    rect(xPos, yPos, bowWidth, 10);
  }

 
  //-------------------------getters--------------------------//
  
  public float getXPos() {
    return xPos;
  }
  
  public float getYPos() {
    return yPos;
  }
  
 public int getWidth() {
    return bowWidth;
 }

 
  //-------------------------setters--------------------------//
  
  public void setXPos(float xPos) {
    this.xPos = xPos;
  }
  
  public void setYPos(float yPos) {
    this.yPos = yPos;  
  }
  
  public void setBowWidth(int bowWidth) {
    this.bowWidth = bowWidth;  
  }

}  
  
  
