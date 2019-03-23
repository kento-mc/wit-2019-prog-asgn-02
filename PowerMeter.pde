public class PowerMeter {

  //-------------------instance variables---------------------// 

  private float boxWidth = (width/12);
  private float boxHeight = (height * .3);
  private float boxXPos = (width * .01);
  private float boxYPos = (height * .6);
  private float barHeight = (height * .02);
  private float barYPos = (height * .6 + boxHeight - barHeight);
  private float greenYPos = boxYPos + (boxHeight/2 - barHeight);
  private float speed = (-barHeight * .7);

  //----------------------constructors------------------------//

  public PowerMeter() {
  
  }

  //-------------------------methods--------------------------//

  public void display() {
    noStroke();
    fill(255,0,0);                                          
    rect(boxXPos, boxYPos, boxWidth, boxHeight);            // red
    fill(255,75,0);                                          
    rect(boxXPos, boxYPos + boxHeight*.1, boxWidth, boxHeight * .8);
    fill(255,150,0);                                          
    rect(boxXPos, boxYPos + boxHeight*.2, boxWidth, boxHeight * .6);
    fill(255,255,0);                                          
    rect(boxXPos, boxYPos + boxHeight*.3, boxWidth, boxHeight * .4);
    fill(100, 250, 100);
    rect(boxXPos, greenYPos, boxWidth, barHeight*2);        // green section
    stroke(0);
    strokeWeight(2);
    noFill();
    rect(boxXPos, boxYPos, boxWidth, boxHeight);            // outer box
    strokeWeight(1);
    fill(200, 200);
    rect(boxXPos, barYPos, boxWidth, barHeight);            // moving bar

    barYPos -= speed;

    if (barYPos < boxYPos || barYPos > (boxYPos + boxHeight - barHeight)) {
      speed = (speed * -1);
    }
  }
  
  public void resetPower() {
    setYPos(boxYPos + boxHeight - barHeight);
    setSpeed(-barHeight * .7);
  }
  
  public void clickStop() {
    setSpeed(0);
    
    if (barYPos < boxHeight/2) {
      barYPos += barHeight/2;
    } else {
      barYPos -= barHeight/2;
    }
  }
  
  public float adjust() {
    
    float topDist = dist(boxXPos, greenYPos, boxXPos, boxYPos + height/40);
    float botDist = dist(boxXPos, greenYPos + barHeight, boxXPos, boxYPos + boxHeight - height/40);
    float topBarDist = dist(boxXPos, barYPos, boxXPos, greenYPos);
    float botBarDist = dist(boxXPos, barYPos + barHeight, boxXPos, greenYPos + barHeight*2);
    
    if (barYPos < greenYPos) {
      float overpowered = topBarDist/topDist;
      return overpowered * -1;
    } else if (barYPos > greenYPos + barHeight) {
      float underpowered = botBarDist/botDist;
      return underpowered;
    } else {
      float powered = 0;
      return powered;
    }
  }
  
  

  //-------------------------getters--------------------------//
  
  public float getBoxHeight() {
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
