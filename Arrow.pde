public class Arrow {
 
  //-------------------instance variables---------------------// 

  private float xPos;    
  private float yPos = height-60;
  private float speed = 100;
  private int arrowLength = 60;
  private int arrowWidth = 3;
  
  // drawPower

  //----------------------constructors------------------------//

   public Arrow() {
     
  }

  //-------------------------methods--------------------------//
  
  public void display() {
    rect((bow.getXPos() + (bow.getWidth()/2)), yPos, arrowWidth, arrowLength);
  }

  public void looseArrow() {
    if (yPos > target.getYPos()) {
      yPos -= speed;
    }
  }

  // arrowSpeed(float drawPower)
  // arrowTrajectory()
  
  //-------------------------getters--------------------------//
  
  public float getXPos() {
    return xPos;
  }
  
  public float getYPos() {
    return yPos;
  }
  
  public float getSpeed() {
    return speed;
  }
  
  public int getArrowLength() {
    return arrowLength; 
  }
  
 
  //-------------------------setters--------------------------//
  
  public void setXPos(float xPos) {
    this.xPos = xPos;
  }
  
  public void setYPos(float yPos) {
    this.yPos = yPos;  
  }
}
