public class Arrow {
 
  //-------------------instance variables---------------------// 

  private int arrowWidth = 3;
  private int arrowLength = 60;
  private float xPos;    
  private float yPos = height-arrowLength;
  private float speed = 100;
  private boolean targetWasHit = false;
  private boolean leftOfTarget = false;
  private boolean aboveTarget = false;
  //private float[] landedArrowXY = new float[2];
  private float[] hitXYDist = new float[2];

  //----------------------constructors------------------------//

   public Arrow() {
     
  }

  //-------------------------methods--------------------------//
  
  public void display() {
    if (targetWasHit == true) {
      //hitXYDist[0] = (dist(landedArrowXY[0], target.getYPos(), target.getXPos(), target.getYPos())) / (target.getDiameter()/2);
      //hitXYDist[1] = (dist(target.getXPos(), landedArrowXY[1], target.getXPos(), target.getYPos())) / (target.getDiameter()/2);
      
      float relativeX;
      float relativeY;
      
      if (leftOfTarget == false) {
        relativeX = target.getXPos() + ((target.getDiameter()/2) * hitXYDist[0]);      
      } else {
        relativeX = target.getXPos() - ((target.getDiameter()/2) * hitXYDist[0]);
      }
      
      if (aboveTarget == false) {
        relativeY = target.getYPos() + ((target.getDiameter()/2) * hitXYDist[1]);
      } else {
        relativeY = target.getYPos() - ((target.getDiameter()/2) * hitXYDist[1]);
      }
        
      rect(relativeX, relativeY, arrowWidth, arrowLength);                                    // shaft
      line(relativeX - arrowWidth/2, relativeY, relativeX + arrowWidth + arrowWidth/2, relativeY);      // edge of arrowhead
      
    }
    else if (yPos == target.getYPos() + (target.getDiameter()/2) * power.adjust()) {
      rect(xPos, yPos, arrowWidth, arrowLength);                                    // shaft
      line(xPos - arrowWidth/2, yPos, xPos + arrowWidth + arrowWidth/2, yPos);      // edge of arrowhead
    } 
    else if (yPos < height-arrowLength) {                // arrow in flight
      rect(xPos, yPos, arrowWidth, arrowLength);         // shaft
      triangle(xPos + arrowWidth/2, yPos - 10,           // top point
         xPos - arrowWidth/2, yPos,                      // bottom left point
         xPos + arrowWidth + arrowWidth/2, yPos);        // bottom right point
    }
    else {                                                                            // arrow nocked
      rect(bow.getXPos() + (bow.getBowWidth()/2), yPos, arrowWidth, arrowLength);     // shaft
      triangle(bow.getXPos() + (bow.getBowWidth()/2) + arrowWidth/2, yPos - 10,       // top point
         bow.getXPos() + (bow.getBowWidth()/2) - arrowWidth/2, yPos,                  // bottom left point
         bow.getXPos() + (bow.getBowWidth()/2) + arrowWidth + arrowWidth/2, yPos);    // bottom right point
    }
  }

  public void looseArrow() {
    if (yPos > target.getYPos() + (target.getDiameter()/2) * power.adjust()) {
      yPos -= speed;
      xPos += wind.getWindSpeed();
    }
  }
  
  public void resetArrow() {
    setYPos(height-arrowLength);
    targetWasHit = false;
  }
  
  /*public void pinToTarget(float xPos, float yPos) {
    
    if (targetHit() == true) {
      landedArrowXY[0] = xPos; 
      landedArrowXY[1] = yPos;
    }
    
    target.getXPos();
    target.getYPos();
    target.getDiameter();
    setXPos(xPos);
    setYPos(yPos);
  }*/

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
  
  public void setTargetWasHit(boolean wasHit) {
    this.targetWasHit = wasHit;
  }
  
  public void setLeftOfTarget(boolean side) {
    this.leftOfTarget = side;
  }
  
  public void setAboveTarget(boolean topBot) {
    this.aboveTarget = topBot;
  }
}
