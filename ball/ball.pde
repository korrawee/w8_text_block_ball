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
void setup()
{
  size(600,600);
  blocks = new Block[amount]; /*create blocks array*/
  balls =new Ball[amount]; /*create balls array*/  
  ballvisibility = new StringList();
  blockvisibility = new StringList();

}
void draw()
{
  float sumArea = 0;
  float sumAreaBlock = 0;
  background(#FFFFFF);
  for(int i = 0; i < blocks.length; i++)
  {    
    int tmpBallX = posX + (i * (size*2));
    balls[i] = new Ball(size, tmpBallX, posY + bH);/*create each ball's object*/
    balls[i].draw();/*show each ball*/
    ballvisibility.append("visible");
    String[] bi = ballvisibility.array();
    if(mousePressed && bi[i] == "visible")
    {
      balls[i].invisible();
      ballvisibility.set(i,"invisible") ;
    }
    else if(mousePressed && bi[i] == "invisible")
    {
      balls[i].draw();
      ballvisibility.set(i,"visible");
    }
    if(bi[i] == "invisible")
    {
     sumArea += balls[i].getArea();
    }
    else 
    {
    }
    int tmpBlockX = posX + (i * bW); 
     blocks[i] =  new Block(tmpBlockX, posY, bW, bH); /*create each vlokc's object*/
     blocks[i].draw(); /*show each block*/
     blockvisibility.append("visible");
     String[] bli = blockvisibility.array();
     if(mousePressed && bli[i] == "visible")
     {
       blocks[i].invisible();
       blockvisibility.set(i,"invisible") ;
     }
     else if(mousePressed && bli[i] == "invisible")
     {
       blocks[i].draw();
       blockvisibility.set(i,"visible") ;
     }
    if(bli[i] == "invisible")
     {
       sumAreaBlock += blocks[i].getArea();
     }
     else
     {
     }
  }
  println("sum of ball's areas = " + sumArea);
  println("sum of block's areas = " + sumAreaBlock );
  noLoop();
  fill(201,201,201);     /// show area on widget
  rect(300,350,360,100);
  fill(0);
  text(("sum of block's areas = " + sumAreaBlock ),200,350);
  text(("sum of ball's areas = " + sumArea ),200,370);
}
void mousePressed()
{
  redraw();
}
class Ball
{
   float size;
 
   int position_x;
   int position_y;
 
   Ball(float s, int posX, int posY)
   {
     size = s;
     position_x = posX;
     position_y = posY;
   }
 
   void draw()
   {
     fill(color( random(0,255), random(0,255), random(0,255), random(0,255)));
     ellipse(position_x, position_y, size, size);
    }
   void invisible()
   {
     fill(#FFFFFF);
     ellipse(position_x, position_y, size, size);
   }
   float getArea()
   {
     float area = 3.14 * size * size;
     return area;
   }
}

class Block
{
  int posX;
  int posY;
  int bWidth;
  int bHeight;
   Block(int x, int y, int bW, int bH)
   {
     posX = x;
     posY = y;
     bWidth = bW;
     bHeight = bH;
   }
 
 void draw()
 {
   fill(color( random(0,255), random(0,255), random(0,255), random(0,255)));
   rectMode(CENTER);
   rect(posX, posY, bWidth, bHeight);  
 }
  void invisible()
  {
   fill(#FFFFFF);
   rectMode(CENTER);
   rect(posX, posY, bWidth, bHeight);  
  }
  float getArea()
  {
     float area = size * size;
     return area;
   }
}
