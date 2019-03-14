// RobinHoodTrainer v0.3

import javax.swing.JOptionPane;

Target target;
Bow bow;
Arrow arrow;
PowerMeter power;
Player player;

int shotNum = 0;
int shotCount = 0;
int shotScore = 0;
int gameScore = 0;
int maxShots = 5;
int maxGames = 5;
int numberOfGamesPlayed = 0;
float[] savedX;
float afterShotCounter = 0;

void setup() {
  size(600, 800);
  frameRate(30);
  noCursor();

  target = new Target();
  arrow = new Arrow();
  power = new PowerMeter();
  savedX = new float[2];
  player = new Player(JOptionPane.showInputDialog("Welcome young challenger. What is your name?"), 5, 5);
}

void draw() {
  background(80, 170, 240);
  fill(0, 150, 0);
  noStroke();
  quad(width*.25, height*.2, width*.75, height*.2, width, height*.8, 0, height*.8);
  rect(0, height*.8, width, height*.2);

  target.display();
  bow = new Bow(mouseX);                      // I could only get the bow to track mouseX  
  bow.display();                              // by passing it in from the draw() method
  arrow.display();
  power.display();

  if (shotCount == shotNum) {                 // controls game flow, shot iteratin
  
    boolean loosed = arrowLoosed();
    if (loosed == true) {
      arrow.looseArrow();
    }
  
    boolean landed = arrowLanded();             
    if (landed == true) {
      arrow.setYPos(target.getYPos());                            // UPDATE W/ POWER
    }
  
    boolean hit = targetHit();
    float shotQuality = dist(arrow.getXPos(), arrow.getYPos(), target.getXPos(), target.getYPos());
    if (hit == true) {
      if (shotQuality < (target.getDiameter() * .1)/2) {          // bulseye
        shotScore = 100;
        player.setShotScores(shotScore);
      } else if (shotQuality < (target.getDiameter() * .2)/2) {
        shotScore = 90;
        player.setShotScores(shotScore);
      } else if (shotQuality < (target.getDiameter() * .3)/2) {
        shotScore = 80;
        player.setShotScores(shotScore);
      } else if (shotQuality < (target.getDiameter() * .4)/2) {
        shotScore = 70;
        player.setShotScores(shotScore);
      } else if (shotQuality < (target.getDiameter() * .5)/2) {
        shotScore = 60;
        player.setShotScores(shotScore);
      } else if (shotQuality < (target.getDiameter() * .6)/2) {
        shotScore = 50;
        player.setShotScores(shotScore);
      } else if (shotQuality < (target.getDiameter() * .7)/2) {
        shotScore = 40;
        player.setShotScores(shotScore);
      } else if (shotQuality < (target.getDiameter() * .8)/2) {
        shotScore = 30;
        player.setShotScores(shotScore);
      } else if (shotQuality < (target.getDiameter() * .9)/2) {
        shotScore = 20;
        player.setShotScores(shotScore);
      } else if (shotQuality < target.getDiameter()/2) {
        shotScore = 10;
        player.setShotScores(shotScore);
      }   
    } else {
      shotScore = 0;
      player.setShotScores(shotScore);
    }
    
    boolean shotTaken = shotTaken();
    if (shotTaken == true) {
      shotCount++;
      player.setShotCount(shotCount);
    }
      
  }  // close if 

  boolean hit = targetHit();
  if (hit == true) {
    afterShotCounter += .2;                  // control for delay before dialog box opens
  }    
  
  if (afterShotCounter > 6 && shotCount > shotNum) {
    if (player.getShotScores().length == shotCount) {
      JOptionPane.showMessageDialog(null,
        "Nice shot! You scored " + player.getShotScores()[shotCount - 1] + "!" +
        "\nThat was your last shot for this round.",
        "Hit!",
        JOptionPane.PLAIN_MESSAGE);
      
      int roundTotal = 0;
      
      for (int i = 0; i < 5; i++) {
        roundTotal += player.getShotScores()[i];   
      }
      
      JOptionPane.showMessageDialog(null,
        "Your total score for this round is: " + roundTotal,
        "Game Over",
        JOptionPane.PLAIN_MESSAGE);    
    }
    else {
    
      int nextShot = JOptionPane.showConfirmDialog(null,
                     "Nice shot! You scored " + player.getShotScores()[shotCount - 1] + "!" + 
                     "\n\nReady for your next shot?", "Hit!",
                     JOptionPane.YES_NO_OPTION);
      if (nextShot == JOptionPane.YES_OPTION) {
        arrow.resetArrow();
        target.resetTarget();
        shotNum++;
        afterShotCounter = 0;
      }
    }
  }    
  
 /* if (shotCount == player.getShotScores().length && afterShotCounter > 6) {
    JOptionPane.showMessageDialog(null,
    "Your total score is: " + "XXX",
    "Game Over",
    JOptionPane.PLAIN_MESSAGE);    
  }*/

  println("Target hit? " + targetHit() + "\n" +
    "Shot score: " + shotScore + "\n" +
    dist(arrow.getXPos(), arrow.getYPos(), target.getXPos(), target.getYPos()) + "\n" +
    (target.getDiameter() * .1)/2 + "\n" +
    "Shot count: " + player.getShotCount() + ", After shot counter: " + (afterShotCounter));
  
  for (int i = 0; i < player.getShotScores().length; i++) {
    println("Shot score " + (i+1) + " is: " + player.getShotScores()[i]);
  }
    
}  // close draw() method


//-------------------------methods--------------------------//

void mouseClicked() {
  if (arrow.getYPos() > target.getYPos()) {         // arrow can't be moved after striking target
    savedX[0] = mouseX;
    arrow.setXPos(savedX[0] + bow.getBowWidth()/2);
    arrow.looseArrow();
  }
}

boolean arrowLoosed() {
  if (arrow.getYPos() < (bow.getYPos() - arrow.getArrowLength())) {
    return true;
  } else {
    return false;
  }
}

boolean arrowLanded() {
  if (arrow.getYPos() > target.getYPos()) {
    return false;
  } else {
    return true;
  }
}

boolean targetHit() {
  if (arrow.getYPos() == target.getYPos() &&
    dist(arrow.getXPos(), arrow.getYPos(), target.getXPos(), target.getYPos()) < (target.getDiameter()/2)) { 
    return true;
  } else {
    return false;   
  }
}

boolean shotTaken() {
  if (afterShotCounter > 0) {
    return true;
  }
  else {
    return false;
  }
}


// windDirection()
// windSpeed()
// powerMeter()
