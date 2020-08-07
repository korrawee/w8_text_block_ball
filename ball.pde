Ball b1; /*create class's var.*/

void setup(){
  b1 = new Ball(10, 20, 20); /*b1 contains obj's Ball*/
  b1.draw();   /*show ball*/
}

class Ball{
   float size;
 
   int position_x;
   int position_y;
 
   Ball(float s, int posX, int posY){
     size = s;
     position_x = posX;
     position_y = posY;
   }
 
   void draw(){
     size = 2 * size; /*increase size to radian*/
     fill(255);
     ellipse(position_x, position_y, size, size);
   }
    
}
