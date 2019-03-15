public class Target {
 
  //-------------------instance variables---------------------// 

  private float xPos = random((width * .3),(width * .7));
  private float yPos = random((height * .2),(height * .5));
  private float diameter = yPos/2;

  //----------------------constructors------------------------//

  public Target(){

  }

  //-------------------------methods--------------------------//
  
  public void display() {
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
  
  public void resetTarget() {
    xPos = random((width * .3),(width * .7));
    yPos = random((height * .2),(height * .5));
    diameter = yPos/2;
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
