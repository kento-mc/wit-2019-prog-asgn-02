public class Arrow {
 
  //-------------------instance variables---------------------// 

  private float arrowWidth = width/200;
  private float arrowLength = height/13.333;
  private float xPos;    
  private float yPos = height-arrowLength;
  private float speed = 100;
  private boolean targetWasHit = false;
  private boolean leftOfTarget = false;
  private boolean aboveTarget = false;
  private boolean noHead = false;
  //private float[] landedArrowXY = new float[2];
  private float[] hitXYDist = new float[2];

  //----------------------constructors------------------------//

  public Arrow() {
     
  }
  
  public Arrow(float yPos) {
    this.yPos = yPos;
  }

  //-------------------------methods--------------------------//
  
  public void display() {
    if (targetWasHit == true) {

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

      fill(200);
      triangle(relativeX + arrowWidth/2, relativeY + arrowLength * .8, relativeX - arrowWidth, relativeY + arrowLength, relativeX + arrowWidth *2, relativeY +arrowLength);  // feathers  
      fill(135, 120, 105);
      rect(relativeX, relativeY, arrowWidth, arrowLength);                                              // shaft
      line(relativeX - arrowWidth/2, relativeY, relativeX + arrowWidth + arrowWidth/2, relativeY);      // edge of arrowhead
      
    }
    else if (yPos < height - arrowLength && noHead == true) {
      fill(200);
      triangle(xPos + arrowWidth/2, yPos + arrowLength * .8, xPos - arrowWidth, yPos + arrowLength, xPos + arrowWidth *2, yPos +arrowLength);  // feathers 
      fill(135, 120, 105);
      rect(xPos, yPos, arrowWidth, arrowLength);                                    // shaft
      line(xPos - arrowWidth/2, yPos, xPos + arrowWidth + arrowWidth/2, yPos);      // edge of arrowhead
    }
    else if (yPos == target.getYPos() + (target.getDiameter()/2) * power.adjust()) {
      fill(200);      
      triangle(xPos + arrowWidth/2, yPos + arrowLength * .8, xPos - arrowWidth, yPos + arrowLength, xPos + arrowWidth *2, yPos +arrowLength);  // feathers 
      fill(135, 120, 105);
      rect(xPos, yPos, arrowWidth, arrowLength);                                    // shaft
      line(xPos - arrowWidth/2, yPos, xPos + arrowWidth + arrowWidth/2, yPos);      // edge of arrowhead
    } 
    else if (yPos < height-arrowLength) {                // arrow in flight
      fill(200);      
      triangle(xPos + arrowWidth/2, yPos + arrowLength * .8, xPos - arrowWidth, yPos + arrowLength, xPos + arrowWidth *2, yPos +arrowLength);  // feathers
      fill(135, 120, 105);
      rect(xPos, yPos, arrowWidth, arrowLength);         // shaft
      fill(150);      
      triangle(xPos + arrowWidth/2, yPos - 10,           // head top point
         xPos - arrowWidth/2, yPos,                      // bottom left point
         xPos + arrowWidth + arrowWidth/2, yPos);        // bottom right point
    }
    else {                                                                            // arrow nocked
      fill(200);      
      triangle(bow.getXPos() + arrowWidth/2, yPos + arrowLength * .8, bow.getXPos() - arrowWidth, yPos + arrowLength, bow.getXPos() + arrowWidth *2, yPos +arrowLength);  // feathers
      fill(135, 120, 105);
      rect(bow.getXPos(), yPos, arrowWidth, arrowLength);     // shaft
      fill(150);
      triangle(bow.getXPos() + arrowWidth/2, yPos - 10,       // head top point
         bow.getXPos() - arrowWidth/2, yPos,                  // bottom left point
         bow.getXPos() + arrowWidth + arrowWidth/2, yPos);    // bottom right point
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
  
  public float getArrowLength() {
    return arrowLength; 
  }
  
    public float getArrowWidth() {
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
  
  public void setNoHead(boolean noHead) {
    this.noHead = noHead;
  }
}
