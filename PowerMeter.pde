public class PowerMeter {

  //-------------------instance variables---------------------// 

  private float boxWidth = (width/12);               // Set width
  private float boxHeight = (height * .3);           // Set height
  private float boxXPos = (width * .01);             // Set x position
  private float boxYPos = (height * .6);             // Set y position
  private float barHeight = (height * .02);          // Set size of moving bar
  private float barYPos = (height * .6 + boxHeight - barHeight);  // Initialized moving bar y position
  private float greenYPos = boxYPos + (boxHeight/2 - barHeight);  // Set position of green section
  private float speed = (-barHeight * .7);           // Set moving bar speed

  //----------------------constructors------------------------//

  public PowerMeter() {
  
  }

  //-------------------------methods--------------------------//

  public void display() {                                   // Draw the power meter
    noStroke();
    fill(255,0,0);                                          
    rect(boxXPos, boxYPos, boxWidth, boxHeight);            // red limits
    fill(255,75,0);                                          
    rect(boxXPos, boxYPos + boxHeight*.1, boxWidth, boxHeight * .8);  // orange-red
    fill(255,150,0);                                          
    rect(boxXPos, boxYPos + boxHeight*.2, boxWidth, boxHeight * .6);  // orange
    fill(255,255,0);                                          
    rect(boxXPos, boxYPos + boxHeight*.3, boxWidth, boxHeight * .4);  // yellow
    fill(100, 250, 100);
    rect(boxXPos, greenYPos, boxWidth, barHeight*2);        // green section
    stroke(0);
    strokeWeight(2);
    noFill();
    rect(boxXPos, boxYPos, boxWidth, boxHeight);            // outer box
    strokeWeight(1);
    fill(200, 200);
    rect(boxXPos, barYPos, boxWidth, barHeight);            // moving bar

    barYPos -= speed;                                       // set bar in motion

    if (barYPos < boxYPos || barYPos > (boxYPos + boxHeight - barHeight)) {  // if moving bar hits top or bottom 
      speed = (speed * -1);                                                  // of box, reverse direction
    }
  }
  
  public void resetPower() {                                // Reset power meter
    setYPos(boxYPos + boxHeight - barHeight);               // Reset moving bar y position
    setSpeed(-barHeight * .7);                              // Restart bar motion
  }
  
  public void clickStop() {                                 // Stops bar when mouse is clicked
    setSpeed(0);
    
    if (barYPos < boxHeight/2) {                            // Adjusts y position when clicked 
      barYPos += barHeight/2;                               // to make it feel more accurate
    } else {
      barYPos -= barHeight/2;
    }
  }
  
  public float adjust() {  // adjusts where the arrow object lands based on where the moving bar is stopped within the power meter
    
    float topDist = dist(boxXPos, greenYPos, boxXPos, boxYPos + height/40);  // Distance between top of the box and green section
    float botDist = dist(boxXPos, greenYPos + barHeight, boxXPos, boxYPos + boxHeight - height/40); // Distance between bottom of box and green section
    float topBarDist = dist(boxXPos, barYPos, boxXPos, greenYPos);  // Distance between moving bar and green section when in top section
    float botBarDist = dist(boxXPos, barYPos + barHeight, boxXPos, greenYPos + barHeight*2); // Distance between moving bar and green section when in bottom section
    
    if (barYPos < greenYPos) {                     // If moving bar is above the green section when stopped
      float overpowered = topBarDist/topDist;      // Calculation for an overpowered shot
      return overpowered * -1;                     // Adjusts to above center of target
    } else if (barYPos > greenYPos + barHeight) {  // If moving bar is below the green section when stopped
      float underpowered = botBarDist/botDist;     // Calculation for an underpowered shot
      return underpowered;                         // Adjusts to below center of target
    } else {                                       // If moving bar is stopped inside the green section
      float powered = 0;                           // No calculation performed
      return powered;                              // No adjustment made
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
