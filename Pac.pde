class Pac {
    private PVector position;
    final float speed = 0.1 * dotSpacing;
    private Dir travelDirection = Dir.EAST;

    // for testing purposes, don't start in the corner
    Pac() {
        position = new PVector(dotToPixel(5), dotToPixel(0));
    }

    // return a copy of the current position
    PVector getPosition() {
      PVector currentposition = position.copy(); 
        return currentposition;
    }

    // set a new movement direction
    void setDirection(Dir d) {
        travelDirection=d;    
    

}

    // Draw the Pac, as a circle
    void render(int a) {
      fill(225,0,0);
      ellipse(position.x,position.y ,a+15 ,  a+15);  
    }

    // If the given vector is off the screen, wrap it around to the other side
    // Modify the given vector.
    // If this were public, we probably woudn't modify the vector in place like this.
    private void wrapPosition(PVector vec) {
       if(vec.x>=900||vec.x<=0){
     vec.x=450;
       }
         if(vec.y>=900||vec.y<=0){
          vec.y=450;       
     }
    }

    // reverse the movement direction
    private void reverseDirection() {
      if (travelDirection == Dir.EAST ){
           travelDirection = Dir.WEST; 
      
      } else if(travelDirection ==Dir.WEST){
                travelDirection = Dir.EAST;  
      
      
      }else if(travelDirection == Dir.NORTH){
            travelDirection=Dir.SOUTH ; 
      
      
      }else if(travelDirection == Dir.SOUTH){
              travelDirection =Dir.NORTH ;
      
      }
      
    }

    // Update the position, using the current speed & travel direction
    // If normal movement would hit a wall, find the position after bouncing off the wall.
    // The total distance travelled (before + after hitting the wall) should be the same.
    void updatePosition(Walls wall) {
  PVector i;
  i= new PVector (position.x,position.y);    
  
 
      if( travelDirection == Dir.WEST){
        i.x=position.x+speed*-1;
        
        wrapPosition(i);
    }else if(travelDirection == Dir.EAST){
        i.x=position.x+speed;
        wrapPosition(i);
    }
      else if(travelDirection == Dir.NORTH){
      i.y=position.y+speed;
      wrapPosition(i);
      }
       
        else if(travelDirection == Dir.SOUTH){
        i.y=position.y+speed*-1;
        wrapPosition(i);
        } 
    
     if(wall.collision(position,i)==true){
     travelDirection = Dir.Stop;   
  }else if( travelDirection == Dir.WEST){
        position.x=position.x+speed*-1;
        
        wrapPosition(position);
    }else if(travelDirection == Dir.EAST){
        position.x=position.x+speed;
        wrapPosition(position);
    }
      else if(travelDirection == Dir.NORTH){
       position.y=position.y+speed;
      wrapPosition(position);
      }
       
        else if(travelDirection == Dir.SOUTH){
         position.y=position.y+speed*-1;
        wrapPosition(position);
        } 
    }

}





 