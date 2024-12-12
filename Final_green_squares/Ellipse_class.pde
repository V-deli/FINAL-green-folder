class Ellipse {
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Ellipse(PVector pos, PVector vel, PVector accel) {
    position = pos;          
    velocity = vel;          
    acceleration = accel;   
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    
   if (position.x < 0) position.x = 0; 
   if (position.x > width) position.x = width;
   if (position.y < 0) position.y = 0;
   if (position.y > height) position.y = height; 
  }
  
  void display(){
    fill(255, 0, 0); // Red color for the ellipse
    ellipse(position.x, position.y, 20, 20);
  }
}
