public class Player {

  //-------------------instance variables---------------------// 

  private String playerName;
  private int[] shotScores;
  private int[] roundScores;
  private int shotCount;
  private int roundCount;
  boolean shotTaken;

  //----------------------constructors------------------------//

  public Player(String playerName, int numberOfRounds, int numberOfShots) {
    this.playerName = playerName;
    shotScores = new int[numberOfShots];
    roundScores = new int[numberOfRounds];    
    for (int i = 0; i < shotScores.length; i++) {  // initialize all array positions to -1
      shotScores[i] = -1;                          // to distinguish from scores of 0
    }
    for (int i = 0; i < roundScores.length; i++) {
      roundScores[i] = -1;
    }
    shotCount = 0;
    roundCount = 1;
  }

  //-------------------------methods--------------------------//

  public void display() {
    fill(255);
    textSize(24);
    stroke(0);
    textAlign(LEFT);
    text("Player: " + player.getPlayerName(), width/32, height/24);
    textSize(20);
    text("Round " + roundCount, width/32, height/14);
    text("Shots", width/32, height/5.3);
    line(width/32, height/5, width/8.5, height/5);
    text("Rounds", width * .85, height/5.3);
    line(width * .85, height/5, width * .97, height/5);
    textSize(16);
    
    float scoresY = height/4.3;
    for (int i = 0; i < shotScores.length; i++) {
      if (shotScores[i] >= 0) {
        text((i+1) + " : " + shotScores[i], width/32, scoresY);
        scoresY += height/32;
      }
    }
    
    float roundsY = height/4.3;
    for (int i = 0; i < roundScores.length; i++) {
      if (roundScores[i] >= 0) {
        text((i) + " : " + roundScores[i], width * .85, roundsY);
        roundsY += height/32;
      }
    }
  }
  
  public void resetPlayer() {
    for (int i = 0; i < shotScores.length; i++) {  // initialize all array positions to -1
      shotScores[i] = -1;                          // to distinguish from scores of 0
    }
  }

  public void addShot() {      // adds new score to next available gameShots[] index           
      shotCount++;
  }  

  public void addRoundScore(int roundScore) {     // adds new score to next available gameScores[] index
    if (roundScore >= 0) {
      roundScores[roundCount] = roundScore;
      roundCount++;
    }
  } 
  
  public void resetShotCount() {
    shotCount = 0;
  }
  

/*
  public String toString() {
    String str = "Scores for " + playerName +"\n";

    for (int i = 0; i < gameCount; i++) {
      str = str + "     Score " + (i+1) + ": " + gameScores[i] + "\n";
    } 

    return str;
  } 
*/

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
    this.roundScores[roundCount] = roundScore;
  }

}
