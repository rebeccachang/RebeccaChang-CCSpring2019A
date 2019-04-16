/*
Week6 HW Redo
Rebecca C

Particles using P4.JS, particles follow mouse,
and when mouse is pressed, particles change in color
*/

let particles = [];
let sat = 0; //sets level for saturation

function setup(){
    createCanvas(windowWidth, windowHeight);
    colorMode(HSB, 360, 100, 100, [255]); //hue, saturation, brightness, [alpha]
    
}

function draw(){
    background(0);
    for(let i = 0; i < 10; i++){
        let p = new Particle();
        particles.push(p); //start drawing array particles
    }
    for (let i = particles.length - 1; i >= 0; i--){
        particles[i].update();
        particles[i].show();
        if(particles[i].isDead()){
            particles.splice(i, 1); //splice that particle i
        }
    }
}

class Particle{
    constructor(){
        this.x = mouseX; //particle x location
        this.y = mouseY; //y location
        this.vx = random(-5, 5); //x velocity
        this.vy = random(-5, 5); //y velocity
        this.lifespan = 255; //alpha starts at 255
        this.color = random(0, 360);
    }

    isDead(){
        return this.lifespan < 0 //to destroy particles
    }

    update(){
        //moving the particles
        this.x += this.vx;
        this.y += this.vy;
        //particles slowly disappear over time
        this.lifespan -= 7;
    }

    show(){
        noStroke(); 
        fill(this.color, sat, 90, this.lifespan); //random color, saturation, brightness, alpha
        square(this.x, this.y, 10);
    }
}

function mousePressed(){
    //when mouse is pressed, particles become colored
    sat = 50;
    square(this.x, this.y, 10);
    //supposed to turn into circles, but particles did not want to turn into circles
}

function mouseReleased(){
    //when released, particles go back to being grey squares
    sat = 0;
    square(this.x, this.y, 10);
}