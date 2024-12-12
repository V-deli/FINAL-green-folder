ArrayList<GridSquare> activatedSquares = new ArrayList<GridSquare>();
ArrayList<GridSquare> squares = new ArrayList<GridSquare>();
Ellipse movingEllipse;
float timer = 5;
boolean timerRunning =true;
boolean gameOver = false;
boolean gameWon = false;
boolean gameStarted = true;

void setup() {
  size(400, 400);
  float size = width / 3;
  for (int i = 0; i < 9; i++) {
    int row = i / 3;
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
