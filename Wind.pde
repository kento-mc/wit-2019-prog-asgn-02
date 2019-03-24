public class Wind {
  
  //-------------------instance variables---------------------// 

  private float windSpeed = random(-20,20);          // Randomize wind speed and direction
  

  //----------------------constructors------------------------//

  public Wind() {
  }

  //-------------------------methods--------------------------//

  void display() {                                   // Draw wind speed graphic
    fill(255);
    textAlign(CENTER);
    textSize(24);
    text("Wind", width * .7 + width/7, height/24);   
    if (abs(windSpeed) < 3.33) {                     // wind speed indicator changes color based on speed
      fill(55,235,0);
    } else if (abs(windSpeed) < 6.67) {
      fill(175,250,0);
    } else if (abs(windSpeed) < 10) {
      fill(255,255,0);
    } else if (abs(windSpeed) < 13.33) {
      fill(255,200,0);
    } else if (abs(windSpeed) < 16.67) {
      fill(255,125,0);
    } else {
      fill(255,0,0);
    }
    textSize(20);   
    text(nf(abs(windSpeed), 0, 2) + " km/h", width * .7 + width/7, height/12);  // Used nf() to truncate number of decimal places displayed to 2
                                                                                // https://forum.processing.org/two/discussion/23814/#Comment_104014
    rect(width * .71, height/21, width/3.8, height/100);
    if (windSpeed < 0) {                                                              // Left-pointing arrow
      triangle(width * .7, height/19, width * .7 + width/50, height/28,
               width * .7 + width/50, height/14);
    } else {                                                                          // Right-pointing arrow
      triangle(width * .7 + width/3.5, height/19, width * .7 + width/3.5 - width/50,
               height/28, width * .7 + width/3.5 - width/50, height/14);
    }
  }
 
  //-------------------------getters--------------------------//
  
  public float getWindSpeed() {
    return windSpeed;
  }
 
  //-------------------------setters--------------------------//
  
  public void setWindSpeed() {               // No value to pass in. Number is randommly generated.
    windSpeed = random(-20,20);
  }

}  
