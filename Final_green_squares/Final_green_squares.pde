ArrayList<GridSquare> activatedSquares = new ArrayList<GridSquare>();
ArrayList<GridSquare> squares = new ArrayList<GridSquare>();
Ellipse movingEllipse;
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
      //square.display();
    }  
    
  movingEllipse.update();
  movingEllipse.display();
  
  
  }
}

void keyPressed() {
   if (key == 'w' || key == 'W') {
      movingEllipse.velocity.y = -5;
    } else if (key == 's' || key == 'S') {
      movingEllipse.velocity.y = 5;
    } else if (key == 'a' || key == 'A') {
      movingEllipse.velocity.x = -5;
    } else if (key == 'd' || key == 'D') {
      movingEllipse.velocity.x = 5;
    }
}
//void resetGame() {
//  for (GridSquare square : squares) {
//  square.activated = false;
//  }
//}
