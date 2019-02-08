/*
Week1_HW_RebeccaC.pde
Author: Rebecca C
Summary: Recreate piece of art in the Geometric Abstraction collection 
         from Google Arts & Culture using Processing
*/

void setup(){
  size(1920, 1080);
  background(248, 238, 228);
  rectMode(CENTER);
  noStroke();
 
  //green
  fill(107, 153, 116);
  rect(1200, 740, 45, 235);
  rect(1280, 730, 165, 45);
  quad(995, 660, 1210, 720, 1210, 765, 995, 705);
  
  //red
  stroke(203, 102, 105);
  strokeWeight(5);
  noFill();
  line(618, 180, 618, 290);
  line(560, 238, 676, 238);
  ellipse(1225, 265, 101, 101);
  line(860, 650, 860, 760);
  line(760, 705, 930, 705);
  
  //black 
  noStroke();
  fill(60, 60, 60);
  quad(560, 575, 767, 576, 767, 940, 560, 940);
  quad(710, 155, 790, 155, 640, 470, 575, 447);
  //lines
  stroke(0);
  strokeWeight(5);
  noFill();
  quad(1120, 310, 1190, 310, 1290, 510, 1220, 510);
  line(1290, 510, 1290, 820);
  line(1120, 670, 1360, 670);
  
  //white quad in black rect
  stroke(248, 238, 228);
  strokeWeight(5);
  noFill();
  quad(676, 670, 740, 670, 676, 860, 612, 860);
  
  //yellow 
  noStroke();
  fill(234, 211, 70);
  quad(765, 780, 860, 780, 970, 940, 865, 940);
  //lines
  stroke(234, 211, 70);
  strokeWeight(5);
  noFill();
  line(618, 705, 764, 705);
  ellipse(850, 380, 150, 150);
  
  //blue
  noStroke();
  fill(93, 122, 175);
  rect(995, height/2, 70, 800);
  rect(1060, height/2, 600, 70);
  quad(640, 470, 780, 505, 767, 576, 620, 535);
  //lines
  stroke(93, 122, 175);
  strokeWeight(5);
  line(1150, 155, 1150, 265);
  line(1095, 210, 1210, 210);
  
  
  //grey 
  noStroke();
  fill(109, 114, 117);
  rect(width/2, 120, 800, 70);
  rect(width/2, 960, 800, 70);
  
}

void draw(){  
  
}
