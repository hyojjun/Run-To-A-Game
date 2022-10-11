# Run-To-A-Game

# Run To A Game

## desciption
A Player is an official grade paper of A. The player has 3 lives. When the player collide with enemies that is F grade, the paper loses 1 life. If the player’s life is 0, game is over. This game is played only in large square boundary, and the score goes up whenever the enemy collides with each boundary. If the score reaches 300 points, the player wins. A life item spawns when the score is 50. If the player collides with the item and press button A, the player get one more life. 

### Navigate state machine
StartState goes to gameState when button SELECT pressed.
GameState goes to pauseState when button SELECT pressed.
GameState goes to winState when the score reaches 300 points.
GameState goes to loseState when player’s life is 0.
PauseState goes to startState when button START pressed.
PauseState goes to gameState when button SELECT pressed.
WinState goes to startState when button SELECT pressed.
LoseState goes to startState when button SELECT pressed.

#### Each button does
UP - player moves upward.
DOWN - player moves downward.
LEFT - player moves leftward.
RIGHT - player moves rightward. 
**Direction button play the song of marry you by Bruno mars.**

A - player get one life when the player collides with the life item.
**Button A play a sound of sweeping**






 
 
