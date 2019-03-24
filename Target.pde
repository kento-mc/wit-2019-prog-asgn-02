public class Target {
 
  //-------------------instance variables---------------------// 

  private float xPos = random((width * .3),(width * .7));  // Randomizes x position
  private float yPos = height * .45;                       // Initializes y position
  private float diameter = yPos/2;                         // Sets diameter

  //----------------------constructors------------------------//

  public Target(){
  }
  
  public Target(float yPos) {
    this.yPos = yPos;
  }

  //-------------------------methods--------------------------//
  
  public void display() {                        // Draw target
    stroke(0);
    fill(255);
    circle(xPos, yPos, diameter);
    circle(xPos, yPos, (diameter * .9));
    fill(0);
    circle(xPos, yPos, (diameter * .8));
    circle(xPos, yPos, (diameter * .7));
    fill(10, 150, 225);
    circle(xPos, yPos, (diameter * .6));
    circle(xPos, yPos, (diameter * .5));
    fill(255,0,0);
    circle(xPos, yPos, (diameter * .4));
    circle(xPos, yPos, (diameter * .3));
    fill(255, 255, 75);
    circle(xPos, yPos, (diameter * .2));
    circle(xPos, yPos, (diameter * .1));
  }
  
  public void resetTarget() {                    // Randomize x position
    xPos = random((width * .3),(width * .7));
    diameter = yPos/2;                           // Sets y position
  }
  
  public void resetTargetRound() {               // Randomize x position
    xPos = random((width * .3),(width * .7));
    yPos -= (height * .45 - height * .1) / player.getRoundScores().length;  // Sets target further back with each round
  }
  
  //-------------------------getters--------------------------//
  
  public float getXPos() {
    return xPos;
  }
  
  public float getYPos() {
    return yPos;  
  }
  
  public float getDiameter() {
    return diameter;
  }
  
  //-------------------------setters--------------------------//

  public void setXPos(float xPos) {
    this.xPos = xPos;
  }
  
  public void setYPos(float yPos) {
    this.yPos = yPos;
  }
}
