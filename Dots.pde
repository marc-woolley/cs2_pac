            class Dots {
   private boolean[][] dots;
   private int count;
    
   // Create an initial board with every dot present
   Dots() {
   int a = 0;
   int b = 0;
   dots = new boolean[30][30];
     while(a !=29 || b!= 29 ){
         if(b == 29) {
             a=a+1;
               b=0;
        }  
       

              dots[a][b] = true;
                          b= b+1;
   }
   }
   

   // remove any dots between the two positions
   // return the number of dots removed
  // Normally the input vectors will either be in the same row
   // or the same column.  It's fine to only handle these cases.
   // Write a comment explaining what your version does
   // if the inputs are not in the same row or column.
   int remove( PVector toPosition) {
  
   int endingx=pixelToDot(toPosition.x);
   int endingy=pixelToDot(toPosition.y);
   
  if(dots[endingy][endingx]==true){ 
  dots[endingy][endingx]=false;
 count=count+1;  
}
  
//println(count);
   
   return count ;
   
   }

      // return the number of dots remaining
   boolean remaining() {
       return true;
   }

   // Draw the dots.  Use `dotToPixel`
   void render() {
     fill(255);
     int a = 0;
   int b = 0;
     while(a !=29 || b!= 29 ){
         if(b == 29) {
             a=a+1;
               b=0;
        }
        if(dots[b][a]==true){ 
         ellipse(dotToPixel(a), dotToPixel(b) ,15,15);
                    
     }
     b= b+1;  
   }
   }

  }