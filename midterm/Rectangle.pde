//Coding Challenge #72.1: Frogger- Part 1 By Dan Shiffman
//creates rectangles/boxes that act as invisible hit boxes. makes it easier to track collisions based off box's borders

class Rectangle{
  float x;
  float y;
  float w;
  float h;
  
  Rectangle(float x, float y, float w, float h){//constructor
    this.x = x + w;
    this.w = w;
    this.y = y + h;
    this.h = h;
  }
  
  boolean intersects(Rectangle other){ //tests if one rectangle intersects with another 
    float left = x;
    float right = x + w;
    float top = y;
    float bottom = y + h;
    
    float oleft = other.x;
    float oright = other.x + other.w;
    float otop = other.y;
    float obottom = other.y + other.h;
    
    
    return !(left >= oright || 
      right <= oleft ||
      top >= obottom ||
      bottom <= otop);
  }
  
  
  
}
