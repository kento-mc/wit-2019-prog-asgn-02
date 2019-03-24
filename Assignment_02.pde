// RobinHoodTrainer v1.0

import javax.swing.JOptionPane;

Player player;                      // Player object stores the player's name and scores
Target target;                      // Target object draws the target randomly along the x axis
Bow bow;                            // Bow object draws the bow and sets its x position to mouseX
PowerMeter power;                   // PowerMeter object draws the power meter and adjusts the power of each shot
Wind wind;                          // Wind object sets the wind speed and direction and draws the wind graphic
Arrow[] arrows;                     // Array of Arrow objects to store references to the arrows used in each round
Arrow[] arrowMisses;                // Array of Arrow objects for arrow objects which have missed the target to be passed into (explained further below)

String playerName;                  // Stores user inputed player name
int shotNum = 0;                    // Iterates at a different point in the game flow from shotCount in Player class. Comparing them controls certain functions
float afterShotCounter = 0;         // Controls delay of dialog box display after an Arrow object lands
float[] savedMouseX;                // Stores Arrow object x position when it is loosed from the bow object

void setup() {
  size(600, 800);
  frameRate(48);
  noCursor();
  
  JOptionPane.showMessageDialog(null,"Archery isn't as hard as it looks. All you have to do is click the mouse! " +
                                "\n\nNote the wind speed and direction and adjust the bow position accordingly. " + 
                                "\nThen wait to click the mouse until the moving bar in the power meter is as close " + 
                                "\nto the green section as you can manage." + 
                                "\n\nStep up when you're ready to take your first shot!",
                                "Welcome to RobinHoodTrainer v1.0", JOptionPane.PLAIN_MESSAGE);
  
  playerName =(JOptionPane.showInputDialog("A challenger approaches. What is your name?", "Player 1"));  // get user input for player name
    // doing this before calling the Player constructor so the name can be displayed in the dialog boxes that open within the constructor
                                              
  if (playerName == null) {                   // If user input is null, set name to "Player 1"        
    playerName = "Player 1"; 
  } else if (playerName.length() > 20) {      // if user input is longer than 20 characters, cut off extra characters
   playerName = playerName.substring(0, 20); 
  }
  
  player = new Player(playerName, Integer.parseInt(JOptionPane.showInputDialog(      // Player object constructor
                                  "Welcome " + playerName + "!\n\n" +
                                  "How many rounds would you like to play? (1-5)", "3")),  // User input initializes number of rounds
                                  Integer.parseInt(JOptionPane.showInputDialog(
                                  "And how many shots per round would you like to attempt? (2-10)", "3"))); // User input initializes number of shots
  arrows = new Arrow[player.getShotScores().length];               // set arrows array length to user input for number of shots
  arrowMisses = new Arrow[arrows.length];          // set arrowMisses array length to match length of arrows array
  
  for (int i = 0; i < player.getShotScores().length; i++) {        // initialize arrays of Arrow objects
    arrows[i] = new Arrow();
    arrowMisses[i] = new Arrow();
  }
  
  target = new Target(height * .45);       // Contructs Target object and initializes first round y position
  power = new PowerMeter();                // Constructs PowerMeter object
  wind = new Wind();                       // Constructs Wind object
  savedMouseX = new float[1];              // Initializes array to store mouseX position when mouse is clicked
  
}  // close setup method

