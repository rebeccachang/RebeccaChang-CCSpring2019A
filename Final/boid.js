//credits: Dan Shiffman "Coding Challenge #124: Flocking Simuation" https://www.youtube.com/watch?v=mhjuuHl6qHM 
//used specifically for flocking system "it's kinda like a bird. droid, but boid"

//flocking requires SEPARATION, ALIGNMENT, COHESION 

class Boid{
    constructor(){
        //createVector([x], [y], [z])
        var xPos = (width-150) + floor(random()*150);
        var yPos =  (height-150) + floor(random()*150);
        this.position = createVector(xPos, yPos); //position in middle of screen for now
        this.velocity = p5.Vector.random2D();
        
        //create random velocities for each boid
        this.velocity.setMag(random(3, 7));
        this.acceleration = createVector();
        this.maxForce = 0.4;
        //prevent them from going too slowly
        this.maxSpeed = 3;
    }

    
    //hmmm.mp4
    follow(flowfield){
        var x = floor(this.position.x/scl);
        var y = floor(this.position.y/scl);
        var index = x + y * colm;
        var force = flowfield[index];
        this.applyForce(force);
    }
    
    //accumulate forces into acceleration
    applyForce(force){
        this.acceleration.add(force);
    }

    //create infinite borders
    edges(){
        if(this.position.x > width){
            this.position.x = random(width/2,width);
            this.position.y = height;
        }else if(this.position.x < 0){
            this.position.x = random(width/2,width);
            this.position.y = height;
        }
        if(this.position.y > height){
            this.position.x = width;
            this.position.y = random(height-200, height);
        }else if(this.position.y < 0){
            this.position.x = width;
            this.position.y = random(height-200, height);
        }
    }

    //aligning in same direction as boids in that perception radius
    align(boids){
        //sets the "local" area of alignment affect
        let perceptionRadius = 70;
        //not the average velocity, but the velocity you want it to align to
        let desired = createVector();
        //i believe this is the total #of boids being affected within a perception radius 
        let total = 0;
        for(let other of boids){
            //calculate distance between this boid position and other boid position
            let d = dist(
                this.position.x,
                this.position.y,
                other.position.x,
                other.position.y
            );
            if(other != this && d < perceptionRadius){
                //average vectors so that directions of all voids in same area can align
                desired.add(other.velocity); 
                total++;
            }
        }
        //divide by total if total more than 0
        if(total > 0){
            desired.div(total);
            //preventing the slowing down of boids when aligning
            desired.setMag(this.maxSpeed);
            desired.sub(this.velocity);
            //syntax: limit(max) - limits the magnitude of the vector
            desired.limit(this.maxForce);
        }
        return desired;
    }

    //boids separate by moving in opposite direction inversely proportional to magnitude of nearby boids. tl;dr: boid moves in opposite direction to avoid others
    separation(boids){
        let perceptionRadius = 70; //same as alignment
        //should probably change "desired" to "steering"
        let desired = createVector();
        let total = 0;
        for(let other of boids){
            //calculate distance between this boid position and other boid position
            let d = dist(
                this.position.x,
                this.position.y,
                other.position.x,
                other.position.y
            );
            if(other != this && d < perceptionRadius){
                //the way to subtract two vectors
                let diff = p5.Vector.sub(this.position, other.position);
                //further the way it is, lower the magnitude
                diff.mult(d);
                //then average all the vectors
                desired.add(diff); 
                total++;
            }
        }
        //divide by total if total more than 0
        if(total > 0){
            desired.div(total); //divide total
            desired.sub(this.position); //find difference in location
            desired.setMag(this.maxSpeed); //maintain speed
            desired.sub(this.velocity); //subtract current velocity
            desired.limit(this.maxForce); //maximum ammount of force affecting boids
        }
        return desired;
        
        
    }

    //staying in the same perception radius area as other boids (grp together)
    cohesion(boids){
        let perceptionRadius = 70; //same as alignment
        //should probably change "desired" to "steering"
        let desired = createVector();
        let total = 0;
        for(let other of boids){
            //calculate distance between this boid position and other boid position
            let d = dist(
                this.position.x,
                this.position.y,
                other.position.x,
                other.position.y
            );
            if(other != this && d < perceptionRadius){
                //average vectors so that directions of all voids in same area can align
                desired.add(other.position); 
                total++;
            }
        }
        //divide by total if total more than 0
        if(total > 0){
            //this is a lot of math
            desired.div(total); //divide total
            desired.sub(this.position); //find difference in location
            desired.setMag(this.maxSpeed); //maintain speed
            desired.sub(this.velocity); //subtract current velocity
            desired.limit(this.maxForce); //maximum ammount of force affecting boids
        }
        return desired;
    }

    flock(boids){
        let alignment = this.align(boids);
        let cohesion = this.cohesion(boids);
        let separation = this.separation(boids);
        //Force accumulation. If 2 forces are acting on object, result is sum of forces. i dislike physics but i'm too far in this project now oh no
        this.acceleration.add(alignment);
        this.acceleration.add(cohesion);
        //so that after adding cohesion, they still have direction
        this.acceleration.add(separation);
    }

    update(){
        this.position.add(this.velocity);
        this.velocity.add(this.acceleration);
        this.velocity.limit(this.maxSpeed);
        this.acceleration.mult(0);
        //reset acceleration to 0, so that acceleration isnt just accumulating
    }

    show(){
        strokeWeight(8);
        colorMode(HSB, 100, 100, 100);
        stroke(10, 70, 100);
        point(this.position.x, this.position.y);
    }
}
