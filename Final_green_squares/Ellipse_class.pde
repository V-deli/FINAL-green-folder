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
  }
  
  void display(){
    fill(255, 0, 0); // Red color for the ellipse
    ellipse(position.x, position.y, 20, 20);
  }
}
