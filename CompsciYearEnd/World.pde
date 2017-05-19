//class for traversable world and main exploratory portion of game
//includes sidebars and menu pieces on basic game screeen

class World
{
  int xpos = 500;
  int ypos = 450;
  boolean moving = false;
  boolean kp; // key pressed
  boolean mKey; // movement key currently pressed
  boolean igMenu; // in game menu
  int floor;
  int room;
  int speed = 10;
  int sprint = 15;
  int frameDelay = 0;
  PImage[] pFrames = new PImage [13];
  PImage[] rImages = new PImage [15];
  int frame = 2;
  int f = 1;
  int dir = 0;
  int [] c = {480, 110, 960, 430, 480, 750, 0, 430}; // door image coordinates Clockwise order beginning at top
  boolean [] dp = new boolean[4]; //door position array 0 = top 1 = right 2 = bottom 3 = left 
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
    rImages[2] = loadImage("HoleDoor.png");
  }

  World()
  {
    loadFrames();
    loadRoom();
  }


  void display()
  {
    backDrop();
    info();
    grid();
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

    pFrames[b + frame].resize(60, 60);
    image(pFrames[b + frame], x, y);
    println(xpos+ " " + ypos + " " + frame +" "+ b + " " + dir);
  }
  void grid() {
    stroke(0);

    for (int i = 40; i <= width - 40; i += 40) {
      line(i, 150, i, height-50);
    }
    for (int i = 150; i <= height- 50; i += 40) {
      line(40, i, width-40, i);
    }
  }





  void move () {
    if (kp) {
      if (frameCount >= frameDelay) {       
        if (shift)
          speed = sprint;
        else 
        speed = 10;
        if (mKey) {
          int x = xpos;
          int y = ypos;
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
      if (esc)
        igMenu = true;
    }
  }
  void backDrop() {
    rImages[1].resize(1000, 700);
    image(rImages[1], 0, 100);
    fill(50);
    rect(0, 0, width, 100);
    fill (255);


    if (dp[0])
    {// top
      rImages[2].resize(40, 40);
      image (rImages[2], c[0], c[1]);
    }
  }


  void info() {
    textSize(16);
    text("Player Health  : ____________________________", 200, 20);
    for (int i = 1; i <= 2; i++)
      text("Party " + i + " Health :___________________________", 200, 20 + 25*i);
    text("EXP : ===============================================================", 25, 96);
    text("Keys : " + items.keys, 25, 60);
  }
  void room() {
    if (floor == 1) {
      switch(room) // available doors determined by room #
      {
      case 5 : // only top
        dp [0] = true;
      case 13 : // top and left
        dp [3] = true;    
        break;
      case 4 : // only down
        dp [2] = true;
      case 1 : // right and down
      dp [1] = true:
        break;
      case 3 : //only left
      case 10 :
      case 15 :
        dp[3] = true;
      case 6 : // top and left
      case 11 :
      case 14 :
        dp [0] = true;
        break;
      case 2 : // right, bottom, left
      case 7 :
      case 9 :
        dp [1] = dp [2] = dp [3] = true;
      case 8 : // all
      case 12 :
        dp [0] = true;
        break;
      }
    } else if (floor == 2) {
      switch(room)
      {
      case 12 :
        dp[3] = true;
      case 2 :
      case 5 :
      case 10 :
        dp [1] = true;
      case 11 :
        dp [0] = dp [2] = true;
        break;
      case 13 :
      case 14 :
        dp [0] = true;
      case 8 :
        dp [3] = true;
      case 6 :  
        dp [2] = true;
        break;
      case 7 :
        dp [1] = true;
      case 1 :
      case 4 : 
        dp [2] = true; 
      case 9 : 
        dp [0] = true;
        break;
      case 3 :
        dp [2] = dp [3] = true;
        break;
    }
    }
  }