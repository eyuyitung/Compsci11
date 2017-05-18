//class for traversable world and main exploratory portion of game
//includes sidebars and menu pieces on basic game screeen

class World
{
  int xpos = 400;
  int ypos = 400;
  boolean moving = false;
  boolean kp;
  boolean mKey; // movement key currently pressed
  int speed = 10;
  int frameDelay = 0;
  PImage[] pFrames = new PImage [13];
  PImage[] rImages = new PImage [15];
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
    pFrames [10] = loadImage("uleft.png"); //10-12 up
    pFrames [11] = loadImage("ustat.png");
    pFrames [12] = loadImage("uright.png");
  }
  void loadRoom() {
    rImages[1] = loadImage("StockRoom.png");
  }

  World()
  {
    loadFrames();
    loadRoom();
  }


  void display()
  {
    backDrop();
    //grid();

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
      break;
    default : 
      b = 0; 
      frame = 2;
    }

    pFrames[b + frame].resize(80, 80);
    image(pFrames[b + frame], x, y);
    println(xpos+ " " + ypos + " " + frame +" "+ b + " " + dir);
  }
  void grid() {
    stroke(0);
    
    for (int i = 0; i <= width; i += 40) {
      line(i, 0, i, height);
    }
    for (int i = 0; i <= height; i += 40) {
      line(0, i, width, i);
    }
  }





  void move () {
    if (kp) {
      int x = xpos;
      int y = ypos;
      if (frameCount >= frameDelay) {       
        if (shift)
          speed = 15;
        else 
        speed = 10;
        if (mKey) {
          if (right) { //right 1
            if (x + speed >= width - 100)
              xpos = width - (100 + speed);
            xpos += speed;
            dir = 1;
          } else if (left) { // left -1
            if (x - speed <= 20) 
              xpos = 20 + speed; 
            xpos -= speed;  
            dir = -1;
          } else if (down) { //down 2
            if (y + speed >= height - 130)
              ypos = height - (130 + speed);
            ypos += speed;
            dir = 2;
          } else if (up) { // up -2
            if (y - speed < 120)
              ypos = 120 + speed;
            ypos -= speed;
            dir = -2;
          }
          moving = true;
          frameDelay = frameCount + 5;
        }
      }
    }
  }
  void backDrop() {
    rImages[1].resize(1000, 700);
    image(rImages[1], 0, 100);
    fill(50);
    rect(0,0,width,100);
    fill (255);
    textSize(16);
    text("Player Health  : ____________________________",200,20);
    for (int i = 1; i <= 2; i++)
      text("Party " + i + " Health :___________________________",200,20 + 25*i);
    text("EXP : ===============================================================",25,96);
    text("Keys : " + items.keys,25,60);
  }
}