void draw() {
  background(80, 170, 240);                // blue sky
  fill(0, 100, 0);
  rect(0, height*.1, width, height*.9);    // darker green
  fill(0, 175, 0);
  noStroke();
  quad(width*.25, height*.2, width*.75, height*.2, width, height*.8, 0, height*.8);  // lighter green field
  rect(0, height*.8, width, height*.2);

  player.display();                        // Display player name and score and round information
  bow = new Bow(mouseX);                   // Bow is constructed within the draw method so the mouseX value being passed in continually updates 
  bow.display();                           // Displays the bow object
    
  for (int i = 0; i <= shotNum; i++) {     // Display missed shots behind target. When an Arrow object misses the target,
    arrowMisses[i].display();              // it is passed into the arrowMisses array which is drawn behind the target object
  }
  
  target.display();                        // Displays the target object
  power.display();                         // Displays the power object
  wind.display();                          // Displays the wind object
    
  for (int i = 0; i <= shotNum; i++) {     // Continue to display all arrows that have been shot during a round
    arrows[i].display();    
  }
 
  if (player.getShotCount() == shotNum) {  // Controls game flow, shot iteration
  
    if (arrowLoosed() == true) {           // Looses the arrow toward the target
      arrows[shotNum].looseArrow();    
    }
  
    if (arrowLanded() == true) {                    // Sets arrow y position to where it has landed
      arrows[shotNum].setYPos(target.getYPos() +    // Arrow y position is set to target's y position
      (target.getDiameter()/2) * power.adjust());   // and adjusted by a method in the PowerMeter class
    }
  
    float shotQuality = dist(arrows[shotNum].getXPos(), arrows[shotNum].getYPos(), target.getXPos(), target.getYPos());
      // measures the distance between the tip of the arrow and the center of the target
    
    if (targetHit() == true) {                                    // If arrow hits the target
      if (shotQuality < (target.getDiameter() * .1)/2) {          // Bullseye!
        player.setShotScores(100);                                // Set score to 100
      } else if (shotQuality < (target.getDiameter() * .2)/2) {   //
        player.setShotScores(90);                                 // Set score to 90
      } else if (shotQuality < (target.getDiameter() * .3)/2) {   //
        player.setShotScores(80);                                 // etc...
      } else if (shotQuality < (target.getDiameter() * .4)/2) {
        player.setShotScores(70);
      } else if (shotQuality < (target.getDiameter() * .5)/2) {
        player.setShotScores(60);
      } else if (shotQuality < (target.getDiameter() * .6)/2) {
        player.setShotScores(50);
      } else if (shotQuality < (target.getDiameter() * .7)/2) {
        player.setShotScores(40);
      } else if (shotQuality < (target.getDiameter() * .8)/2) {
        player.setShotScores(30);
      } else if (shotQuality < (target.getDiameter() * .9)/2) {   
        player.setShotScores(20);
      } else if (shotQuality < target.getDiameter()/2) {
        player.setShotScores(10);
      }   
    } else if (arrowLanded() == true) {                           // If the arrow misses the target
      player.setShotScores(0);                                    // Set score to 0
    }
    
    if (shotTaken() == true) {                                    // Tests if shot has finished being taken
      player.addShot();                                           // Increments shot count
    }     
  }  // close control flow if 

  if (arrowLanded() == true) {                                    // If arrow has landed, whether hit or miss
    afterShotCounter += .2;                                       // Counter begins to control for delay before 
  }                                                               // after-shot dialog box opens
  
  if (afterShotCounter > 5 && player.getShotCount() > shotNum) {    // Delay until counter reaches 5 before opening dialog box
    if (player.getShotCount() == player.getShotScores().length) {   // If this was the last shot of the round
      if (player.getShotScores()[player.getShotCount()-1] == 100) { // Dialog box for a score of 100
        JOptionPane.showMessageDialog(null,
          "Impressive... \n\nYou scored " + player.getShotScores()[player.getShotCount() - 1] + "!" +
          "\n\nThat was your last shot for this round.",
          "Bullseye!",
          JOptionPane.PLAIN_MESSAGE);
      } else if (player.getShotScores()[player.getShotCount()-1] >= 70) {  // Dialog box for a score of 70-99
        JOptionPane.showMessageDialog(null,
          "Keep it up! \n\nYou scored " + player.getShotScores()[player.getShotCount() - 1] + "!" +
          "\n\nThat was your last shot for this round.",
          "Nice!",
          JOptionPane.PLAIN_MESSAGE);
      } else if (player.getShotScores()[player.getShotCount()-1] >= 40) {  // Dialog box for a score of 40-69
         JOptionPane.showMessageDialog(null,
          "You're still in the game! \n\nYou scored " + player.getShotScores()[player.getShotCount() - 1] + "!" +
          "\n\nThat was your last shot for this round.",
          "Not bad!",
          JOptionPane.PLAIN_MESSAGE);
      } else if (player.getShotScores()[player.getShotCount()-1] > 10) {  // Dialog box for a score of 11-39
         JOptionPane.showMessageDialog(null,
          "Gonna have to focus... \n\nYou scored " + player.getShotScores()[player.getShotCount() - 1] + "!" +
          "\n\nThat was your last shot for this round.",
          "Okay",
          JOptionPane.PLAIN_MESSAGE); 
      } else if (player.getShotScores()[player.getShotCount()-1] > 0) { // Dialog box for a score of 10
         JOptionPane.showMessageDialog(null,
          "Not exactly Robin Hood are ya? \n\nYou scored " + player.getShotScores()[player.getShotCount() - 1] + "!" +
          "\n\nThat was your last shot for this round.",
          "Oof",
          JOptionPane.PLAIN_MESSAGE);
      } else {                                                          // Dialog box for a score of 0
         JOptionPane.showMessageDialog(null,
          "Maybe you should stick to bowling. \n\nYou scored " + player.getShotScores()[player.getShotCount() - 1] + "!" +
          "\n\nThat was your last shot for this round.",
          "Miss!",
          JOptionPane.PLAIN_MESSAGE);
      }  
      
      int roundTotal = 0;                                               // Variable to total the scores for the round
      String roundString = "";                                          // Variable to concatenate String of scores to display later
      
      for (int i = 0; i < player.getShotScores().length; i++) {         // Loop through the scores
        roundTotal += player.getShotScores()[i];                        // Add each score to find the total
        roundString += player.getShotScores()[i] + "\n     ";           // Add each score to String
      }
      
      player.setShotScoreStrings(roundString);                          // Store the concatenated score string in the shotScoreStrings array
            
      JOptionPane.showMessageDialog(null,                               // Dialog box to give total round score and average shot score
      "Your total score for round " + player.getRoundCount() + ": " + roundTotal + "\n\n" +
      "Your average shot score: " + roundTotal/player.getShotScores().length,
      "End of Round " + player.getRoundCount(),
      JOptionPane.PLAIN_MESSAGE);    
      
      if (player.getRoundCount() < player.getRoundScores().length) {  // If this was not the last round
        int nextRound = JOptionPane.showConfirmDialog(null,           // Declare variable to represent user choice of whether to continue
                     "Would you like to continue to the next round?", "Ready for more?",
                     JOptionPane.YES_NO_OPTION);
                           
        if (nextRound == JOptionPane.YES_OPTION) {                    // User chooses to start next round
            player.resetPlayer();                                     // Resets player object, including setting shot count to 0
            player.addRoundScore(roundTotal);                         // Adds round score to roundScores array in Player class
            resetArrows();                                            // Resets arrow objects to initial positions
            target.resetTargetRound();                                // Sets target y position to appear further from user
            target.resetTarget();                                     // Randomizes target x position
            wind.setWindSpeed();                                      // Randomizes wind speed and direction
            power.resetPower();                                       // Resets power meter
            afterShotCounter = 0;                                     // Resets after-shot counter
            shotNum = 0;                                              // Resets shotNum to 0, making it equal to shotCount in the Player class
  
          } else {
            player.addRoundScore(roundTotal);                         // Adds round score to roundScores array in Player class
            player.display();            
            if ((player.getRoundCount() - 1) > 1) {
              JOptionPane.showMessageDialog(null,                       // If user declines to continue
              "You completed " + (player.getRoundCount() - 1) + " rounds." + "\n\n" +  // Dislplay stats
              player.toString(),
              "Game Over",
              JOptionPane.PLAIN_MESSAGE);
            } else {
              JOptionPane.showMessageDialog(null,                       // If user declines to continue
              "You completed " + (player.getRoundCount() - 1) + " round." + "\n\n" +  // Dislplay stats
              player.toString(),
              "Game Over",
              JOptionPane.PLAIN_MESSAGE);
            }
            exit();                                                   // End the game
          }
      } else {                                                        // This was the last round
        player.addRoundScore(roundTotal);                             // Adds round score to roundScores array in Player class
        player.display();                   
        JOptionPane.showMessageDialog(null,                           // If the user has completed all rounds                                      
          player.toString(),                                          // Display stats
          "Game Over",                                    
          JOptionPane.PLAIN_MESSAGE);
          
        exit();                                                       // End the game
      } 
    }  // close if that tests if shot is last of the round
    else {                                                            // If there are more shots to take this round
      
      int nextShot;                                                   // Declare variable to store user choice for taking next shot
      
      if (player.getShotScores()[player.getShotCount()-1] == 100) {   // Dialog box for a score of 100
        nextShot = JOptionPane.showConfirmDialog(null,
                     "Impressive... \n\nYou scored " + player.getShotScores()[player.getShotCount() - 1] + "!" + 
                     "\n\nReady for your next shot?", "Bullseye!",
                     JOptionPane.YES_NO_OPTION);                
      } else if (player.getShotScores()[player.getShotCount()-1] >= 70) {  // Dialog box for a score of 70-99
        nextShot = JOptionPane.showConfirmDialog(null,
                     "Keep it up! \n\nYou scored " + player.getShotScores()[player.getShotCount() - 1] + "!" + 
                     "\n\nReady for your next shot?", "Nice!",
                     JOptionPane.YES_NO_OPTION);
      } else if (player.getShotScores()[player.getShotCount()-1] >= 40) {  // Dialog box for a score of 40-69
         nextShot = JOptionPane.showConfirmDialog(null,
                     "You're still in the game. \n\nYou scored " + player.getShotScores()[player.getShotCount() - 1] + "!" + 
                     "\n\nReady for your next shot?", "Not bad!",
                     JOptionPane.YES_NO_OPTION);
      } else if (player.getShotScores()[player.getShotCount()-1] > 10) {  // Dialog box for a score of 11-39
         nextShot = JOptionPane.showConfirmDialog(null,
                     "Gonna have to focus. \n\nYou scored " + player.getShotScores()[player.getShotCount() - 1] + "!" + 
                     "\n\nReady for your next shot?", "Okay",
                     JOptionPane.YES_NO_OPTION); 
      } else if (player.getShotScores()[player.getShotCount()-1] > 0) {  // Dialog box for a score of 10
         nextShot = JOptionPane.showConfirmDialog(null,
                     "Not exactly Robin Hood are ya? \n\nYou scored " + player.getShotScores()[player.getShotCount() - 1] + "!" + 
                     "\n\nReady for your next shot?", "Oof",
                     JOptionPane.YES_NO_OPTION);
      } else {
         nextShot = JOptionPane.showConfirmDialog(null,                  // Dialog box for a score of 0
                     "Maybe you should stick to bowling. \n\nYou scored " + player.getShotScores()[player.getShotCount() - 1] + "!" + 
                     "\n\nReady for your next shot?", "Miss!",
                     JOptionPane.YES_NO_OPTION);
        arrowMisses[shotNum] = arrows[shotNum];    // Add missed shot arrow to arrowMisses array so it appears behind the next target
        arrows[shotNum] = new Arrow(height *2 );   // Replace arrow that missed target with one drawn off screen, using overloaded arrow constructor       
      }  
      
      if (nextShot == JOptionPane.YES_OPTION) {    // If user choses to take the next shot
        target.resetTarget();                      // Randomizes target x position
        wind.setWindSpeed();                       // Randomizes wind speed and direction
        power.resetPower();                        // Resets power meter
        shotNum++;  // Increments shotNum, making it equal to shotCount in the Player class, allowing the main game loop to start again
        afterShotCounter = 0;                      // Resets after-shot counter
      } else {                                     // If user says no to taking next turn
        JOptionPane.showMessageDialog(null,
          "Take a quick breather and get your head back in the game. \n\nHit OK when you're ready",
          "Don't get distracted",
          JOptionPane.PLAIN_MESSAGE);       
        target.resetTarget();                      // Randomizes target x position
        wind.setWindSpeed();                       // Randomizes wind speed and direction
        power.resetPower();                        // Resets power meter
        shotNum++;  // Increments shotNum, making it equal to shotCount in the Player class, allowing the main game loop to start again
        afterShotCounter = 0;                      // Resets after-shot counter
      }      
    }  // close else
  }  // close outer if   
  
  // println(player.getRoundScores());             // Mean to remove this, but left if until after I'd listed all my line numbers in the 
                                                   // reflection tab, so I'm leaving it in and commenting it out
}  // close draw() method

