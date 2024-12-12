class GridSquare {
  PVector position;
  float size;
  boolean activated = false;
  
  GridSquare(PVector pos, float sz) {
  position = pos;
  size = sz;
  }

  void display(){
  if (activated) {
  fill(0, 255, 0);
  } else {
  fill(200);
  }
  rect(position.x, position.y, size, size);
   }
   
   boolean isInside(PVector point) {
   float px = point.x; 
   float py = point.y; 
   
   return px >= position.x && px <= position.x + size &&
           py >= position.y && py <= position.y + size;
   }
}
