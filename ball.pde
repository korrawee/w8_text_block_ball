/*declare array of objects*/
Block[] blocks;
Ball[] balls;

StringList ballvisibility;
StringList blockvisibility;

int amount = 10;
int size = 20;
int posX = 50;
int posY = 50;

int bW = 50;
int bH = 50;

float Area;

String[] bli = new String[amount];
String[] bi = new String[amount];


float sumAreaBall;
float sumAreaBlock;

void setup()
{
  size(600,600);
  blocks = new Block[amount]; /*create blocks array*/
  balls =new Ball[amount]; /*create balls array*/  
  
  for(int i = 0; i < amount; i++){
    balls[i] = new Ball(size, posX, posY * (i+1),i);/*create each ball's object*/
    bi[i] = "visible";
    
    blocks[i] =  new Block(posX * 2, posY * (i+1), bW, bH,i); /*create each vlokc's object*/
    bli[i] = "visible";
    
  }
}
void draw()
{
  sumAreaBall = 0;
  sumAreaBlock = 0;
  background(#FFFFFF);
  
  for(int i = 0; i < amount; i++)
  { 
    balls[i].draw();/*show each ball*/
    blocks[i].draw(); /*show each block*/   
    
    /*Mouse Events*/
    if(mousePressed){
      delay(50);
      if(mouseX > blocks[i].posX && mouseX < blocks[i].posX + bW &&
        mouseY > blocks[i].posY && mouseY < blocks[i].posY + bH){
        blocks[i].invisible(bli[i]); 
        if(bli[i] == "visible"&& i%2 != 0){
          bli[i] = "invisible";
        }else if(bli[i] == "invisible"){
          bli[i] = "visible";
        }
      }//block
      if(sqrt( sq(mouseX - balls[i].posX) + sq(mouseY - balls[i].posY) ) < balls[i].size/2){
        balls[i].invisible(bi[i]); 
        if(bi[i] == "visible" && i%2 != 0){
          bi[i] = "invisible";
        }else if(bi[i] == "invisible"){
          bi[i] = "visible";
        }
      }//balls
    }//mousePressed
  }//display loop
  
  sumAreaBall = sumArea("ball");
  sumAreaBlock = sumArea("block");
  displayArea(sumAreaBall, sumAreaBlock);
}

float sumArea(String name){
  float result = 0;
  if(name == "ball"){
    for(int i = 0; i < balls.length; i++){
      if(bi[i] == "visible"){
        result += balls[i].area;
      }
    }
  }else if(name == "block"){
    for(int i = 0; i < blocks.length; i++){
      if(bli[i] == "visible"){
        result += blocks[i].area;
      }
    }
  }
  return result; 
}
void displayArea(float ball, float block){
 fill(201,201,201);     /// show area on widget
  rect(250,300,200,100);
  fill(0);
  text(("sum of block's areas = " + block ),260,320);
  text(("sum of ball's areas = " + ball ),260,360); 
}
class Ball
{
   int state = 1;
   int rgb;
   float size;
   float area;
 
   float posX;
   float posY;
   
   Ball(float s, int x, int y ,int i)
   {
     size = s;
     posX = x;
     posY = y;
     area = 3.14 * size * size;
     rgb = i;
   }
 
   void draw()
   {
     if(state == 1)
     {
       if (rgb%2 == 0)
       {  
         fill(color( random(0,255), random(0,255), random(0,255), random(0,255)));
         ellipse(posX, posY, size, size);
       }
       else
       {
         fill(200);
         ellipse(posX, posY, size, size);
       }
     }
   }
   void invisible(String bi)
  {
    if(bi == "visible" && rgb%2 != 0){
     fill(#FFFFFF);
     ellipse(posX, posY, size, size);
     fill(200);
     state = 0;
    }else if(bi == "invisible"){
     state = 1; 
    }
  }
}

class Block
{
  int state = 1;

  int posX;
  int posY;
  int bWidth;
  int bHeight;
  int area;
  int rgb;
  
   Block(int x, int y, int bW, int bH, int i)
   {
     posX = x;
     posY = y;
     bWidth = bW;
     bHeight = bH;
     area = size * size;
     rgb = i;

   }
 
 void draw()
 {
   if(state == 1)
   {
     if(rgb%2 == 0)
     {
       fill(color( random(0,255), random(0,255), random(0,255), random(0,255)));
       rectMode(CORNER);
       rect(posX, posY, bWidth, bHeight);  
     }
     else
     {
       fill(200);
       rectMode(CORNER);
       rect(posX, posY, bWidth, bHeight);  
     }
   }
 }
 
  void invisible(String bi)
  {
    if(bi == "visible" && rgb%2 != 0){
     fill(#FFFFFF);
     rectMode(CORNER);
     rect(posX, posY, bWidth, bHeight);
     fill(200);
     state = 0;
    }else if(bi == "invisible"){
     state = 1; 
    }
  }
}














































  