//-------------------------methods--------------------------//

void mouseClicked() {                             // If mouse is clicked
  if (arrows[shotNum].getYPos() > target.getYPos() + (target.getDiameter()/2) * power.adjust()) {  // Only perform following functions if arrow hasn't landed
                                                  // so arrow doesn't move after striking target
    savedMouseX[0] = mouseX;                      // Store the x value from mouseX to fix the arrow x position before it is shot
    power.clickStop();                            // Stop the moving bar on the power meter
    arrows[shotNum].setXPos(savedMouseX[0]);      // Fix the x position of the arrow object being shot
    arrows[shotNum].looseArrow();                 // Loose arrow from the bow
  }
}

void resetArrows() {                              // Resets all arrow objects for each round
  for (int i = 0; i < arrows.length; i++) {       // Loop through arrow objects
    arrows[i].resetArrow();                       // Reset arrows to initial position
    arrowMisses[i].resetArrow();                  // Reset arrows to initial position
  }
}

boolean arrowLoosed() {                           // Has the arrow object been loosed?
  if (arrows[shotNum].getYPos() < (bow.getYPos() - arrows[shotNum].getArrowLength())) {  // Arrow y position is less than initial position
    return true;
  } else {
    return false;
  }
}

boolean arrowLanded() {                           // Has the arrow landed?
  if (arrows[shotNum].getYPos() > target.getYPos() + (target.getDiameter()/2) * power.adjust()) {  // Arrow y position is greater than it's landing spot
    return false;
  } else {
    return true;
  }
}

