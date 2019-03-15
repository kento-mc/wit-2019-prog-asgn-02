public class PowerMeter {

  //-------------------instance variables---------------------// 

  private int boxWidth = 50;
  private int boxHeight = 150;
  private float barHeight = height*.01;
  private float boxYPos = (height * .7);
  private float barYPos = (height * .7 + boxHeight - barHeight);
  private float speed = 5;

  //----------------------constructors------------------------//

  public PowerMeter() {
  
  }

  //-------------------------methods--------------------------//

  public void display() {
    rect(width*.01, boxYPos, boxWidth, boxHeight);
    fill(125, 250, 115);
    rect(width*.01, boxYPos + (boxHeight/2 - barHeight/2), boxWidth, barHeight*2);
    fill(200);
    rect(width*.01, barYPos, boxWidth, barHeight);

    barYPos -= speed;

    if (barYPos < boxYPos + barHeight || barYPos > (boxYPos + boxHeight - (height * .01))) {
      speed = (speed * -1);
    }
  }
  
  public void resetPower() {
    setYPos((height * .7 + boxHeight - barHeight));
    setSpeed(5);
  }
  
  public void clickStop() {
    setSpeed(0);
    
    if (speed > 0) {
      barYPos -=10;
    } else {
      barYPos += 5;
    }
  }
  
  /*public float powerAdjust() {
    
    if (barYPos < green box) {
      float overpowered = dist calculation;
      return overpowered;
    } else if (barYPos > green box) {
      float underpowered = dist calculation;
      return underpowered;
    } else {
      float powered = 1;
      return powered
    }
  }*/
  
  

  //-------------------------getters--------------------------//
  
  public int getBoxHeight() {
    return boxHeight;
  }
  
  public float getBarHeight() {
    return barHeight;
  }

  //-------------------------setters--------------------------//

  public void setSpeed(float speed) {
    this.speed = speed;
  }
  
  public void setYPos(float yPos) {
    this.barYPos = yPos;
  }
}
