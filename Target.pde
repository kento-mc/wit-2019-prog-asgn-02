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
    fill(0);
    circle(xPos, yPos, (diameter * .8));
    fill(10, 150, 225);
    circle(xPos, yPos, (diameter * .6));
    fill(255,0,0);
    circle(xPos, yPos, (diameter * .4));
    fill(255, 255, 75);
    circle(xPos, yPos, (diameter * .2));
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

  
}
