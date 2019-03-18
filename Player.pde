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
    for (int i = 0; i < shotScores.length; i++) {
      shotScores[i] = -1;
    }
    gameScores = new int[numberOfGames];
    shotCount = 0;
    gameCount = 0;
  }

  //-------------------------methods--------------------------//

  public void display() {
    fill(255);
    textSize(24);
    stroke(0);
    textAlign(LEFT);
    text("Player: " + player.getPlayerName(), width/32, height/32);
    textSize(20);
    text("Shots", width/32, height/5.3);
    line(width/32, height/5, width/6, height/5);
    textSize(16);
    
    float scoresY = height/4.3;
    for (int i = 0; i < player.getShotScores().length; i++) {
      if (shotScores[i] >= 0) {
        text((i+1) + " : " + shotScores[i], width/32, scoresY);
        scoresY += height/32;
      }
    }

    /*text("1 : " + shotScores[0] + "\n" +
         "2 : " + shotScores[1] + "\n" +
         "3 : " + shotScores[2] + "\n" +
         "4 : " + shotScores[3] + "\n" +
         "5 : " + shotScores[4], width/32, height/4.3);*/
  }

  public void addShot() {      // adds new score to next available gameShots[] index           
      shotCount++;
  }  

  public void addGameScore(int gameScore) {     // adds new score to next available gameScores[] index
    if (gameScore >= 0) {
      gameScores[gameCount] = gameScore;
      gameCount++;
    }
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
  
  //-------------------------setters--------------------------//

  public void setShotCount(int shotCount) {
    this.shotCount = shotCount;
  }
  
  public void setShotScores(int shotScore) {
    this.shotScores[shotCount] = shotScore;
  }

}
