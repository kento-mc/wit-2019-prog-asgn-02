public class Player {

  //-------------------instance variables---------------------// 

  private String playerName;                         // Stores user input for player name
  private int[] shotScores;                          // Array of individual shot scores for each round. Resets each round.
  private int[] roundScores;                         // Array of total round scores for each round
  private String[] shotScoreStrings;                 // Stores individual shot Scores from each round  
  private int shotCount;                             // Variable for current number of shots taken within a round
  private int roundCount;                            // Variable for current round

  //----------------------constructors------------------------//

  public Player(String playerName, int numberOfRounds, int numberOfShots) {
    this.playerName = playerName;
    
    if (numberOfShots > 10) {                        // If user input is greater than 10
      shotScores = new int[10];                      // Limit number of shots per round to 10
    } else if (numberOfShots < 2) {                  // If user input is less than 2
      shotScores = new int[2];                       // Set mimimum allowable shots per round to 2
    } else {
      shotScores = new int[numberOfShots];           // User-chosen number of shots
    }
    
    if (numberOfRounds > 5) {                        // If user input is greater than 5
      roundScores = new int[5];                      // Limit number of rounds to 5
      shotScoreStrings = new String[5];              // Set to match number of rounds
    } else if (numberOfRounds < 1) {                 // If user input is less than 1
      roundScores = new int[1];                      // Set minimum allowable rounds  to 1
      shotScoreStrings = new String[1];              // Set to match number of rounds
    } else {
      roundScores = new int[numberOfRounds];         // User-chosen number of rounds
      shotScoreStrings = new String[numberOfRounds]; // Set to match number of rounds
      
    }
    
    for (int i = 0; i < shotScores.length; i++) {    // Initialize all array positions to -1
      shotScores[i] = -1;                            // to distinguish from scores of 0
    }
    for (int i = 0; i < roundScores.length; i++) {   // Initialize all array positions to -1
      roundScores[i] = -1;                           // to distinguish from scores of 0
    }
    shotCount = 0;                                   // Initialize shot count to 0
    roundCount = 1;                                  // Initialize round count to 1
  }

  //-------------------------methods--------------------------//

  public void display() {                            // Draw the player information
    fill(255);
    textSize(24);
    stroke(0);
    textAlign(LEFT);
    text("Player: " + player.getPlayerName(), width/32, height/24);  // Draw player name
    textSize(20);
    text("Round " + roundCount, width/32, height/14);      // Draw round number
    text("Shots", width/32, height/5.3);                   // Draw 'Shots' heading
    line(width/32, height/5, width/8.5, height/5);
    text("Rounds", width * .85, height/5.3);               // Draw 'Rounds' heading
    line(width * .85, height/5, width * .97, height/5);
    textSize(16);
    
    float scoresY = height/4.3;                          
    for (int i = 0; i < shotScores.length; i++) {          // Draw each individual shot score
      if (shotScores[i] >= 0) {
        text((i+1) + " : " + shotScores[i], width/32, scoresY);
        scoresY += height/32;
      }
    }
    
    float roundsY = height/4.3;
    for (int i = 0; i < roundScores.length; i++) {         // Draw each individual round score
      if (roundScores[i] >= 0) {
        text((i+1) + " : " + roundScores[i], width * .85, roundsY);
        roundsY += height/32;
      }
    }
  }
  
  public void resetPlayer() {                      // Resets player info for next round
    for (int i = 0; i < shotScores.length; i++) {  // Initialize all array positions to -1
      shotScores[i] = -1;                          // to distinguish from scores of 0
    }  
    shotCount = 0;                                 // Reset shot count  
  }

  public void addShot() {                          // Adds new score to next available shotScores[] index           
      shotCount++;
  }  

  public void addRoundScore(int roundScore) {      // Adds new score to next available roundScores[] index
    if (roundScore >= 0) {
      roundScores[roundCount-1] = roundScore;
      roundCount++;                                // Increment round count
    }
  } 
  
  public String toString() {                                       // Builds string to give information on player objects
    String nameScores = "Scores for " + playerName + "\n\n";       // Display the player's name  
    String roundStr = "";                                          // Variable for player stat String
    int grandTotal = 0;                                            // Variable for total score
    float bestRound = roundScores[0];                              // Variable for best round score
    float roundAvg = 0;                                            // Variable for average round score
    float shotAvg = 0;                                             // Variable for average shot score
    
    
    for (int i = 0; i < roundCount - 1; i++) {                     // Loop to build main stat section 
      roundStr = roundStr + "Round " + (i+1) + 
                 "          Total: " + roundScores[i] + "\n" +
                 "     " + shotScoreStrings[i] + "\n";
    }
    
    for (int i = 0; i < roundScores.length; i++) {                 // Loop to build grand total score
      grandTotal = (grandTotal + roundScores[i]);
    }
    
    for (int i = 0; i < roundScores.length; i++) {                 // Loop to determine best score
      if (roundScores[i] > bestRound) {
        bestRound = roundScores[i];
      }
    }
    
    roundAvg = grandTotal / roundScores.length;                    // Calculates round average
    
    shotAvg = roundAvg / shotScores.length;                        // Calculates shot average
    
    return nameScores + roundStr + "GRAND TOTAL:         " + grandTotal + "\n\n" + 
           "Best Round:              " + round(bestRound) + "\n" + "Round Average:        " + 
           round(roundAvg) + "\n" + "Shot Average:           " + round(shotAvg);
  }

  //-------------------------getters--------------------------//

  public String getPlayerName() {
    return playerName;
  }
    
  public int getShotCount() {
    return shotCount;
  }
  
  public int[] getShotScores() {
    return shotScores;
  }
  
  public int getRoundCount() {
    return roundCount; 
  }
  
  public int[] getRoundScores() {
    return roundScores; 
  }
  
  public String[] getShotScoreStrings() {
    return shotScoreStrings;
  }
  
  //-------------------------setters--------------------------//

  public void setShotCount(int shotCount) {
    this.shotCount = shotCount;
  }
  
  public void setShotScores(int shotScore) {
    this.shotScores[shotCount] = shotScore;
  }
  
  public void setRoundCount(int roundCount) {
    this.roundCount = roundCount; 
  }
  
  public void setRoundScores(int roundScore) {
    this.roundScores[roundCount -1] = roundScore;
  }
    
  public void setShotScoreStrings(String roundString) {
    this.shotScoreStrings[roundCount-1] = roundString;
  }
}
