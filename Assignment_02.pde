// RobinHoodTrainer v0.5

import javax.swing.JOptionPane;

Player player;
Target target;
Bow bow;
Arrow arrow;
PowerMeter power;
Wind wind;

String playerName;
Arrow[] arrows;
Arrow[] arrowMisses;
int shotNum = 0;
int shotCount = 0;
int shotScore = 0;
int roundScore = 0;
//int maxShots = 5;
//int maxRounds = 3;
float[] savedMouseX;
float[] landedArrowXY;
float[] hitTargetXY;
float afterShotCounter = 0;

void setup() {
  size(600, 800);
  frameRate(30);
  noCursor();

  String playerName =(JOptionPane.showInputDialog("A challenger approaches. What is your name?", "Player 1"));
  player = new Player(playerName, Integer.parseInt(JOptionPane.showInputDialog(
                                  "Welcome " + playerName + "!\n" +
                                  "How many rounds would you like to play?", "5")),
                                  Integer.parseInt(JOptionPane.showInputDialog(
                                  "And how many shots per round would you like to attempt?", "5")));
  arrows = new Arrow[player.getShotScores().length];    // set arrows array length to user input
  arrowMisses = new Arrow[player.getShotScores().length];
  
  for (int i = 0; i < player.getShotScores().length; i++) {    // initialize array of Arrow objects
    arrows[i] = new Arrow();
    arrowMisses[i] = new Arrow();
  }
  
  target = new Target(height * .45);       // initialize first round targets' y position to height/2
  power = new PowerMeter();
  wind = new Wind();
  savedMouseX = new float[1];          // not sure this needs to be an array
  landedArrowXY = new float[2];
  hitTargetXY = new float [2];
  
}

