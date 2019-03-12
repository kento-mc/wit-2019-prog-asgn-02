public class Arrow {
 
  //-------------------instance variables---------------------// 

  private int arrowWidth = 3;
  private int arrowLength = 60;
  private float xPos;    
  private float yPos = height-arrowLength;
  private float speed = 100;

  //----------------------constructors------------------------//

   public Arrow() {
     
  }

  //-------------------------methods--------------------------//
  
  public void display() {
    if (yPos < height-arrowLength) {               // arrow in flight
      rect(xPos, yPos, arrowWidth, arrowLength);
      triangle(xPos + arrowWidth/2, yPos - 10,     // top point
         xPos - arrowWidth/2, yPos,                // bottom left point
         xPos + arrowWidth + arrowWidth/2, yPos);  // bottom right point
    }
    else {                                                                       // arrow nocked
    rect(bow.getXPos() + (bow.getWidth()/2), yPos, arrowWidth, arrowLength);
    triangle(bow.getXPos() + (bow.getWidth()/2) + arrowWidth/2, yPos - 10,       // top point
         bow.getXPos() + (bow.getWidth()/2) - arrowWidth/2, yPos,                // bottom left point
         bow.getXPos() + (bow.getWidth()/2) + arrowWidth + arrowWidth/2, yPos);  // bottom right point
    }
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
  
    public int getArrowWidth() {
    return arrowWidth; 
  }
 
  //-------------------------setters--------------------------//
  
  public void setXPos(float xPos) {
    this.xPos = xPos;
  }
  
  public void setYPos(float yPos) {
    this.yPos = yPos;  
  }
}
