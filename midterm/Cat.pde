//controls how large cat grows & movement/distance

class Cat extends Rectangle{ //cat inherits rectangle & intersect functionality
  
  Cat(float x, float y, float w){
    super(x, y, w, w); //super = parent class, initialized inherited properties (?)
  }
  
  void show(){
    fill(255);
    rect(x, y, w, w);
  }
  
  void update(){ //test for value to make sure that it doesn't grow too big too fast
    w += grid/3;
    //bigChonk
  }
  
  //how much it moves -by the grid
  void move(float xdir, float ydir){
    x += xdir * grid;
    y += ydir * grid;
  }
  
  
}
