class Ellipse {
  PVector position; //positon of the ellipse
  PVector velocity; //velocity of the ellipse as movement speed
  PVector acceleration; // accel of ellipse
  
  //Below: constructor
  Ellipse(PVector pos, PVector vel, PVector accel) { 
    position = pos;  //assign given position to the ellipse        
    velocity = vel; // Assign the given velocity to the ellipse         
    acceleration = accel; // Assign the given acceleration to the ellipse 
  }
  
  void update() {
    velocity.add(acceleration); // Update the velocity by adding acceleration
    position.add(velocity); // Update the position by adding the velocity
    
   // Below block: to ensure the ellipse stays within the window's boundaries
   if (position.x < 0) position.x = 0;  // if the ellipse goes past the left boundary, reset to 0
   if (position.x > width) position.x = width; // if the ellipse goes past the right boundary, reset to the width
   if (position.y < 0) position.y = 0;  // if the ellipse goes past the top boundary, reset to 0
   if (position.y > height) position.y = height; // leastly ff the ellipse goes past the bottom boundary, reset to the height
  }
  
  void display(){
    fill(255, 0, 0); // Red color for the ellipse
    ellipse(position.x, position.y, 20, 20); //draw it at the specified postion with diameter = 20
  }
}
