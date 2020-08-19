/*declare array of objects*/
Block[] blocks;

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
String[][] bi = new String[amount][amount];

float sumAreaBall;
float sumAreaBlock;

void setup()
{
  size(600,600);
  blocks = new Block[amount]; /*create blocks array*/
  /*balls =new Ball[amount]; /*create balls array*/  
  
  for(int i = 0; i < amount; i++){
    //balls[i] = new Ball(size, posX, posY * (i+1));/*create each ball's object*/
  /*  bi[i] = "visible";  */  
    
    blocks[i] =  new Block(posX * 2, posY * (i+1), bW, bH, amount, i); /*create each vlokc's object*/
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
    //balls[i].draw();/*show each ball*/
    blocks[i].draw(); /*show each block*/
    for(int j = 0; j < amount; j++){
      blocks[i].balls[j].draw();
    }

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
      for(int j = 0; j < amount; j++){
          if(sqrt( sq(mouseX - blocks[i].balls[j].posX) + sq(mouseY - blocks[i].balls[j].posY) ) < blocks[i].balls[j].size/2){
            blocks[i].balls[j].invisible(bi[i][j]); 
            if(bi[i][j] == "visible" && i%2 != 0){
              bi[i][j] = "invisible";
            }else if(bi[i][j] == "invisible"){
              bi[i][j] = "visible";
            }
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
    for(int i = 0; i < blocks.length; i++){
      for(int j = 0; j < amount; j++){
        if(bi[i][j] == "visible"){
          result += blocks[i].balls[i].area;
        }
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
  Ball[] balls; /*variable name*/
  
  int state = 1;

  int posX;
  int posY;
  int bWidth;
  int bHeight;
  int area;
  int rgb;
  int amount;
   Block(int x, int y, int bW, int bH,int amt,int i)
   {
     amount = amt;
     balls = new Ball[10]; /*create balls array*/  
     
     posX = x;
     posY = y;
     bWidth = bW;
     bHeight = bH;
     area = size * size;
     rgb = i;
     this.createBall();
     
   }
 void createBall(){
     int size = bWidth / amount; // rect_width / amount of ball 50/10
     int ballX;
     int ballY;
     int index = 0;
     for(int i = 0; i < amount / (amount/2); i++){ // 50/(50/2)  = 2
     
       for(int j = 0; j < amount / 2; j++){ //20 / 2 = 5
         ballX =  posX + (j * size) + size; // ((50) + (j* 10) + (5/10)
         ballY =  (posY + (i * size)) + (size); // 
         
         balls[index] = new Ball(size, ballX, ballY, i);/*create each ball's object*/
         index += 1;
         bi[i][j] = "visible";       
       }
     }
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
