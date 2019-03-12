// RobinHoodTrainer v0.3

import javax.swing.JOptionPane;

Target target;
Bow bow;
Arrow arrow;
PowerMeter power;
Player player;

int score = 0;
int attempts = 0;
int maxAttempts = 0;
int maxNumberOfGames = 5;
int numberOfGamesPlayer = 0;
float[] savedX;

void setup() {
  size(600,800);
  frameRate(30);
  noCursor();
  
  target = new Target();
  arrow = new Arrow();
  power = new PowerMeter();
  savedX = new float[2];
  //player = new Player(JOptionPane.showInputDialog("Welcome young challenger. What is your name?"));
}

void draw() {
  background(80,170,240);
  fill(0,150,0);
  noStroke();
  quad(width*.25, height*.2, width*.75, height*.2, width, height*.8, 0, height*.8);
  rect(0, height*.8, width, height*.2);
  
  target.display();
  bow = new Bow(mouseX);
  bow.display();
  arrow.display();
  power.display();
  
  boolean loosed = arrowLoosed();
  if (loosed == true) {
    arrow.looseArrow();
  }
  
  boolean hit = targetHit();
  if (hit == true) {
    arrow.setYPos(target.getYPos());
  }
    
  
  println("Target x position: " + target.getXPos() + "\n" 
                                + "Target y position: " 
                                + target.getYPos() + "\n"
                                + "mouseX position: " + mouseX
                                + "\n" + savedX[0]);
  
}  // close draw() method


//-------------------------methods--------------------------//

void mouseClicked() {
  savedX[0] = mouseX;
  arrow.setXPos(savedX[0]);
  arrow.looseArrow();

}

boolean arrowLoosed() {
  if (arrow.getYPos() < (bow.getYPos() - arrow.getArrowLength())){
    return true;
  }
  else {
    return false;
  }
}

boolean targetHit() {
  if (arrow.getYPos() > target.getYPos()) {
    return false;
  }
  else {
    return true;
  }
}
  
// windDirection()
// windSpeed()
// powerMeter()
