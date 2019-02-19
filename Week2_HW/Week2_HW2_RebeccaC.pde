/*
Rebecca Chang
Week 2 Assignment
Solving-Sol Wall Drawing #630
"A wall is divided horizontally into two equal parts. 
Top: alternating horizontal black and white 8-inch (20 cm) bands. 
Bottom: alternating vertical black and white 8-inch (20 cm) bands."
Created two loops, one to create the stripes on top, 
one for the vertical stripes on bottom.
*/

//number of black stripes on top and bottom
float numRecTop = 5;
float numRecBot = 10;

void setup(){
  //Instead of making separate black and white rectangles, 
  //a white background creates negative space for the black stripes.
  size(1920, 1080);
  background(255);
}

void draw(){
  background(255);
  fill(0);
  //space between rect
  float yStep = height/numRecTop;
  float xStep = width/numRecBot;
  
  //top horizontal rect
  for(float y = 0; y < height/2; y += yStep){
    rect(0, y, width, 110); 
  }
  //bottom vertical rect
  for(float x = 0; x < width; x += xStep){
    rect(x, height/2, 100, height/2);
  }
}
