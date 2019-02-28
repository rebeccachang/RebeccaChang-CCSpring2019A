//Create a sketch that makes use of transformations to create repetitive, 
//harmonic motion. Try to incorporate what we learned about color theory.

//color datatype
color c;
int scaleSqu = 7;

void setup(){
  size(1920, 1080);
  background(150);
  noStroke();
  rectMode(CENTER);
  //scaleSqu = 7; this works too to change scale of square
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(150);
  //maps color of square based off mouseX position
  c = color(map(mouseX, 0, width, 0, 360), 40, 100);
  
  pushMatrix();
  //changes origin to middle of screen
  translate(width/2, height/2);
  //maps rotation of square based off mouseX position
  rotate(-1*radians(map(mouseX, 0, width, 0, 360)));
  //scales based off mouseX position but only up to the scaleSqu number
  scale(mouseX*scaleSqu/width);
  fill(c);
  rect(0, 0, 100, 100);
  //color(map(mouseX, 0, width, 0, 360), 40, 100); color needs to be variable
  popMatrix();
}
