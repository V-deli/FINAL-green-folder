//HOW TO PLAY:
//---------------------------------------------
//USE WSAD TO CONTROL THE RED ELLIPSE ON THE SCREEN
//THE GOAL IS TO COVER ALL THE SQUARES (TURNING THEM GREEN) BEFORE THE TIMER HITS ZERO
//IF YOU DO, YOU WIN! AND YOU CAN REPLAY
//IF YOU DO NOT, YOU LOSE! AND YOU CAN REPLAY
//-----------------------------------------------
//NOTE: PROCESSING REFERENCE PAGE WAS USED
//NOTE: THOSE YOUTUBE VIDEOS GIVEN TO US IN CLASS WERE ALSO USED, THEY HELPED!
//NOTE: THERE WERE TIMES I NEEDED ASSISSTANCE FROM CLASSMATES, WITH HOW TO USE SOURCETREE (I KEPT MERGING THE WRONG BRANCHES TOGETHER :(  )
//LASTLY: I SHOULD MENTION I RECREATED MY REPOSITORY 4 TIMES (MY BAD) SO I SAVED MY CODE TO MYSELF, SO THAT WAY I DIDN'T HAVE TO START FROM SCRATCH
//-----------------------------------------------------------------------------------------------------------------------
ArrayList<GridSquare> activatedSquares = new ArrayList<GridSquare>(); // I made a list to store "activated" grid squares
ArrayList<GridSquare> squares = new ArrayList<GridSquare>(); // this is to store all the squares (regular)
Ellipse movingEllipse; // so this is a "moving ellipse" object, i declared it here
float timer = 5; //I made my timer set to 5 seconds, in hindsit it would have been more of a challenge for the players, playing my game to shorten it
boolean timerRunning =true; //using as a flag to control if the timer is running
boolean gameOver = false; // boolean that will track when the game is over
boolean gameWon = false; // tracks when the game is won
boolean gameStarted = true; // tracks when the game has started or not

void setup() {
  size(400, 400);
  // below: I made 9 individual squares...like a 3 by 3 grid, then added them to my squares array list
  float size = width / 3; // one thrird of the width to fit in 3 squares that are the same size
  for (int i = 0; i < 9; i++) { // for loop, 3 x 3 = 9 squares total, loops through these squares
    int row = i / 3; //determines the row number starting from 0
    int col = i % 3;// column number...
    PVector position=new PVector(col*size, row * size);// new. purpose is to calculate the position of each square
    squares.add(new GridSquare(position, size)); // this line adds a new " grid square" object..to the list.
  }
  
  movingEllipse = new Ellipse(new PVector(50, 50), new PVector(0, 0), new PVector(0, 0));
// position of the ellipse is set to 50 50.. for now...before it moves
}

void draw() {
  background(220); // 220 is a grey
  if (gameStarted) { //if statement, checks if the game has started
  for (GridSquare square : squares) { // for loop, lopps through each square in the "grid" = (3 by 3)
  square.display(); //this displays each of them 
    }  
    
  movingEllipse.update(); // updates the  position of the moving ellipse
  movingEllipse.display(); //this one displays it
  
  // Below: blocks purpose is to chexk if the ellipse is inside any of the squares and mark it as activated if not already activated
  for (GridSquare square : squares) { // checks if the ellipse is in a square...but it's NOT activated
      if (movingEllipseIsInSquare(movingEllipse.position, square) && !isSquareActivated(square)) { 
      activatedSquares.add(square);  //if square is activated, "add" the square to the activated list: activated squares
      square.activated = true; // square is now marked as acytivated
      break; //exits the loop after the first activation
      }
  }
      // below: this bloclk is to check if ALLL the squares are activated..
      if (activatedSquares.size() == squares.size() && !gameWon) { // If all squares are activated and the game is not yet won...then..
      gameWon = true; // Set the game as won as true
      gameOver = true; // Set the game as over as true... since player would have won, therefore this game has ended
      gameStarted = false;  // its flase since the game should be ended... End the game
      displayMessage("Winner"); //shows this message on the screen, to let player know they've won
  }
      if (timerRunning) { //if statement...if the timer is running...
      timer -= 0.01; // gradually decrease the timer by .01 second
      if (timer <= 0) { // // If the timer reaches zero...
      timer = 0; // Set the timer to zero which then makes...
      timerRunning = false; // the timer stop.
      if (!gameWon) {  // if the game was NOT won... ! not
      gameOver= true; //the game is over and...
      gameStarted =false; // the game will end
      displayMessage("Try Again");  // message to player to let them know they need to try again, since they failed to win
      }
    }
}
// below is for the timers display on the screen
fill(0); //clour is black
textSize(24); //text size = 24
textAlign(CENTER, CENTER); // to center the text on the screen
text(nf(timer, 1, 2), width / 2, height - 30);  // to display the timer's value with 2 decimal places
      }else{ // if the game is not started...
      //display the games over message
 fill(255, 0, 0); //text red
  textSize(48);  // size 48
   textAlign(CENTER, CENTER); //centered
   if (gameWon) {  //if statement...if the game is won...
   text("Winner!", width / 2, height / 2 - 20);  //// display "Winner!" message
   textSize(28); ////set the text size to 28
   fill(0); //text black
   text("'R'restart", width / 2, height / 2 + 45); //Display r to restart message
   }else{ // if the game is not won...
   text("Try Again", width / 2, height / 2 - 20); //display try again message
   textSize(28); // size 28
   fill(0); //text black
   text("'R'restart", width / 2, height / 2 + 45); //display message : r to restart
   }
      }
}
 
 

void keyPressed() {
   if (gameStarted) { //if the game has started...
   if (key == 'w' || key == 'W') { //w moves ellipse up
      movingEllipse.velocity.y = -5;
    } else if (key == 's' || key == 'S') { //s moves ellipse down
      movingEllipse.velocity.y = 5;
    } else if (key == 'a' || key == 'A') { //a moves ellipse left
      movingEllipse.velocity.x = -5;
    } else if (key == 'd' || key == 'D') { //d moves ellipse right
      movingEllipse.velocity.x = 5;
    }
     } else { //if the game is not started:
    if (key == 'r' || key == 'R') { //if the r key is pressed....
      resetGame();  //reset
      gameStarted = true;  //the game will start again
    }
  }
}
   
void resetGame() {
  for (GridSquare square : squares) {
  square.activated = false;
  }
  activatedSquares.clear();
  timer=5;
  timerRunning=true;
  gameOver=false;
  gameWon=false;
  movingEllipse.position= new PVector(50,50);
}
void displayMessage(String message){
   fill(0);
   textSize(32);
   textAlign(CENTER, CENTER);
   text(message, width / 2, height / 2);
}

boolean isSquareActivated(GridSquare square) {
for (GridSquare activatedSquare : activatedSquares) {
 if (activatedSquare == square) {
    return true;
 }
}
return false;
}

boolean movingEllipseIsInSquare(PVector ellipsePos, GridSquare square) {
  return ellipsePos.x > square.position.x && ellipsePos.x < square.position.x + square.size &&
         ellipsePos.y > square.position.y && ellipsePos.y < square.position.y + square.size;
}
