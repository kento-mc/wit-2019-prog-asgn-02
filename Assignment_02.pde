// RobinHoodTrainer v0.1
import javax.swing.JOptionPane;

Target target;
Arrow arrow;
Player player;

int score = 0;
int attempts = 0;
int maxAttempts = 0;
int maxNumberOfGames = 5;
int numberOfGamesPlayer = 0;

void setup() {
  size(600,800);
  frameRate(5);
  noCursor();
  
  target = new Target();
  arrow = new Arrow(mouseX);
  //player = new Player(JOptionPane.showInputDialog("Welcome young challenger. What is your name?"));
}

void draw() {
  background(80,170,240);
  fill(0,150,0);
  noStroke();
  quad(width*.25, height*.2, width*.75, height*.2, width, height*.8, 0, height*.8);
  rect(0, height*.8, width, height*.2);
  
  target.display();
  arrow.display();
  if (mousePressed) {
    looseArrow();
  }
  
  println("Target x position: " + target.getXPos() + "\n" + "Target y position: " + target.getYPos());
  
}  // close draw() method


//-------------------------methods--------------------------//

void looseArrow() {
  for(float i = arrow.getYPos(); i > target.getYPos(); i -= .5) {
    arrow.display();
    arrow.setYPos(i); 
  } 
}

// windDirection()
// windSpeed()
// powerMeter()
