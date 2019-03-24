public class Arrow {
 
  //-------------------instance variables---------------------// 

  private float arrowWidth = width/200;              // Sets arrow object width
  private float arrowLength = height/13.333;         // Sets arrow object height
  private float xPos;                                // Declares variable for x position
  private float yPos = height-arrowLength;           // Initializes y position to align with bow object
  private float speed = 100;                         // Speed of the arrow object in flight
  private boolean targetWasHit = false;              // Was the target hit?
  private boolean leftOfTarget = false;              // Was the hit on the left side of the target?
  private boolean aboveTarget = false;               // Was the hit above the center of the target?
  private boolean noHead = false;                    // Is the arrowhead visible or buried?
  private float[] hitXYDist = new float[2];          // Array to store x and y axis distances of initial target hit positions
                                                     // so that the landed arrow can be re-drawn when the target moves

  //----------------------constructors------------------------//

  public Arrow() {
     
  }
  
  public Arrow(float yPos) {     // Overloaded constructor to draw replacement arrow objects for arrows that missed the target 
    this.yPos = yPos;            // and were thus passed into the arrowMisses array. These replacement arrows are drawn off screen
  }                              /* so they won't be seen, but they keep the array from containing a null value, which throws an
                                    error whenever the array is looped through.*/

  //-------------------------methods--------------------------//
  
  public void display() {        // Display arrow object
    if (targetWasHit == true) {  /* If an arrow object hits the target, this if statement will redraw that arrow object in the 
                                    same  relative position each time the target is redrawn in the same round. This is more complex
                                    than it needs to be for the current version of the game. I kept it from an earlier version
                                    where the targets were also redrawn with randomized y positions and sizes. In the final version
                                    only the x position is randomized, because each round sets the y position and size of the targets.*/

      float relativeX;           // Declare varialbe for x position, relative to newly drawn target
      float relativeY;           // Declare varialbe for y position, relative to newly drawn target
      
      if (leftOfTarget == false) {  // If the arrow object hits the right side of the target
      
        relativeX = target.getXPos() + ((target.getDiameter()/2) * hitXYDist[0]);  // Sets x position relative to diameter
        
      } else {                      // If the arrow object hits the left side of the target
      
        relativeX = target.getXPos() - ((target.getDiameter()/2) * hitXYDist[0]);  // Sets x position relative to diameter
      }
      
      if (aboveTarget == false) {  // if the arrow object hits below the center of the target
      
        relativeY = target.getYPos() + ((target.getDiameter()/2) * hitXYDist[1]);  // Sets y position relative to diameter
        
      } else {                     // if the arrow object hits above the center of the target
        
        relativeY = target.getYPos() - ((target.getDiameter()/2) * hitXYDist[1]);  // Sets y position relative to diameter
      }

      fill(200);
      triangle(relativeX + arrowWidth/2, relativeY + arrowLength * .8, relativeX - arrowWidth, relativeY + arrowLength, relativeX + arrowWidth *2, relativeY +arrowLength);  // feathers  
      fill(135, 120, 105);
      rect(relativeX, relativeY, arrowWidth, arrowLength);                                              // shaft
      line(relativeX - arrowWidth/2, relativeY, relativeX + arrowWidth + arrowWidth/2, relativeY);      // edge of arrowhead
      
    }
    else if (yPos < height - arrowLength && noHead == true) {  // arrowhead being buried persists w/ sunsequent arrow shots
      fill(200);
      triangle(xPos + arrowWidth/2, yPos + arrowLength * .8, xPos - arrowWidth, yPos + arrowLength, xPos + arrowWidth *2, yPos +arrowLength);  // feathers 
      fill(135, 120, 105);
      rect(xPos, yPos, arrowWidth, arrowLength);                                    // shaft
      line(xPos - arrowWidth/2, yPos, xPos + arrowWidth + arrowWidth/2, yPos);      // edge of arrowhead
    }
    else if (yPos == target.getYPos() + (target.getDiameter()/2) * power.adjust()) {  // arrow landed
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
      triangle(xPos + arrowWidth/2, yPos - 10,           // arrowhead top point
         xPos - arrowWidth/2, yPos,                      // bottom left point
         xPos + arrowWidth + arrowWidth/2, yPos);        // bottom right point
    }
    else {                                                    // arrow nocked
      fill(200);      
      triangle(bow.getXPos() + arrowWidth/2, yPos + arrowLength * .8, bow.getXPos() - arrowWidth, yPos + arrowLength, bow.getXPos() + arrowWidth *2, yPos +arrowLength);  // feathers
      fill(135, 120, 105);
      rect(bow.getXPos(), yPos, arrowWidth, arrowLength);     // shaft
      fill(150);
      triangle(bow.getXPos() + arrowWidth/2, yPos - 10,       // arrowhead top point
         bow.getXPos() - arrowWidth/2, yPos,                  // bottom left point
         bow.getXPos() + arrowWidth + arrowWidth/2, yPos);    // bottom right point
    }
  }

  public void looseArrow() {                                  // arrow is loosed
    if (yPos > target.getYPos() + (target.getDiameter()/2) * power.adjust()) {  // If arrow object y position is greater than its landing place
      yPos -= speed;                                          // increment speed
      xPos += wind.getWindSpeed();                            // add wind speed adjustment to x position value
    }
  }
  
  public void resetArrow() {                                  // Reset arrow object to initial position - nocked to the bow object
    setYPos(height-arrowLength);
    targetWasHit = false;                                     // Reset targetWasHit boolean
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
