// RobinHoodTrainer v0.3

import javax.swing.JOptionPane;

Target target;
Bow bow;
Arrow arrow;
PowerMeter power;
Player player;

int shotScore = 0;
int gameScore = 0;
int maxShots = 5;
int maxGames = 5;
int numberOfGamesPlayed = 0;
float[] savedX;

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
  bow = new Bow(mouseX);
  bow.display();
  arrow.display();
  power.display();

  boolean loosed = arrowLoosed();
  if (loosed == true) {
    arrow.looseArrow();
  }

  boolean landed = arrowLanded();             // REFACTOR W/ FOR LOOP
  if (landed == true) {
    arrow.setYPos(target.getYPos());          // UPDATE W/ POWER
  }

  boolean hit = targetHit();
  float shotQuality = dist(arrow.getXPos(), arrow.getYPos(), target.getXPos(), target.getYPos());
  if (hit == true) {
    if (shotQuality < (target.getDiameter() * .1)/2) {
      shotScore = 100;
      player.addShot(shotScore);
    } else if (dist(arrow.getXPos(), arrow.getYPos(), target.getXPos(), target.getYPos()) < (target.getDiameter() * .2)/2) {
      shotScore = 90;
      player.addShot(shotScore);
    } else if (dist(arrow.getXPos(), arrow.getYPos(), target.getXPos(), target.getYPos()) < (target.getDiameter() * .3)/2) {
      shotScore = 80;
      player.addShot(shotScore);
    } else if (dist(arrow.getXPos(), arrow.getYPos(), target.getXPos(), target.getYPos()) < (target.getDiameter() * .4)/2) {
      shotScore = 70;
      player.addShot(shotScore);
    } else if (dist(arrow.getXPos(), arrow.getYPos(), target.getXPos(), target.getYPos()) < (target.getDiameter() * .5)/2) {
      shotScore = 60;
      player.addShot(shotScore);
    } else if (dist(arrow.getXPos(), arrow.getYPos(), target.getXPos(), target.getYPos()) < (target.getDiameter() * .6)/2) {
      shotScore = 50;
      player.addShot(shotScore);
    } else if (dist(arrow.getXPos(), arrow.getYPos(), target.getXPos(), target.getYPos()) < (target.getDiameter() * .7)/2) {
      shotScore = 40;
      player.addShot(shotScore);
    } else if (dist(arrow.getXPos(), arrow.getYPos(), target.getXPos(), target.getYPos()) < (target.getDiameter() * .8)/2) {
      shotScore = 30;
      player.addShot(shotScore);
    } else if (dist(arrow.getXPos(), arrow.getYPos(), target.getXPos(), target.getYPos()) < (target.getDiameter() * .9)/2) {
      shotScore = 20;
      player.addShot(shotScore);
    } else if (dist(arrow.getXPos(), arrow.getYPos(), target.getXPos(), target.getYPos()) < target.getDiameter()/2) {
      shotScore = 10;
      player.addShot(shotScore);
    } else {
      shotScore = 0;
      player.addShot(shotScore);
    }
  }

  println("Target hit? " + targetHit() + "\n" +
    "Shot score: " + shotScore + "\n" +
    dist(arrow.getXPos(), arrow.getYPos(), target.getXPos(), target.getYPos()) + "\n" +
    (target.getDiameter() * .1)/2 + "\n" +
    player.getShotCount());
}  // close draw() method


//-------------------------methods--------------------------//

void mouseClicked() {
  savedX[0] = mouseX;
  arrow.setXPos(savedX[0] + bow.getBowWidth()/2);
  arrow.looseArrow();
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


// windDirection()
// windSpeed()
// powerMeter()
