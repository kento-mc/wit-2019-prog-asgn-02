public class Bow {
  
  //-------------------instance variables---------------------// 

  private float xPos = 0;                            // Initializes bow object x position
  private float yPos = height - height/40;           // Sets bow object y position
  private float bowWidth = width/5;                  // Sets bow object width
  private float bowHeight = height/10;               // Sets bow object height
  
  // drawPower

  //----------------------constructors------------------------//

  public Bow(float xPos) {                           // mouseX is passed in here so the bow follows the mouse
    this.xPos = xPos;
  }

  //-------------------------methods--------------------------//

  void display() {                                   // Draws the bow
    if (arrowLoosed() == false) {                    // If the arrow object is nocked to the bow object
      fill(85,65,40);                                // the bow object is drawn with the string pulled back
      ellipse(xPos, yPos, bowWidth, bowHeight);
      fill(0, 175, 0);
      ellipse(xPos, yPos, bowWidth, bowHeight/1.2);
      noStroke();
      rect(xPos - bowWidth * .6, height - height/40, bowWidth * 2, height/40);  // hides bottom of bow ellipse
      stroke(0);
      line(xPos - bowWidth/2, yPos, xPos, height);
      line(xPos + bowWidth/2, yPos, xPos, height);
    } else {                                        // If the arrow object has been loosed, the string is no longer pulled back
      fill(85,65,40);
      ellipse(xPos, yPos - height/40, bowWidth*1.2, bowHeight/2);
      fill(0, 175, 0);
      ellipse(xPos, (yPos - height/40) + 1, bowWidth*1.2, (bowHeight/2)/1.2);
      noStroke();
      rect(xPos - bowWidth * .6, yPos - height/40, bowWidth * 2, height/10);  // hides bottom of bow ellipse
      stroke(0);
      line(xPos - (bowWidth*1.2)/2, yPos - height/40, xPos + (bowWidth*1.2)/2, yPos - height/40);    
    }
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
