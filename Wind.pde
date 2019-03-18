public class Wind {
  
  //-------------------instance variables---------------------// 

  private float windSpeed = random(-20,20);    
  

  //----------------------constructors------------------------//

  public Wind() {
  }

  //-------------------------methods--------------------------//

  void display() {
    fill(255);
    textAlign(CENTER);
    text("Wind", width/6, height/12);    
    fill(255,0,0);
    textSize(20);
    text(nf(abs(windSpeed), 0, 2) + " km/h", width/6, height/8);
    rect(width/30, height/11, width/3.8, height/100);
    if (windSpeed < 0) {
      triangle(width/36, height/10.5, width/18, height/13.2, width/18, height/8.8);
    } else {
      triangle(width/35 + width/3.5, height/10.5, width/18 + width/4.3, height/13.2, width/18 + width/4.3, height/8.8);
    }
  }
 
  //-------------------------getters--------------------------//
  
  public float getWindSpeed() {
    return windSpeed;
  }
 
  //-------------------------setters--------------------------//
  
  public void setWindSpeed() {   // No value to pass in. Number is randommly generated.
    windSpeed = random(-20,20);
  }

}  
