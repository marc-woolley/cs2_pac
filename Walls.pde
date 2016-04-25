class Walls {
    // vertical walls.
    // This array is true for a given square if there is a wall to the right of that square
    private boolean[][] vertical;
    // horizontal - true if there is a wall below that square.
    private boolean[][] horizontal;

    // A new set of walls, for testing purposes
    // eventually, we'll want some particular levels
    Walls() {
        this.vertical = new boolean[boardHeight][boardWidth];
        this.horizontal = new boolean[boardHeight][boardWidth];
        for(int i=0; i<boardHeight; i++) {
            for (int j=0; j<boardWidth; j++) {
                if (i == j) {
                    vertical[i][j] = true;
                    horizontal[i][j] = true;
                } else {
                    vertical[i][j] = false;
                    horizontal[i][j] = false;
                }
            }
        }
    }


    // Make a new Walls object from two arrays:
    // Horizontal & Vertical walls.
    // WISH check that dimensions are correct.
    Walls(boolean[][] h, boolean[][] v) {
        this.horizontal = h;
        this.vertical = v;
    }

    // If there is a wall between the two given positions, return the point of collision.
    // Otherwise, return some value that can never be a collision.
    // Input & Output are in pixel coordinates
    boolean collision(PVector fromPosition,PVector toPosition) {
  
    int startingx=pixelToDot(fromPosition.x);
    int startingy=pixelToDot(fromPosition.y);
    int endingx=pixelToDot(toPosition.x); 
    int endingy=pixelToDot(toPosition.y);
    boolean there_is_a_wall;
   
   if(dotToPixel(startingx) == dotToPixel(endingx)){
     if(vertical[startingx][startingy]==true){
         there_is_a_wall=false;
     }else if(vertical[endingx][endingy]==true){
         there_is_a_wall=true;
   }
 
   
   
  /* if(vertical[startingx][startingy]==true){
         there_is_a_wall=false;
   }else if(vertical[endingx][endingy]==true){
         there_is_a_wall=true;
   }else if(horizontal[startingx][startingy]==true){
         there_is_a_wall=false;
   }else if(horizontal[endingx][endingy]==true){
         there_is_a_wall=true;
   }else{
   there_is_a_wall=false;
   }*/
      println(there_is_a_wall);
      
      return there_is_a_wall;

}    
  

      
        for(int i=0; i<boardHeight; i++) {
            for (int j=0; j<boardWidth; j++) {
                if (vertical[i][j]==true) {
                  stroke(225,225,400);   
                  rect(dotToPixel(i)+15,dotToPixel(j)-15,3,dotSpacing); 
                } 
                 if (horizontal[i][j]==true) {
                  stroke(225,225,400);   
                  rect(dotToPixel(i)-15,dotToPixel(j)+15,dotSpacing,3); ; 
                } 
                      
          }
        
    }
     
    }
    
  }