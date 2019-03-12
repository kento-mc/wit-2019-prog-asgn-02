public class Arrow {
 
  //-------------------instance variables---------------------// 

  private float xPos = mouseX;    // initializes Arrow x position to mouseX
  private float yPos = height-60;
  
  // drawPower

  //----------------------constructors------------------------//

  public Arrow(float xPos) {
    this.xPos = xPos;
  }

  //-------------------------methods--------------------------//
  
  public void display() {
    rect(xPos, yPos, 20, 60);
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
  
  
  //-------------------------setters--------------------------//
  
  public void setXPos(float xPos) {
    this.xPos = xPos;
  }
  
  public void setYPos(float yPos) {
    this.yPos = yPos;  
  }
}
