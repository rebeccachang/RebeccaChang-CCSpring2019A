//randomly spawns fish around screen

class Food extends Rectangle{
  Food(float x, float y, float w, float h){
    super(x, y, w, h); 
  }
  
  //where it spawns
  void update(){
    x = random(0, width);
    y = random(0, height);
  }
  
  //grey to distinguish between cat
  void show(){
    fill(100);
    rect(x, y, w, h);
  }
}
