//class for traversable world and main exploratory portion of game
//includes sidebars and menu pieces on basic game screeen

class World
{
  int xpos = 400;
  int ypos = 400;
  boolean moving = false;
  boolean kp;
  int speed = 25;
  int frameDelay = 0;
  PImage[] pFrames = new PImage [13];
  int frame = 2;
  int f = 1;
  int dir = 0;
  void loadFrames () {
    pFrames [1] = loadImage("dleft.png"); //1-3 down
    pFrames [2] = loadImage("dstat.png"); 
    pFrames [3] = loadImage("dright.png");

    pFrames [4] = loadImage("rleft.png"); //4-6 right
    pFrames [5] = loadImage("rstat.png");
    pFrames [6] = loadImage("rright.png");

    pFrames [7] = loadImage("lleft.png"); //7-9 left
    pFrames [8] = loadImage("lstat.png"); 
    pFrames [9] = loadImage("lright.png");

    pFrames [10] = loadImage(""); //10-12 up
    pFrames [11] = loadImage("");
    pFrames [12] = loadImage("");
  }

  World()
  {
    loadFrames();
  }


  void display()
  {
    background(255);

    // display background
    // display world elements
    // display character  
    // display menu button
    // display health and exp
    // display
    move();
    player(xpos, ypos);
    moving = false;
  }

  void player(int x, int y)
  {
    int b; //frame buffer
    if (moving == true) {
      frame += f;
      if (frame >= 3)
        f = -1;
      else if (frame <= 1)
        f = 1;
      else 
      frame = 2;
    }
    switch (dir)
    {
    case 2 : 
      b = 0;
      break;
    case 1 : 
      b = 3;
      break;
    case -1 : 
      b = 6;
      break;
    case -2 : 
      b = 9;
    default : 
      b = 0; 
      frame = 2;
    }

    pFrames[b + frame].resize(80, 80);
    image(pFrames[b + frame], x, y);
    println(xpos+ " " + ypos + " " + frame +" "+ b + " " + moving);
  }





  void move () {
    if (kp) {
      int x = xpos;
      int y = ypos;
      if (frameCount >= frameDelay) { 
        if (right) { //right 1
          while (xpos <= x + speed){
            xpos++;
        }
          dir = 1;
        }
        else if (left) { // left -1
          while (xpos  >= x - speed){
            xpos--;
        }
          dir = -1;
        }
        else if (down) { //down 2
          while (ypos <= y + speed){
            ypos++;
        }
          dir = 2;
        }
        else if (up) {// up -2
         while (ypos >= y - speed){
            ypos--;
        }
          dir = -2;
        }
        moving = true;
        frameDelay = frameCount + 10;
      }
    }
  }
}