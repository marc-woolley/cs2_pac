final int boardWidth = 30; // number of dots across
final int boardHeight = 30; // number of dots down
final int dotSpacing = 30; // pixels between dot centers
final int dotRadius = 3; // pixels

Dots dots;
Pac pac;
Walls walls;

// It's convenient to refer to two coordinate systems
// Pixel coordinates are the usual Processing coordinates
// Dot coordinates describe the screen as a grid of boxes.
// Each box has an integer x & y coordinate.  At the start of the game,
// there is a dot in the *center* of each box.

// dotToPixel gives the pixel coordinate in the *center* of the corresponding box
float dotToPixel(int x) {
    return (0.5 + x) * dotSpacing;
}



// pixelToDot finds the box in which the pixel is contained
int pixelToDot(float x) {
    if (x > boardWidth * dotSpacing) {
        println(x);
    }
    return floor(x / dotSpacing);
}

void setup() {
    size(900,900);
    dots = new Dots();
    pac = new Pac();
    walls = new Walls();
}

void draw() {
    clear();
    dots.render();
    pac.render(0);
    walls.render();

if(keyPressed){ 
     if(key=='D'|| key=='d'){ 
      pac.setDirection(Dir.EAST);
      pac.updatePosition(walls);
          }else if(key=='A'|| key=='a'){
             pac.setDirection(Dir.WEST);
             pac.updatePosition(walls);
              }else if(key=='W'|| key=='w'){  
                 pac.setDirection(Dir.NORTH);
                 pac.updatePosition(walls);
                    }else if(key=='S'|| key=='s'){
                       pac.setDirection(Dir.SOUTH);
                       pac.updatePosition(walls);   
  }
   }
          if(key==CODED){
            if(keyCode==UP){
              pac.setDirection(Dir.NORTH);
              pac.updatePosition(walls);  
              }else if(keyCode==DOWN){
                   pac.setDirection(Dir.SOUTH);
                    pac.updatePosition(walls);  
                    }else if(keyCode==RIGHT){
                        pac.setDirection(Dir.EAST);
                        pac.updatePosition(walls); 
                       }else if(keyCode==LEFT){
                              pac.setDirection(Dir.WEST);            
                              pac.updatePosition(walls); 
          }
          
          }
dots.remove(pac.getPosition());

}