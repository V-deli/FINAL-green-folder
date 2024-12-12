Ellipse movingEllipse;
void setup() {
  size(400, 400);
  movingEllipse = new Ellipse(new PVector(50, 50), new PVector(0, 0), new PVector(0, 0));
}

void draw() {
  background(220);
  
  movingEllipse.update();
  movingEllipse.display();
    
    
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
