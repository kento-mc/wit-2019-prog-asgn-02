/*
Name: Kenneth Chadwick
Student Number: 20086513

Brief description of the game developed:

RobinHoodTrainer is an archery game in which the player has to account for wind speed and direction, and accurately power their shot attempts
to come as close to the bullseye on the target as possible. Each shot is scored based on where the arrow lands and the scores are totaled at  
the end of each round. Each round sets the targets further back from the player's POV, making higher scores more difficult to achieve with each
successive round. The player determines the number of shots per round and how many rounds to play. When the game finishes, the player's stats
are displayed.


Justification of spec:

-I used six user-defined classes, adhering to encapsulation rules, complete with all relevant components.
-The main game class contains the draw() and setup() methods. This class makes extensive calls to user-defined classes in an appropriate manner.
-I used many if statements (including nested and branching ifs) and loops (including nested loops).
-I used a number of primitive arrays of type float and int.
-I used three object arrays -- one of type String, and two of type Arrow, one of the user-defined classes.


Known bugs/problems:

I'm not aware of any game-breaking bugs in the final version. There were a few problems I wasn't able to fully solve, or get to a point of refinement
that I was satisfied with: 

  - The animation of the arrow landing wasn't as crisp as I would have liked. Sometimes after stopping its upward motion the arrow will dramatically
    shift its x position. The score recorded reflects the location of the arrow after this shift. I couldn't work out how to stop this.

  - I didn't work out how to display the last round score in the graphical display before displaying the dialog box with the scores. I'm confidend I 
    would have gotten this sorted with a bit more time to sift through the branching if/else conditions. 
    

Any sources referred to during the development of the assignment (be precise and specific with references) {there no need to reference lecture/lab materials}:

Used nf() to truncate number of decimal places displayed to 2:
https://processing.org/reference/nf_.html
https://forum.processing.org/two/discussion/23814/#Comment_104014

*/
