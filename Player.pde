public class Player {

  //-------------------instance variables---------------------// 

  private String playerName;
  private int[] gameShots;
  private int[] gameScores;
  private int shotCount;
  private int gameCount;

  //----------------------constructors------------------------//

  public Player(String playerName, int numberOfGames, int numberOfShots) {
    this.playerName = playerName;
    gameShots = new int[numberOfShots];
    gameScores = new int[numberOfGames];
    shotCount = 0;
    gameCount = 0;
  }

  //-------------------------methods--------------------------//

  public void addShot(int shotScore) {   // adds new score to next available scores[] index
    gameShots[0] = shotScore;            // FIX SHOTCOUNT INFINITE COUNTER
    shotCount++;
  }  

  public void addScore(int gameScore) {   // adds new score to next available scores[] index
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

  public int getShotCount() {
    return shotCount;
  }
  
  //-------------------------setters--------------------------//
}
