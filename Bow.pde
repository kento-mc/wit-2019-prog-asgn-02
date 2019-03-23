public class Bow {
  
  //-------------------instance variables---------------------// 

  private float xPos = 0;    
  private float yPos = height - height/40;
  private float bowWidth = width/5;
  private float bowHeight = height/10;
  
  // drawPower

  //----------------------constructors------------------------//

  public Bow(float xPos) {
    this.xPos = xPos; //- bowWidth/2;
  }

  //-------------------------methods--------------------------//

  void display() {
    if (arrowLoosed() == false) {
      fill(85,65,40);
      ellipse(xPos, yPos, bowWidth, bowHeight);
      fill(0, 100, 0);
      ellipse(xPos, yPos, bowWidth, bowHeight/1.2);
      noStroke();
      rect(xPos - bowWidth * .6, height - height/40, bowWidth * 2, height/40);  // hides bottom of bow ellipse
      stroke(0);
      line(xPos - bowWidth/2, yPos, xPos, height);
      line(xPos + bowWidth/2, yPos, xPos, height);
    } else {
      fill(85,65,40);
      ellipse(xPos, yPos - height/40, bowWidth*1.2, bowHeight/2);
      fill(0, 100, 0);
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
