/*declare array of objects*/
Block[] blocks;
Ball[] balls;

<<<<<<< HEAD
=======
StringList ballvisibility;
StringList blockvisibility;

>>>>>>> refs/remotes/origin/master
int amount = 10;
int size = 20;
int posX = 50;
int posY = 50;

int bW = 50;
int bH = 50;

float Area;
<<<<<<< HEAD
String[] bli = new String[amount];
String[] bi = new String[amount];

float sumAreaBall;
float sumAreaBlock;

void setup()
{
  size(600,600);
  //noStroke();
  blocks = new Block[amount]; /*create blocks array*/
  balls =new Ball[amount]; /*create balls array*/  
  
  for(int i = 0; i < amount; i++){
    balls[i] = new Ball(size, posX, posY * (i+1));/*create each ball's object*/
    bi[i] = "visible";    
    
    blocks[i] =  new Block(posX * 2, posY * (i+1), bW, bH); /*create each vlokc's object*/
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
        if(bli[i] == "visible"){
          bli[i] = "invisible";
        }else if(bli[i] == "invisible"){
          bli[i] = "visible";
        }
      }//block
      if(sqrt( sq(mouseX - balls[i].posX) + sq(mouseY - balls[i].posY) ) < balls[i].size/2){
        balls[i].invisible(bi[i]); 
        if(bi[i] == "visible"){
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
   float size;
   float area;
 
   float posX;
   float posY;
 
   Ball(float s, int x, int y)
   {
     size = s;
     posX = x;
     posY = y;
     area = 3.14 * size * size;
=======
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
>>>>>>> refs/remotes/origin/master
   }
 
   void draw()
   {
<<<<<<< HEAD
     if(state == 1){
       fill(200);
       ellipse(posX, posY, size, size);
     }
    }
   void invisible(String bi)
  {
    if(bi == "visible"){
     fill(#FFFFFF);
     ellipse(posX, posY, size, size);
     fill(200);
     state = 0;
    }else if(bi == "invisible"){
     state = 1; 
    }
  }
=======
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
>>>>>>> refs/remotes/origin/master
}

class Block
{
<<<<<<< HEAD
  int state = 1;
=======
>>>>>>> refs/remotes/origin/master
  int posX;
  int posY;
  int bWidth;
  int bHeight;
<<<<<<< HEAD
  int area;
=======
>>>>>>> refs/remotes/origin/master
   Block(int x, int y, int bW, int bH)
   {
     posX = x;
     posY = y;
     bWidth = bW;
     bHeight = bH;
<<<<<<< HEAD
     area = size * size;
=======
>>>>>>> refs/remotes/origin/master
   }
 
 void draw()
 {
<<<<<<< HEAD
   if(state == 1){
   fill(200);
   rectMode(CORNER);
   rect(posX, posY, bWidth, bHeight);  
   }
 }
 
  void invisible(String bi)
  {
    if(bi == "visible"){
     fill(#FFFFFF);
     rectMode(CORNER);
     rect(posX, posY, bWidth, bHeight);
     fill(200);
     state = 0;
    }else if(bi == "invisible"){
     state = 1; 
    }
  }
=======
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
>>>>>>> refs/remotes/origin/master
}
