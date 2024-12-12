//HOW TO PLAY:
//---------------------------------------------
//USE WSAD TO CONTROL THE RED ELLIPSE ON THE SCREEN
//THE GOAL IS TO COVER ALL THE SQUARES (TURNING THEM GREEN) BEFORE THE TIMER HITS ZERO
//IF YOU DO, YOU WIN! AND YOU CAN REPLAY
//IF YOU DO NOT, YOU LOSE! AND YOU CAN REPLAY
//-----------------------------------------------
//NOTE: PROCESSING REFERENCE PAGE WAS USED
//NOTE: THOSE YOUTUBE VIDEOS GIVEN TO US IN CLASS WERE ALSO USED, THEY HELPED!
//NOTE: THERE WERE TIMES I NEEDED ASSISSTANCE FROM CLASSMATES, MAINLY WITH HOW TO USE SOURCETREE (I KEPT MERGING THE WRONG BRANCHES TOGETHER :(  )
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
    int row = i / 3; //
    int col = i % 3;
    PVector position=new PVector(col*size, row * size);
    squares.add(new GridSquare(position, size));
  }
  
  movingEllipse = new Ellipse(new PVector(50, 50), new PVector(0, 0), new PVector(0, 0));

}

void draw() {
  background(220);
  if (gameStarted) {
  for (GridSquare square : squares) {
  square.display();
    }  
    
  movingEllipse.update();
  movingEllipse.display();
  
  for (GridSquare square : squares) {
      if (movingEllipseIsInSquare(movingEllipse.position, square) && !isSquareActivated(square)) { 
      activatedSquares.add(square); 
      square.activated = true; 
      break;
      }
  }
      if (activatedSquares.size() == squares.size() && !gameWon) { 
      gameWon = true;
      gameOver = true; 
      gameStarted = false; 
      displayMessage("Winner");
  }
      if (timerRunning) {
      timer -= 0.01;
      if (timer <= 0) {
      timer = 0;
      timerRunning = false;
      if (!gameWon) { 
      gameOver= true;
      gameStarted =false;
      displayMessage("Try Again"); 
      }
    }
}
fill(0);
textSize(24);
textAlign(CENTER, CENTER);
text(nf(timer, 1, 2), width / 2, height - 30); 
      }else{
 fill(255, 0, 0);
  textSize(48); 
   textAlign(CENTER, CENTER);
   if (gameWon) { 
   text("Winner!", width / 2, height / 2 - 20); 
   textSize(28); 
   fill(0);
   text("'R'restart", width / 2, height / 2 + 45); 
   }else{
   text("Try Again", width / 2, height / 2 - 20);
   textSize(28); 
   fill(0); 
   text("'R'restart", width / 2, height / 2 + 45);
   }
      }
}
 
 

void keyPressed() {
   if (gameStarted) { 
   if (key == 'w' || key == 'W') {
      movingEllipse.velocity.y = -5;
    } else if (key == 's' || key == 'S') {
      movingEllipse.velocity.y = 5;
    } else if (key == 'a' || key == 'A') {
      movingEllipse.velocity.x = -5;
    } else if (key == 'd' || key == 'D') {
      movingEllipse.velocity.x = 5;
    }
     } else { 
    if (key == 'r' || key == 'R') { 
      resetGame(); 
      gameStarted = true; 
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
