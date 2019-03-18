public class Bow {
  
  //-------------------instance variables---------------------// 

  private float xPos = 0;    
  private float yPos = height-10;
  private float bowWidth = width/6;
  
  // drawPower

  //----------------------constructors------------------------//

  public Bow(float xPos) {
    this.xPos = xPos - bowWidth/2;
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
  
 public float getBowWidth() {
    return bowWidth;
 }

 
  //-------------------------setters--------------------------//
  
  public void setXPos(float xPos) {
    this.xPos = xPos - bowWidth/2;
  }
  
  public void setYPos(float yPos) {
    this.yPos = yPos;  
  }
  
  public void setBowWidth(float bowWidth) {
    this.bowWidth = bowWidth;  
  }

}   
