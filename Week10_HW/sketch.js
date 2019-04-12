/*
Week10 HW
Rebecca C

"Pick one of your older sketches and translate"
*/

var c; //variable for color

const scaleSqu = 7; //constant scale size- does not change

function setup(){
    //set canvas parameters
    createCanvas(windowWidth, windowHeight); //width & height of inner window
    background(150);
    colorMode(HSB, 360, 100, 100);
    noStroke();
    rectMode(CENTER);
    //saw this in the References and now I will use it forever
    cursor(CROSS);
}

function draw(){
    background(150);
    //color mapped to mouse location on screen
    c = color(map(mouseX, 0, width, 0, 360), 40, 100);

    push(); //pushMatrix() --> push()
    //changes origin to middle of screen
    translate(width/2, height/2);
    //maps rotation of square based off mouseX position
    rotate(-1*radians(map(mouseX, 0, width, 0, 360)));
     //scales based off mouseX position but only up to the scaleSqu number
     scale(mouseX*scaleSqu/width);
     fill(c);
    rect(0, 0, 100, 100);
    //color(map(mouseX, 0, width, 0, 360), 40, 100); color needs to be variable
     pop();

}