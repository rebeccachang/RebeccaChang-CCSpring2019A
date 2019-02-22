/*
Week 3 Assignment
Rebecca C
"iterate on last week’s motion sketch and tweak it to include at least 
one method of iteration (for/while loop), and one array"
Originally: balls bounce around the screen randomly, now they start off at a random pastel color,
and then it cycles through the color based off it's starting hue.
*/

int numBalls = 12; //number of balls in the sketch

//define array containers for ball parameters
float[] xPos = new float[numBalls];
float[] yPos = new float[numBalls]; //arrays to hold x,y positions

float[] xSpeeds = new float[numBalls];
float[] ySpeeds = new float[numBalls]; //arrays to hold x,y speeds

float[] colors = new float[numBalls]; //arrays to hold diff colors

void setup(){ 
  //canvas parameters
  size(1920, 1080);
  background(150);
  
  colorMode(HSB, 360, 100, 100); //sets hue out of 360, saturation and brightness out of 100

  
  //loop through all the arrays and set random values to use later
  for(int i = 0; i < numBalls; i++){
    //set a random x, y position for a given ball
    xPos[i] = random(100, width - 100);
    yPos[i] = random(100, height - 100);
    
    //set a random x, y speed for a given ball
    xSpeeds[i] = random(-8, 8);
    ySpeeds[i] = random(-8, 8);
  }
  
  for(int i = 0; i < numBalls; i++){
      colors[i] = random(360); //random pastel color set for each ball//random pastel color set for each ball
  }
  
}


void draw(){
  background(0);
  
  for(int i = 0; i < numBalls; i++){
    ellipse(xPos[i], yPos[i], 100, 100); //draw the ith ellipse
    fill( (colors[i] + frameCount*2) % 360, 30, 100);
    //check to see if the ith ellipse has collided with any boundaries
    if(xPos[i] > width || xPos[i] < 0.0){
      xSpeeds[i] *= -1;
    }
    if(yPos[i] > height || yPos[i] < 0.0){
      ySpeeds[i] *= -1;
    }
    
    if(true){
      xPos[i] += xSpeeds[i];
      yPos[i] += ySpeeds[i];
    }
  }

  //i want the hue to go up by 1 every frameCount and cycle


  
}