boolean targetHit() {                                    // Has the arrow object hit the target?
  if (arrows[shotNum].getYPos() == target.getYPos() + (target.getDiameter()/2) * power.adjust() &&    // If arrow reaches power-adjusted y position
    dist(arrows[shotNum].getXPos(), arrows[shotNum].getYPos(), target.getXPos(), target.getYPos()) < (target.getDiameter()/2)) {  // && is within the target radius
    
    arrows[shotNum].setTargetWasHit(true);               // Set boolean variable within Arrow class to match targetHit() value
    
    if (arrows[shotNum].getXPos() < target.getXPos()) {  // Did arrow object land to the left of the target center?
      arrows[shotNum].setLeftOfTarget(true);             // Set boolean variable within Arrow class 
    } 
    
    if (arrows[shotNum].getYPos() < target.getYPos()) {  // Did arrow object land to the right of the target center?
      arrows[shotNum].setAboveTarget(true);              // Set boolean variable within Arrow class
    }
    
    arrows[shotNum].hitXYDist[0] = (dist(arrows[shotNum].getXPos(), target.getYPos(), target.getXPos(), target.getYPos())) / (target.getDiameter()/2);
      // Capture x-axis distance between landed arrow object and target center
    arrows[shotNum].hitXYDist[1] = (dist(target.getXPos(), arrows[shotNum].getYPos(), target.getXPos(), target.getYPos())) / (target.getDiameter()/2);
      // Capture y-axis distance between landed arrow object and target center
    
    return true;
  } else {   
    arrows[shotNum].setNoHead(true);                     // Set boolean variable within Arrow class
    return false;   
  }
}

boolean shotTaken() {                                    // Has the shot been taken?
  if (afterShotCounter > 0) {                            // After-shot counter has started
    return true;
  } else {
    return false;
  }
}
