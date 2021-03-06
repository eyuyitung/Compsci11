//class for traversable world and main exploratory portion of game
//includes sidebars and menu pieces on basic game screeen

class World
{
  boolean gracePeriod;
  int encounterPer;
  int encounterVal = (int)random(1, 20);
  int steps = 0;
  int xpos = 480;
  int ypos = 440;
  boolean moving = false;
  boolean kp; // key pressed
  boolean mKey; // movement key currently pressed
  boolean inGameMenu = false; // in game menu
  boolean mr; // mouse released
  boolean inventory; // if true will bring up inventory screen
  boolean stats; 
  boolean options;
  boolean exit; // will exit to main menu
  int floor = 1; 
  int room = 45; // room numbers are row / column ex. 45 = row 4, col 5 (see drawings for map) 
  int speed = 10;
  int sprint = 20;
  int frameDelay = 0;
  PImage[] pFrames = new PImage [13];
  PImage[] rImages = new PImage [15];
  PFont [] igFonts = new PFont [5];
  int frame = 2;
  int f = 1;
  int dir = 0;
  int [] c = {480, 110, 960, 430, 480, 750, 0, 430}; // door image coordinates Clockwise order beginning at top
  boolean [] dp = new boolean[4]; //door position array 0 = top 1 = right 2 = bottom 3 = left 

  //menu hitboxes

  int[] mIvtryx = {810, 945, 945, 810};
  int[] mIvtryy = {135, 135, 160, 160};
  Polygon mInventory = new Polygon(mIvtryx, mIvtryy, 4);
  int[] menux = {890, 970, 970, 890};
  int[] menuy = {10, 10, 50, 50};
  Polygon menu = new Polygon(menux, menuy, 4);

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

