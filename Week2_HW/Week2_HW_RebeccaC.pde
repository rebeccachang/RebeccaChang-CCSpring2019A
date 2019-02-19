/*
Rebecca Chang
Week 2 Assignment
Solving-Sol Wall Drawing #46
"Vertical lines, not straight, not touching, covering the wall evenly."
So I will create zig zag lines that do not touch and cover the screen.
Using while loops (?) like the grid example we did in class
*/

//the number of zig zags that span across screen
float numLines = 16;

void setup(){
  //canvas parameters
  size(1920, 1080);
  background(255);
  stroke(0);
  
  /*
  //attempt 1: got stuck at how I was going to copy the zig zag across screen
  
  float x = 0.0; //starting x point for our zig zags
  float numLines = 48; //number of lines i want across screen (1920 / 40)
  float xStep = width/numLines; //amount of space between zig zags (1920 / 48)
  
  while(x < width){ //so it's not printed past the screen width
  */  
}

void draw(){
  background(255);
  
  //amount of space between zig zags across screen
  float xStep = width/numLines;
  
  //draws first row of zigs
  for(float x = 0; x < width; x += xStep){
    line(x, 0, x + 200, height/3);
  }
  
 //draws second row of zags
 for(float x = 0; x < width; x += xStep){
   line(x + 200, height/3, x, height * 2/3);
 }
 //draws third row, zigs again 
 for(float x = 0; x < width; x += xStep){
   line(x, height * 2/3, x + 200, height);
 }
}

/*
problem was I was thinking of drawing one whole zig zag and looping that across,
when I could just separate each row of zigs and zags into their own loops
*/