void draw() {
  background(80, 170, 240);
  fill(0, 150, 0);
  noStroke();
  quad(width*.25, height*.2, width*.75, height*.2, width, height*.8, 0, height*.8);
  rect(0, height*.8, width, height*.2);

  player.display();
  bow = new Bow(mouseX);                      // I could only get the bow to track mouseX  
  bow.display();                              // by passing it in from the draw() method
    
  for (int i = 0; i <= shotNum; i++) {        // display missed shots behind target
    arrowMisses[i].display();        
  }
  
  target.display();
  power.display();
  wind.display();
    
  for (int i = 0; i <= shotNum; i++) {        // continue to display all arrows that have been shot during a round
    arrows[i].display();    // XXX working on arrows array
  }
 
  if (shotCount == shotNum) {                 // controls game flow, shot iteration
  
    boolean loosed = arrowLoosed();
    if (loosed == true) {
      arrows[shotNum].looseArrow();    // XXX working on arrows array
    }
  
    boolean landed = arrowLanded();             
    if (landed == true) {
      arrows[shotNum].setYPos(target.getYPos() + (target.getDiameter()/2) * power.adjust());    // XXX working on arrows array     
    }
  
    boolean hit = targetHit();
    float shotQuality = dist(arrows[shotNum].getXPos(), arrows[shotNum].getYPos(), target.getXPos(), target.getYPos());
    if (hit == true) {
      if (shotQuality < (target.getDiameter() * .1)/2) {          // bullseye
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
    } else if (arrowLanded() == true) {
      shotScore = 0;
      player.setShotScores(shotScore);
    }
    
    boolean shotTaken = shotTaken();
    if (shotTaken == true) {
      shotCount++;
      player.setShotCount(shotCount);
    }
      
  }  // close control flow if 

  boolean landed = arrowLanded();
  if (landed == true) {
    afterShotCounter += .2;      // control for delay before after-shot dialog box opens
  }    
  
  if (afterShotCounter > 5 && shotCount > shotNum) {
    if (shotCount == player.getShotScores().length) {
      if (player.getShotScores()[shotCount-1] == 100) {
        JOptionPane.showMessageDialog(null,
          "Impressive... \n\nYou scored " + player.getShotScores()[shotCount - 1] + "!" +
          "\n\nThat was your last shot for this round.",
          "Bullseye!",
          JOptionPane.PLAIN_MESSAGE);
      } else if (player.getShotScores()[shotCount-1] >= 70) {
        JOptionPane.showMessageDialog(null,
          "Keep it up! \n\nYou scored " + player.getShotScores()[shotCount - 1] + "!" +
          "\n\nThat was your last shot for this round.",
          "Nice!",
          JOptionPane.PLAIN_MESSAGE);
      } else if (player.getShotScores()[shotCount-1] >= 40) {
         JOptionPane.showMessageDialog(null,
          "You're still in the game! \n\nYou scored " + player.getShotScores()[shotCount - 1] + "!" +
          "\n\nThat was your last shot for this round.",
          "Not bad!",
          JOptionPane.PLAIN_MESSAGE);
      } else if (player.getShotScores()[shotCount-1] > 10) {
         JOptionPane.showMessageDialog(null,
          "Gonna have to focus... \n\nYou scored " + player.getShotScores()[shotCount - 1] + "!" +
          "\n\nThat was your last shot for this round.",
          "Okay",
          JOptionPane.PLAIN_MESSAGE); 
      } else if (player.getShotScores()[shotCount-1] > 0) {
         JOptionPane.showMessageDialog(null,
          "Not exactly Robin Hood are ya? \n\nYou scored " + player.getShotScores()[shotCount - 1] + "!" +
          "\n\nThat was your last shot for this round.",
          "Oof",
          JOptionPane.PLAIN_MESSAGE);
      } else {
         JOptionPane.showMessageDialog(null,
          "Maybe you should stick to bowling. \n\nYou scored " + player.getShotScores()[shotCount - 1] + "!" +
          "\n\nThat was your last shot for this round.",
          "Miss!",
          JOptionPane.PLAIN_MESSAGE);
      }  
      
      int roundTotal = 0;
      
      for (int i = 0; i < player.getShotScores().length; i++) {
        roundTotal += player.getShotScores()[i];   
      }
            
      JOptionPane.showMessageDialog(null,
        "Your total score for round " + player.getRoundCount() + ": " + roundTotal + "\n\n" +
        "Your average shot score: " + roundTotal/player.getShotScores().length,
        "End of Round " + player.getRoundCount(),
        JOptionPane.PLAIN_MESSAGE); 
      
      if (player.getRoundCount() < player.getRoundScores().length) {  
        int nextRound = JOptionPane.showConfirmDialog(null,
                     "Would you like to continue to the next round?", "Ready for more?",
                     JOptionPane.YES_NO_OPTION);
                           
        if (nextRound == JOptionPane.YES_OPTION) {      
            player.resetPlayer();
            player.resetShotCount();
            player.addRoundScore(roundTotal);
            resetArrows();  
            target.resetTargetRound();
            target.resetTarget();
            wind.setWindSpeed();
            power.resetPower();
            afterShotCounter = 0;         
            shotNum = 0;
            shotCount = 0;
  
          } else {
            JOptionPane.showMessageDialog(null,
              "End of game message, not finishing rounds",
              "Game Over",
              JOptionPane.PLAIN_MESSAGE);
              
            exit();
          }
      }
      else {
        JOptionPane.showMessageDialog(null,
          "Finished all rounds",
          "Final Stats",
          JOptionPane.PLAIN_MESSAGE);
          
        exit();
      }   
    }  // close if that tests if shot is last of the round
    else {
      
      int nextShot;
      
      if (player.getShotScores()[shotCount-1] == 100) {
        nextShot = JOptionPane.showConfirmDialog(null,
                     "Impressive... \n\nYou scored " + player.getShotScores()[shotCount - 1] + "!" + 
                     "\n\nReady for your next shot?", "Bullseye!",
                     JOptionPane.YES_NO_OPTION);                
      } else if (player.getShotScores()[shotCount-1] >= 70) {
        nextShot = JOptionPane.showConfirmDialog(null,
                     "Keep it up! \n\nYou scored " + player.getShotScores()[shotCount - 1] + "!" + 
                     "\n\nReady for your next shot?", "Nice!",
                     JOptionPane.YES_NO_OPTION);
      } else if (player.getShotScores()[shotCount-1] >= 40) {
         nextShot = JOptionPane.showConfirmDialog(null,
                     "You're still in the game. \n\nYou scored " + player.getShotScores()[shotCount - 1] + "!" + 
                     "\n\nReady for your next shot?", "Not bad!",
                     JOptionPane.YES_NO_OPTION);
      } else if (player.getShotScores()[shotCount-1] > 10) {
         nextShot = JOptionPane.showConfirmDialog(null,
                     "Gonna have to focus. \n\nYou scored " + player.getShotScores()[shotCount - 1] + "!" + 
                     "\n\nReady for your next shot?", "Okay",
                     JOptionPane.YES_NO_OPTION); 
      } else if (player.getShotScores()[shotCount-1] > 0) {
         nextShot = JOptionPane.showConfirmDialog(null,
                     "Not exactly Robin Hood are ya? \n\nYou scored " + player.getShotScores()[shotCount - 1] + "!" + 
                     "\n\nReady for your next shot?", "Oof",
                     JOptionPane.YES_NO_OPTION);
      } else {
         nextShot = JOptionPane.showConfirmDialog(null,
                     "Maybe you should stick to bowling. \n\nYou scored " + player.getShotScores()[shotCount - 1] + "!" + 
                     "\n\nReady for your next shot?", "Miss!",
                     JOptionPane.YES_NO_OPTION);
        arrowMisses[shotNum] = arrows[shotNum];    // add missed shot arrow to arrowMisses array so it appears behind the next target
        arrows[shotNum] = new Arrow(height *2 );   // replace landed arrow with one drawn off screen. use overloaded arrow constructor
        
      }  
      
      if (nextShot == JOptionPane.YES_OPTION) {
        target.resetTarget();
        wind.setWindSpeed();
        power.resetPower();
        shotNum++;
        afterShotCounter = 0;
      } else {
        JOptionPane.showMessageDialog(null,
          "Take a quick breather and get your head back in the game. \n\nHit OK when you're ready",
          "Don't get distracted",
          JOptionPane.PLAIN_MESSAGE);       
        target.resetTarget();
        wind.setWindSpeed();
        power.resetPower();
        shotNum++;
        afterShotCounter = 0;     
      }      
    }  // close else
  }  // close outer if      
  
  //println("roundCount: " + roundCount);
  println(shotCount);
  println(shotNum);
  println("player.getRoundCount(): " + player.getRoundCount());
  
    
}  // close draw() method

//-------------------------methods--------------------------//

void mouseClicked() {
  if (arrows[shotNum].getYPos() > target.getYPos() + (target.getDiameter()/2) * power.adjust()) {         // arrow can't be moved after striking target
    savedMouseX[0] = mouseX;
    power.clickStop();
    arrows[shotNum].setXPos(savedMouseX[0]);
    arrows[shotNum].looseArrow();
  }
}

void resetArrows() {
  for (int i = 0; i < arrows.length; i++) {
    arrows[i].resetArrow();
    arrowMisses[i].resetArrow();
  }
}

boolean arrowLoosed() {
  if (arrows[shotNum].getYPos() < (bow.getYPos() - arrows[shotNum].getArrowLength())) {
    return true;
  } else {
    return false;
  }
}

boolean arrowLanded() {
  if (arrows[shotNum].getYPos() > target.getYPos() + (target.getDiameter()/2) * power.adjust()) {    
    return false;
  } else {
    return true;
  }
}

boolean targetHit() {
  if (arrows[shotNum].getYPos() == target.getYPos() + (target.getDiameter()/2) * power.adjust() &&    // if arrow reaches power-adjusted Y position
    dist(arrows[shotNum].getXPos(), arrows[shotNum].getYPos(), target.getXPos(), target.getYPos()) < (target.getDiameter()/2)) {  // && is within the target radius
    
    arrows[shotNum].setTargetWasHit(true);
    
    if (arrows[shotNum].getXPos() < target.getXPos()) {
      arrows[shotNum].setLeftOfTarget(true);
    } 
    
    if (arrows[shotNum].getYPos() < target.getYPos()) {
      arrows[shotNum].setAboveTarget(true);
    }
    
    arrows[shotNum].hitXYDist[0] = (dist(arrows[shotNum].getXPos(), target.getYPos(), target.getXPos(), target.getYPos())) / (target.getDiameter()/2);
    arrows[shotNum].hitXYDist[1] = (dist(target.getXPos(), arrows[shotNum].getYPos(), target.getXPos(), target.getYPos())) / (target.getDiameter()/2);
    
    return true;
  } else {   
    arrows[shotNum].setNoHead(true);
    return false;   
  }
}

boolean shotTaken() {                    
  if (afterShotCounter > 0) {
    return true;
  } else {
    return false;
  }
}