    rImages[0] = loadImage("HoleDoorup.png"); //top door
    rImages[1] = loadImage("HoleDoorright.png");//right door 
    rImages[2] = loadImage("HoleDoordown.png"); //bottom door
    rImages[3] = loadImage("HoleDoorleft.png"); // left door
    rImages[4] = loadImage("StockRoom.png"); // background
    rImages[5] = loadImage("wall.jpg"); //
  }







  World()
  {
    loadFrames();
    loadRoom();
    //initFont();
  }

  void display()
  {

    playerEncounter();
    println(steps);
    backDrop(); // display background
    info(); // display health and exp
    grid();
    room(); // display world elements
    if (inGameMenu == false)
      move();
    player(xpos, ypos);

    igMenu();
    // display character
    moving = false;
    mr = false;
  }

  void playerEncounter()
  {
    if (steps < 50)
      gracePeriod = true;
    else 
    gracePeriod = false;
    if (encounterPer == encounterVal && encounter == false)
    {
      encounter = true; 
      steps = 0;
      aDelay = frameCount + 2*fr;
      for (int i = 0; i < enemy.length; i++)
      {
        enemy[i] = new Entity(1, i);
      }
    }
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

    pFrames[b + frame].resize(40, 60);
    image(pFrames[b + frame], x, y);
    println(xpos+ " " + ypos +  " " + encounterPer + " " + encounterVal  + " " + encounter + " " + gracePeriod);
  }
  void grid() {
    stroke(0);
    for (int i = 40; i <= width - 40; i += 40) {
      line(i, 150, i, height-50);
    }
    for (int i = 150; i <= height- 50; i += 40) {
      line(40, i, width-40, i);
    }
    ellipse(xpos, ypos, 10, 10);
  }





  void move () {
    if (frameCount >= frameDelay) {       
      if (shift)
        speed = sprint;
      else 
      speed = 10;
      if (mKey) {
        int x = xpos;
        int y = ypos;
        if (right) { //right 1
          if (frameCount >= frameDelay) {
            if (x + speed >= width - 80)
              xpos = width - (80 + speed);
            xpos += speed;
            dir = 1;
          }
        } else if (left) { // left -1
          if (x - speed <= 40) 
            xpos = 40 + speed; 
          xpos -= speed;  
          dir = -1;
        } else if (down) { //down 2
          if (y + speed >= height - 110)
            ypos = height - (110 + speed);
          ypos += speed;
          dir = 2;
        } else if (up) { // up -2
          if (y - speed < 120)
            ypos = 120 + speed;
          ypos -= speed;
          dir = -2;
        }
        moving = true;
        frameDelay = frameCount + 6;
        steps++;
        if (gracePeriod == false) 
          encounterPer = (int)random(1, 20);
      }
    }
  }

  void igMenu() {
    int [] spacing = new int [5];
    int j = 0;  
    for (int i = 160; i < 800; i += 128) {
      spacing [j] = i;
      j++;
    }
    if (esc || mr && menu.contains(mx, my))
      inGameMenu = true;
    if (inGameMenu) {

      fill(100);
      stroke(0);
      rect(800, 120, 200, 660, 5);
      fill(255);
      textAlign(LEFT);
      textSize(30);
      text("Inventory", 810, spacing[0]);
      strokeWeight(3);
      stroke(255);
      line(810, spacing[0] + 5, 810 + textWidth("Inventory"), spacing [0] +5);
      if (mr) {
        if (mInventory.contains(mx, my))
          inventory = true; //inventory screen
      }
      text("Stats", 810, spacing[1]);
      line(810, spacing[1] + 5, 810 + textWidth("Stats"), spacing [1] +5);
      if (mr) {
        //if (mStats.contains(mx, my))
        stats = true; //inventory screen
      }
      text("Options", 810, spacing[2]);
      line(810, spacing[2] + 5, 810 + textWidth("Options"), spacing [2] +5);
      if (mr) {
        // if (mOptions.contains(mx, my))
        options = true; //inventory screen
      }
      text("Exit", 810, spacing[3]);
      line(810, spacing[3] + 5, 810 + textWidth("Exit"), spacing [3] +5);
      if (mr) {
        // if (mExit.contains(mx, my))
        exit = true; //inventory screen
      }





      strokeWeight(1);
      stroke(0);
      //all elements and mouse hitboxes
    }
    if (back)
      inGameMenu = false;
  }
  void backDrop() {
    rImages[4].resize(1000, 700);
    image(rImages[4], 0, 100);
    fill(50);
    rect(0, 0, width, 100);
    fill (255);




    //displaying of basic doors
    if (dp [0])
    {// top
      rImages[0].resize(40, 40);
      image (rImages[0], c[0], c[1]);
    }
    if (dp[1])
    { //right
      rImages[1].resize(40, 40);
      image (rImages[1], c[2], c[3]);
    }
    if (dp[2])
    { //bottom
      rImages[2].resize(40, 40);
      image (rImages[2], c[4], c[5]);
    }
    if (dp[3])
    { //left
      rImages[3].resize(40, 40);
      image (rImages[3], c[6], c[7]);
    }
  }


  void info() {


    fill(200);
    rect(890, 10, 80, 40); // menu button box
    textAlign(LEFT);
    textSize(25);
    fill(0);
    text("Menu", 895, 45);
    noStroke();
    fill(255);
    textAlign(RIGHT);
    textSize(16);
    text("Player Health  :", 200, 20);
    rect(215, 7, 400, 15);
    fill(255, 0, 0);
    //rect(215, 7, 400 * (player[0].health / 400),15);
    fill(255);
    text("Ally Health :", 200, 45);
    rect(215, 32, 400, 15);
    fill(255, 0, 0);
    //rect(215, 7, 400 * (player[1].health / 400),15);
    fill(255);
    text("XP :", 200, 96);

    rect (215, 82, 600, 15);
    text("Keys :", 200, 70);
    text(items.keys, 215, 70); 
    stroke(0);
    fill(255);
  }
  void room() { // room # system working like coordinates 24 = row 2 column 4
    checkDoor();
    dp [0] = dp [1] = dp [2] = dp [3] = false;
    if (floor == 1)
    {
      switch (room)
      {

      case 11 : //end room
        dp [1] = dp [2] = true; 
        break;
      case 12 :
        dp [1] = dp [2] = dp [3] = true;
        break;
      case 13 :
        dp [3] = true;
        break;
      case 14 :
        dp [2] = true;
        break;
      case 21 :
        dp [0] = true;
        break;
      case 22 :
        dp [0] = dp [1] = true;
        break;
      case 23 :
        dp [1] = dp [2] = dp [3] = true;
        break;
      case 24 :
        dp [0] = dp [1] = dp [2] = dp [3] = true;
        break;
      case 25 :
        dp [1] = dp [2] = dp [3] = true;
        break;
      case 26 :
        dp [3] = true;
        break;
      case 33 :
        dp [0] = dp [1] = true;
        break;
      case 34 :
        dp [0] = dp [1] = dp [2] = dp [3] = true;        
        break;
      case 35:
        dp [0] = dp [3] = true;
        break;
      case 44 :
        dp [0] = dp [1] = true;
        break;
      case 45 : // starting room
        dp [3] = true;
        break;
      default :
        background(255);
      }
    } else if (floor == 2)
    {
      switch (room)
      {
      case 13 :
        dp [1] = dp [2] = true;
        break;
      case 14 :
        dp [1] = dp [3] = true;
        break;
      case 15 :
        dp [2] = dp [3] = true;
        break;
      case 21 :
        dp [1] = dp [2] = true;
        break;
      case 22 :
        dp [1] = dp [3] = true;
        break;
      case 23 :
        dp [0] = dp [2] = dp [3] = true;
        break;
      case 24 :
        dp [1] = true;
        break;
      case 25 :
        dp [0] = dp [3] = true;
        break;
      case 31 :
        dp [0] = dp [1] = dp [2] = true;
        break;
      case 32 :
        dp [1] = dp [3] = true;
        break;
      case 33 :
        dp [0] = dp [1] = dp [2] = dp [3] = true;
        break;
      case 34 :
        dp [3] = true;
        break;
      case 41 :
        dp [0] = true;
        break;
      case 43 :
        dp [0] = true;
        break;
      default :
        background(255);
      }
    }
  }
  void inventory() {
  }

  void checkDoor() {
    if (room > 10 && room < 50)
    {
      if (dp[0]) {
        if (xpos >= 460 && xpos <= 520 && ypos == 120 && up) {
          room -= 10;
          ypos = 690;
          down = false;
        }
      }
      if (dp[1]) {
        if (xpos == 920 && ypos >= 380 && ypos <= 420 && right) {
          room += 1;
          xpos = 40;
          left = false;
        }
      }
      if (dp[2]) {
        if (xpos >= 460 && xpos <= 520 && ypos == 690 && down) {
          room += 10;
          ypos = 120;
          up = false;
        }
      }
      if (dp[3]) {
        if (xpos == 40 && ypos >= 380 && ypos <= 420 && left) {
          room -= 1;
          xpos = 920;
          right = false;
        }
      }
    }
  }
}

/*
void backDrop() {
 rImages[1].resize(1000, 700);
 image(rImages[1], 0, 100);
 fill(50);
 rect(0, 0, width, 100);
 fill (255);
 textSize(16);
 text("Player Health  : ____________________________", 200, 20);
 for (int i = 1; i <= 2; i++)
 text("Party " + i + " Health :___________________________", 200, 20 + 25*i);
 text("EXP : ===============================================================", 25, 96);
 text("Keys : " + items.keys, 25, 60);
 }*/