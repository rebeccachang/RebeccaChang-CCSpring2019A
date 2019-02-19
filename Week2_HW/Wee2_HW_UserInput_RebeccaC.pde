/*
Rebecca Chang
Week 2 Assignment
Solving-Sol Wall Drawing #46
"Create a Processing sketch that showcases object motion within the bounds 
of the canvas and somehow incorporates user input."
This is suppose to create a 2x2 square area where the user can control
where the colored square can travel using the arrow keys.
*/
//ok you can do this!

//square dimension
float squ = 300;
//colored square coordinates
float colorX = 660;
float colorY = 240;


void setup(){
  size(1920, 1080);
  background(0);
  
}

void draw(){
  background(0);
  fill(255);
 
  //need to draw squares  
  rect(660, 240, squ, squ);
  rect(960, 240, squ, squ);
  rect(660, 540, squ, squ);
  rect(960, 540, squ, squ);
  
  //need to make the colored square
  fill(155);
  rect(colorX, colorY, squ, squ);
  
}
void keyPressed(){
 if(keyCode == LEFT && colorX - squ >= 600){
   fill(255);
   rect(colorX, colorY, squ, squ);
   colorX -= squ;
   fill(155);
   rect(colorX, colorY, squ, squ);
 }
 else if(keyCode == RIGHT && colorX + squ <= 960){
   fill(255);
   rect(colorX, colorY, squ, squ);
   colorX += squ;
   fill(155);
   rect(colorX, colorY, squ, squ);
 }
 else if(keyCode == UP && colorY + squ <= 540){
   fill(255);
   rect(colorX, colorY, squ, squ);
   colorY += squ;
   fill(155);
   rect(colorX, colorY, squ, squ);
 }
 else if(keyCode == DOWN && colorY - squ >= 240){
   fill(255);
   rect(colorX, colorY, squ, squ);
   colorY -= squ;
   fill(155);
   rect(colorX, colorY, squ, squ);
 }
}


//"could not parse -1 for --display" ?
//works as intended except that up and down controls are inverted
//WHY?
