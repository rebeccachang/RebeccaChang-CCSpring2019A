/*
midterm.pde
Rebecca Chang
Summary: A sketch that allows you to control a cat(arrow keys) in order to eat as many fish as possible and
grow bigger with every fish until you cannot eat anymore
--> fixed some sizing issues with box & image, added definite ending to game & restart function
*/

Cat cat;
Food[] foods;

PImage[] cats = new PImage[2];
PImage fish;
PImage end;

//to control cat animation speed
int animationFrame = 0;

//imaginary grid for movement
float grid = 50;

void setup() {
  size(1000, 1000);
  
  //centers all squares, images, text alignment
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  
  //font size & color, and color mode for background
  textSize(30);
  fill(0);
  colorMode(HSB, 360, 100, 100);
  
  //controls cat's spawn & initial size
  cat = new Cat(100, 100, grid);

  //create 3 food that randomly spawns and relocates randomly around screen
  foods = new Food[4];
  for(int i = 0; i < foods.length; i++){
    foods[i] = new Food(random(0, width), random(0, height), grid, grid);
  }
  
  //loads both frames for cat animation & fish img
  for (int i = 0; i < cats.length; i++) {
    cats[i] = loadImage("cat"+i+".png");
  }
  fish = loadImage("fish.png");
  //loads end screen
  end = loadImage("end.jpg");
}


void draw() {
  background(0, 20, 100);
  
  //cat image switches between two imgs every 15 frames 
  image(cats[animationFrame], (cat.x), (cat.y), (cat.w +40), (cat.w +40)); //needs to be modified to ensure that the image is centered on the box
  if((frameCount % 15) == 0){
    if(animationFrame == 0){
      animationFrame = 1; 
    } else {
      animationFrame = 0;
    }
  }
  
  //cat.show();
  for(Food food : foods){ //all foods at once
    //food.show();
    image(fish, food.x, food.y, food.w +50, food.h +50);
    if (food.intersects(cat)) {
      cat.update();
      food.update();
    }
  }
  
  //end of game
  if((cat.w) > (width/3)){
    background(200, 20, 80);
    image(end, width/2, height/2);
    text("He's not fat, he's big boned.", width/2, 200);
    text("Press 'F' to restart", width/2, 700);
  }
}

void reset(){ //not supposed to call setup() !!
  cat = new Cat(100, 100, grid);
  foods = new Food[4];
  for(int i = 0; i < foods.length; i++){
    foods[i] = new Food(random(0, width), random(0, height), grid, grid);
  }
}


//cat movement -within the borders of the window-
void keyPressed() { 
  if (keyCode == UP && cat.y > 0) {
    cat.move(0, -1);
  } else if (keyCode == DOWN && cat.y < height) {
    cat.move(0, 1);
  } else if (keyCode == RIGHT && cat.x < width) {
    cat.move(1, 0);
  } else if (keyCode == LEFT && cat.x > 0) {
    cat.move(-1, 0);
  }else if (key == 'f' || key == 'F'){
    reset();
  }
}
