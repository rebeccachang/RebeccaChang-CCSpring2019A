/*
Week5_HW_RebeccaC
Author: Rebecca Chang
Summary: Gus the character is drawn on the screen. 
When you press up & down, he gets further/closer.
*/

float growGus = 1.0;

void setup(){
  size(1920, 1080);
  background(0);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100); 
}

void draw(){
  background(0); //refresh bg
  
  //insert my function
  drawGus();
  
}


void drawGus(){
  pushMatrix();
  translate(width/2, height/2); //centers to middle of screen
  scale(growGus); //order matters, translate rotate scale.
  fill(5, 35, 100); //gus looked too scary so he is now pink
  rect(0, 40, 30, 35);
  ellipse(0, 0, 70, 70);
  
  fill(0); //eye color
  ellipse(-15, 0, 5, 5);
  ellipse(15, 0, 5, 5);
  line(-2, 7, 2, 7);
  popMatrix();
}

void keyPressed(){
  //up and down key will move gus
  if(keyCode == UP && growGus > 0.0){
    growGus--;
  }else if(keyCode == DOWN && growGus < 14.0){
    growGus++;
  }
}
