//class for traversable world and main exploratory portion of game
//includes sidebars and menu pieces on basic game screeen

class World
{
  int xpos = 400;
  int ypos = 400;
  boolean moving = false;
  int speed = 20;
  int frameDelay = 0;
  PImage[] pFrames = new PImage [13];
  int frame = 2;
  int f = 1;

  void loadFrames () {
    pFrames [1] = loadImage("dleft.png");
    pFrames [2] = loadImage("dstat.png");
    pFrames [3] = loadImage("dright.png");
    /*
    pFrames [4] = loadImage("");
     pFrames [5] = loadImage("");
     pFrames [6] = loadImage("");
     pFrames [7] = loadImage("");
     pFrames [8] = loadImage(""); 
     pFrames [9] = loadImage("");
     pFrames [10] = loadImage("");
     pFrames [11] = loadImage("");
     pFrames [12] = loadImage("");
     */
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

    if (moving == true) {
      if (down == true) {
        frame += f;
        if (frame >= 3)
          f = -1;
        else if (frame <= 1)
          f = 1;
      }
      println(xpos+ " " + ypos + " " + frame + " " + f);
    } 

    image(pFrames[frame], x, y);
    pFrames[frame].resize(80, 80);
  }
  void move () {
    if (frameCount >= frameDelay) { 
      if (right) //right
        xpos += speed;
      if (left) // left
        xpos -= speed;
      if (down) //down
        ypos += speed;
      if (up)
        ypos -= speed;
      moving = true;
      frameDelay = frameCount + 10;
    }
  }
}