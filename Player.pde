public class Player {

  //-------------------instance variables---------------------// 

  private String playerName;
  private int[] shotScores;
  private int[] gameScores;
  private int shotCount;
  private int gameCount;
  boolean shotTaken;

  //----------------------constructors------------------------//

  public Player(String playerName, int numberOfGames, int numberOfShots) {
    this.playerName = playerName;
    shotScores = new int[numberOfShots];
    gameScores = new int[numberOfGames];
    shotCount = 0;
    gameCount = 0;
  }

  //-------------------------methods--------------------------//

  public void addShot() {      // adds new score to next available gameShots[] index           
      shotCount++;
  }  

  public void addGameScore(int gameScore) {     // adds new score to next available gameScores[] index
    if (gameScore >= 0) {
      gameScores[gameCount] = gameScore;
      gameCount++;
    }
  } 

  public int highestScore() {
    int highestScore = gameScores[0];

    for (int i = 1; i < gameCount; i++) {
      if (gameScores[i] > highestScore) {
        highestScore = gameScores[i];
      }
    } 

    return highestScore;
  } 

  public int lowestScore() {
    int lowestScore = gameScores[0];

    for (int i = 1; i < gameCount; i++) {
      if (gameScores[i] < lowestScore) {
        lowestScore = gameScores[i];
      }
    } 

    return lowestScore;
  } 

  public int averageScore() {
    int total = 0;
    for (int i = 0; i < gameCount; i++) {
      total = total + gameScores[i];
    } 

    return total/gameCount;
  } 

  public String toString() {
    String str = "Scores for " + playerName +"\n";

    for (int i = 0; i < gameCount; i++) {
      str = str + "     Score " + (i+1) + ": " + gameScores[i] + "\n";
    } 

    return str;
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
  
  //-------------------------setters--------------------------//

  public void setShotCount(int shotCount) {
    this.shotCount = shotCount;
  }
  
  public void setShotScores(int shotScore) {
    this.shotScores[shotCount] = shotScore;
  }

}
