/* Reflection

Name: Kenneth Chadwick 

Student Number: 20086513

Link to Video: https://youtu.be/IhzfEMjHDqM 


Part A - Mark (5/5)
-----------------------------

Includsion of completed Readme and Reflection, and Video

100%


Part B - Mark (5/5)
-----------------------------

Comments, indentation, naming, structure of code, etc.

100%


Part C - Mark (5/5)
-----------------------------
Use of if and loop statements:

Assignment_02 class:
  line 33 - if statement to validate user input for player name
  line 47 - for loop to initialize two arrays of Arrow objects
  line 72 - for loop to continually display missed shots behind target
  line 80 - for loop to continually display all arrows that have been shot during a round
  line 84 - if statement to control the main game flow
  line 86 - if statement to test boolean condition which looses the arrow toward the target
  line 90 - if statement to set arrow y position to where it has landed
  line 98 - if statement to test boolean condition of whether the arrow hits the target
  line 98-120 - if statement and nested else ifs to store the shot score
  line 124 - if statement to test boolean condition which increments shot count
  line 129 - if statement to test boolean condition which begins after-shot counter
  line 133 - if statement that contains all subsequent branching if/else statement within the draw() method.
             Tests two conditions to determine whether to proceed with displaying score info and resetting 
             or to return to re-enter the main game flow
  line 134 - if statement to test if this was the last shot of the round. Else statement appears on 
             line 234
  line 135-165 - if statement and nested else ifs to display dialog boxes with score info and indicate that
                 the round has ended
  line 176 - for loop to store score information in arrays defined in the Player class
  line 189 - if statement to determine if there are any rounds remaining to be played. Else statement appears 
             on line 223 to end the game and display stats if all rounds have been played
  line 194 - if statement to re-initialize game variables and start the next round. Else statement on line 205
             ends the game and displays final stats if the user decideds not to play the subsequent rounds
  line 208 - if statement to ensure correct grammar (round vs rounds) in dialog box. Else statement onf line 214
  line 238-263 - if statement and nested else ifs to display dialog boxes with score info and prompt user to 
                 start the next round
  line 272 - if statement to check if user is ready to take their next shot, and then resets the game for the 
             next shot. Else statement on line 278
  line 299 - if statement limits execution of functions within the mouseClicked() method to before the arrow has
             landed
  line 309 - for loop to reset all the arrow objects in the Arrow arrays
  line 316 - if statement to test boolean condition of whether the arrow has been loosed
  line 324 - if statement to test boolean condition of whether the arrow has landed
  line 322 - if stattement to test if arrow has landed on the target
  line 337 - if statement to test if arrow landed on left or right of target
  line 341 - if statement to test if arrow landed on top or bottom of target
  line 358 - if sstaement to start shot counter if the arrow has landed

Arrow class:
  line 31-89 - If statement with following else if statements and nested ifs to determine how and where arrows are 
               drawn at different points of the game

Bow class:
  line 21 - If statement, with else on line 31, to determine how bow is drawn when arrow is nocked vs. shot
  
Player class:
  line 17-21 - If statement with following else statements to validate user input for number of shots
  line 25-31 - If statement with following else statements to validate user input for number of rounds
  line 37 - for loop to initialize array positions
  line 40 - for loop to initialize array positions
  line 64 - for loop with nested if to draw the individual shot scores on the interface
  line 72 - for loop with nested if to draw the individual round scores on the interface
  line 81 - for loop to re-initialize array positions
  line 92 - if statement to test conditions before incrementing round score info
  line 107 - for loop to build String 
  line 113 - for loop to build String 
  line 117 - for with nested if determine hightest value in array 

PowerMeter class:
  line 44 - if statement to test if moving bar has hit top or bottom of the box and reverses the direction
  line 57 - if statement to adjust the resting position of the bar when mouse is clicked
  line 71 - if statement with following else if and else to return value by which arrow flight is adjusted

Wind class:
  line 20-30 - if statement and following elses to change color of wind speed indicator based on wind speed
  line 37 - if statement and following else to draw left and right facing arrow
   

I make extensive use of if staements with nested ifs and if/elses as well as multiply branching series of ifs
and if/elses, mostly in the Assignment_02 and Player classes. I also use many for loops, some with nested for
loops or nested ifs. These if statements and loops test different types of conditions to present the user with
different options and displays at various points.

I'm recording 100% for this section.


Part D - Mark (5/5)
-----------------------------
Working game with inclusion of bespoke methods in the main sketch.

bespoke methods in the Assignment_02 class:

mouseClicked() on line 298 - to control functionality of mouse click. Not sure this counts as bespoke since it
                             is a processing method. But the functions I've defined within it drive the game, so
                             it seemed appropirate to include it in this list
resetArrows() on line 308 - to reset all arrow objects for each round  
arrowLanded() on line 323 - boolean to test if the arrow landed
targetHit() on line 331 - boolean to test if arrow object hit the target and calculate how the arrow is drawn after that
shotTaken() on line 357 - boolean to test if the shot been taken

I have a working game that creates objects from six custom classes, and modifies the behaviour of the objects based on the
state of the other objects. It includes time-triggered events (the after-shot counter which delays the dialog box after a
shot is taken), mouse events (Clicking the mouse determines shot power and looses the arrows, and the bow follows mouseX),
collisions (determinning score based on where arrows impact the target), and (I think) collision avoidance (arrows which miss 
the target are redrawn to appear under the target so as not to obstruct the view). I'm not 100% sure my example of collision 
avoidance would meet the criteria, but I believe the complexity of the overall game still warrants an excellent mark, so
I'm recording 95% for this section.


Part E1 - Mark (10/10)
-----------------------------
User-defined class with appropriate fields, constructors, getters, setters

Declared in Assignment_02 class:

line 5 - Player class to store the player's name and scores
line 6 - Target class to draw the target randomly along the x axis
line 7 - Bow class to draw the bow and sets its x position to mouseX
line 8 - PowerMeter class to draw the power meter and adjusts the power of each shot
line 9 - Wind class to set the wind speed and direction and draws the wind graphic
line 10 - Arrow class to create arrow obects

I use six user-defined classes with appropriate accessors and mutators for the instance varialbes in each. I use an overloaded
constructor in the Arrow class (line 23) to draw replacement arrow objects for arrows that missed the target. They are drawn in
a different location than arrow objects created using the default constructor.

I am recording 100% for this section.


Part E2 - Mark (14/15)
-----------------------------

Class bespoke methods:

Arrow class
  display() on line 30 - to display arrow objects and define how they display in various contexts
  looseArrow() on line 101 - to loose arrows from the bow
  resetArrow() on line 108 - to reset arrow objects to initial position - nocked to the bow object

Bow class
  display() on line 20 - to display the bow object and define how it displays relative to arrows

Player class
  display() on line 49 - to display the player information, including scores
  resetPlayer() on line 80 - to reset player info for next round
  addShot() on line 87 - to add new score to next available shotScores[] index 
  addRoundScore(int) on line 91 - to add new score to next available roundScores[] index
  toString() on line 98 - returns a String - to build string to give stat info for player objects

PowerMeter class
  display() on line 22 - to display the power meter
  resetPower() on line 49 - to reset power meter for each shot
  clickStop() on line 54 - to stop the moving bar when the mouse is clicked
  adjust() on line 64 - returns a float - to adjust where the arrow object lands based on where the moving bar is stopped 
                        within the power meter

Target class
  display() on line 20 - to display the target
  resetTarget() on line 39 - to reset target with randomized x position
  resetTargetRound() on line 44 - to reset target for new round with a decreased y position

Wind class
  display() on line 15 - to display wind speed graphics

I use seventeen bespoke methods across my user-defined classes. Two of these return values: toString() on line 98 of the Player
class returns a String of user stats, and adjust() on line 64 of the PowerMeter class. One of thse accepts a parameter: 
addRoundScore() on line 91 of the Player class accepts an int. Outside of the contstructors, I could have made more extensive 
use of accepting parameters and returning values, but I do have a lot of complexity within the methods which make extensive
use of the accessors and mutators (passing in and returning values), so I am recording 90% for this section.


Part E3 - Mark (10/10)
-----------------------------

The user-defined class(es) are used in an appropriate manner


Part F1 - Mark (20/20)
-----------------------------
- Use of a data structure to store information i.e. array

Assignment_02 class:

Arrow[] arrows 
  declared on line 10 to store references to the arrows used in each round
  initialized on line 44 with overloaded constructor
  initialized on line 48 with default constructor
  used on:
    line 81
    line 87
    line 91
    line 95
    line 268
    line 269
    line 299
    line 303
    line 304
    line 309
    line 310
    line 316
    line 324
    line 332
    line 333
    line 335
    line 337
    line 341
    line 342
    line 345
    line 347
    line 352

Arrow[] arrowMisses 
  declared on line 11 for arrow objects which have missed the target to be passed into
  initialized on line 45 with overloaded constructor
  initialized on line 49 with default constructor
  used on:
    line 73
    line 268
    line 311

float[] savedMouseX
  declared on line 16 to store the arrow object x position when it is loosed from the bow object
  initialized on line 55
  used on:
    line 301
    line 303


Arrow class:

float[] hitXYDist
  declared and initialized on line 14 to store relative arrow positions so that the landed arrows 
                                      can be re-drawn when the target moves
  used on: 
    line 42
    line 46
    line 51
    line 55

Player class:

int[] shotScores
  declared on line 6 to store individual shot scores for each round. Resets each round
  initialized in the constructor on lines 18, 20, or 22, depending on user input
  used on:
    line 37
    line 38
    line 64
    line 65
    line 66
    line 81
    line 82
    line 125
    
int[] roundScores
  declared on line 7 to store total round scores for each round
  initialized in the constructor on lines 26, 29, 32, depending on user input
  used on:
    line 40
    line 41
    line 72
    line 73
    line 74
    line 91
    line 93
    line 102
    line 109
    line 113
    line 114
    line 117
    line 118
    line 119
    line 123

String[] shotScoreStrings;                 
  declared on line 8 to store individual shot Scores from each round  
  initialized in the constructor on lines 27, 30, 33, depending on user input
  used on:
    line 110

I use a number of primitive arrays of type float and int, and I use three object arrays -- one of type String, 
and two of type Arrow, one of the user-defined classes. The length of 2 of the arrays is set by user input via
JOptionPane. The values of several of the arrays are determined by user interaction - specifically the scores
for shots and rounds and certain x and y axix values.

I am recording 100% for this section

Part F2 - Mark (20/20)
-----------------------------
- Calculations performed on the information stored

Assignment_02 class:
  line 268 - if arrow misses - adds missed shot arrow reference from arrows array to arrowMisses array so it appears 
             behind the next target
  line 269 - if value is passed from arrows array to arrowMisses array - replaces arrow that is passed with one 
             drawn off screen, using overloaded arrow constructor
  line 309 - for loop to reset all values stored in array
  
Arrow class:
  line 42 - use stored values to adjust variables
  line 46 - use stored values to adjust variables
  line 51 - use stored values to adjust variables
  line 55 - use stored values to adjust variables


Player class:
  line 37 - for loop to store the same value at each index
  line 40 - for loop to store the same value at each index
  line 64 - for loop to check how many scores have been added to shotScores array and display the scores
  line 77 - for loop to check how many scores have been added to roundScores array and display the scores
  line 81 - for loop to clear scores and reset each index
  line 107 - for loop to build String from array values
  line 113 - for loop to build String from array values
  line 117 - for loop to determine highest value in array

I use multiple loops on mulitple arrays, setting the exit criteria to the length of the array, originally set by the user.
I use these values in multiple calculations and to test multiple conditions and I update the array values or pass values
from one array to another based on these calculations and conditions.

I am recording 100% for this section.

*/
