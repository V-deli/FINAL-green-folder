class GridSquare {
  PVector position; // position of the top-left corner of the square
  float size; //square size
  boolean activated = false; //checks if the square is activated
  
  // Below: constructorr
  GridSquare(PVector pos, float sz) {
  position = pos; //assign the given position to the square
  size = sz; //assign size to the square
  }

  void display(){
  if (activated) { //if activated...
  fill(0, 255, 0); // // make the color green if the square is activated
  } else { //else...
  fill(200); //square s grey, because it is not activated
  }
  rect(position.x, position.y, size, size); // draw the square at the position with the specified size
   }
   // Below: purpose to check if a point is inside the square
   boolean isInside(PVector point) {
   float px = point.x;  // x-coordinate of the point
   float py = point.y; //  y-coordinate of point
   
    // this lastly checks if the point lies within the bounds of the square
   return px >= position.x && px <= position.x + size &&
           py >= position.y && py <= position.y + size;
   }
}
