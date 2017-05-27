class World
{
  boolean gracePeriod;
  int encounterPer;
  int encounterVal = (int)random(1, 20);
  int steps = 0;
  int xpos = 480;
  int ypos = 300;
  boolean boss = false;
  boolean moving = false;
  boolean kp; // key pressed
  boolean mKey; // movement key currently pressed
  boolean inGameMenu = false; // in game menu
  boolean mr; // mouse released
  boolean inventory; // if true will bring up inventory screen
  boolean stats; 
  boolean mute;
  boolean exit; // will exit to main menu
  boolean closed = true;
  boolean empty = false;
  int floor = 1; 
  int room = 45; // room numbers are row / column ex. 45 = row 4, col 5 (see drawings for map) 
  int speed = 10;
  int sprint = 20;
  int frameDelay = 0;
  int mDelay = 0;
  int bDelay = 0;
  int cDelay = 0;
  int eDelay = 0;
  PImage[] pFrames = new PImage [13];
  PImage[] rImages = new PImage [15];
  PFont [] igFonts = new PFont [5];
  int frame = 2;
  int f = 1;
  int dir = 0;
  int [] c = {480, 110, 960, 430, 480, 750, 0, 430}; // door image coordinates Clockwise order beginning at top
  boolean [] dp = new boolean[6]; //door position array 0 = top 1 = right 2 = bottom 3 = left 

  //menu hitboxes

  int[] mIvtryx = {810, 945, 945, 810};
  int[] mIvtryy = {135, 135, 160, 160};
  Polygon mInventory = new Polygon(mIvtryx, mIvtryy, 4);
  int[] menux = {890, 970, 970, 890};
  int[] menuy = {10, 10, 50, 50};
  Polygon menu = new Polygon(menux, menuy, 4);
  int [] statsx = {810, 880, 880, 810};
  int [] statsy = {260, 260, 295, 295};
  Polygon mStats = new Polygon(statsx, statsy, 4);
  int [] mutex = {810, 880, 880, 810};
  int [] mutey = {390, 390, 420, 420};
  Polygon mMute = new Polygon(mutex, mutey, 4);
  int [] exitx = {810, 860, 860, 810};
  int [] exity = {520, 520, 550, 550};
  Polygon mExit = new Polygon(exitx, exity, 4);


  //////////////////////////////////////////////////////////////////////////////////

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
    rImages[4] = loadImage("BossDoor.png");
    rImages[5] = loadImage("LadderDown.png");
    rImages[6] = loadImage("StockRoom.png");// background
    rImages[7] = loadImage("ClosedChest.png");
    rImages[8] = loadImage("OpenChest.png");
     rImages[9] = loadImage("boss.png");
  }

  //////////////////////////////////////////////////////////////////////////////////

  World()
  {
    loadFrames();
    loadRoom();
  }

  ////////////////// DISPLAY ////////////////////////////////////////////////////////////////

  void display()
  {
    playerEncounter();
    expLevelup();
    minibossFight();
    backDrop(); // display background
    info(); // display health and exp
    grid();
    room(); // display world elements
    if (inGameMenu == false && encounter == false)
      move();
    player(xpos, ypos); // display character
    igMenu(); // in game menu


    moving = false;
    mr = false;
  }

  //////////////////////////////////////////////////////////////////////////////////

  void playerEncounter()
  {
    if (boss == true){
      bossEncounter = true;
        if (xpos >= 440 && xpos <= 520 && ypos >= 360 && ypos <= 440){
          if (enter){
            encounter = true;
            if (muteMusic == false) {
              Player.pause();
              Player4.rewind();
              Player4.play();
            }
            enemy[0].health += 75;
            enemy[0].attack += 25;
            enemy[0].speed += 15;
            enemy[0].critChance += 10;
          }
        }     
    }      
    if (steps < 1)
      gracePeriod = true;
    else 
    gracePeriod = false;

    if (encounter == false && encounterPer == encounterVal && minibossEncounter == false)
    {
      encounter = true; 
      steps = 0;
      bDelay = frameCount + fr/4;
      for (int i = 0; i < enemy.length; i++)
      {
        index = (int)random(mobName.length);
        enemy[i] = new Entity(mobName[index], level, i, index, 0, 0, false);
        if (index == 1)
          enemy[i].x += 30;
        if (muteMusic == false) {
          Player.pause();
          Player2.rewind();
          Player2.play();
        }
      }

      enemy[0].x += 690;
      enemy[0].y += 235;

      enemy[1].x += 570;
      enemy[1].y += 235;

      enemy[2].x += 690;
      enemy[2].y += 350;

      enemy[3].x += 570;
      enemy[3].y += 350;
    }
    if (encounter == false && encounterPer == encounterVal && minibossEncounter == true)
    {
      encounter = true; 
      steps = 0;
      bDelay = frameCount + fr/4;
      index = (int)random(mobName.length);
      enemy[0] = new Entity(mobName[index], level, 0, index, 0, 0, false);
      enemy[0].health += 50;
      enemy[0].attack += 20;
      enemy[0].defence += 20;
      enemy[0].speed += 10;
      enemy[0].critChance += 10;
      
      enemy[0].x += 670;
      enemy[0].y += 280;
    }
    
  }


  void minibossFight()
  {
    if (items.inv[4] >= 5 && minibossCount == 0)
    {
      minibossEncounter = true;
    } else 
    {
      minibossEncounter = false;
    }
  }

  //////////////////////////////////////////////////////////////////////////////////


  void expLevelup()
  {
    for (int i = 1; i <= 10; i++)
    {
      if (player[0].exper > (50 + i * 50) && level == i)
      {
        level = i + 1;
        player[0].exper = 0;
        statpoints +=5;
      }
    }
  }

  //////////////////////////////////////////////////////////////////////////////////

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
    //println(xpos+ " " + ypos +  " "/* +  + " "*/ + encounter + " " + gracePeriod);
  }

  //////////////////////////////////////////////////////////////////////////////////

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

  //////////////////////////////////////////////////////////////////////////////////

  void move () {
    if (screen == 5) {
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
  }

  //////////////////////////////////////////////////////////////////////////////////  

  void igMenu() {
    int [] spacing = new int [5];
    int j = 0;  
    for (int i = 160; i < 800; i += 128) {
      spacing [j] = i;
      j++;
    }
    if (!inGameMenu && (esc && frameCount > eDelay || mr && menu.contains(mx, my))) {
      inGameMenu = true;
      eDelay = frameCount + fr/2;
      //println(eDelay + " " + frameCount);
    }
    if (inGameMenu) {
      fill(100);
      stroke(0);
      rect(800, 120, 200, 660, 5);
      fill(255);
      textAlign(LEFT);
      textSize(30);

      strokeWeight(3);
      stroke(255);

      //all elements and mouse hitboxes
      text("Inventory", 810, spacing[0]);
      line(810, spacing[0] + 5, 810 + textWidth("Inventory"), spacing [0] +5);
      text("Stats", 810, spacing[1]);
      line(810, spacing[1] + 5, 810 + textWidth("Stats"), spacing [1] +5);  
      text("Mute", 810, spacing[2]);
      line(810, spacing[2] + 5, 810 + textWidth("Mute"), spacing [2] +5);   
      text("Exit", 810, spacing[3]);
      line(810, spacing[3] + 5, 810 + textWidth("Exit"), spacing [3] +5);
      if (mr)
      {
        if (!inventory && !stats && !mute && !exit)
          mDelay = frameCount + fr/2;        
        if (mInventory.contains(mx, my)) 
          inventory = true; //inventory screen
        else if (mStats.contains(mx, my))
          stats = true; //stats screen
        else if (mMute.contains(mx, my))
          mute = true; //mute button
        else if (mExit.contains(mx, my))
          exit = true; //are you sure screen
      }

      if (inventory)
        inventory();
      else if (stats)
        screen = 1;// stats shit
      else if (mute)
        mute();
      else if (exit)
        exit();
      strokeWeight(1);
      stroke(0);
      textSize(16);

      if (back || (esc && frameCount > eDelay || mr && menu.contains(mx, my) && frameCount > eDelay)) {
        inGameMenu = false;
        eDelay = frameCount + fr/2;
        println(eDelay + " " + frameCount);
      }
    }
  }

  //////////////////////////////////////////////////////////////////////////////////

  void backDrop() {
    strokeWeight(1);
    rImages[6].resize(1000, 700);
    image(rImages[6], 0, 100);
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
    if (dp[4])
    {//stairs down to next floor
      rImages[5].resize(60, 60);
      image (rImages[5], 470, 440);
    }
    if (dp[5])
    {//boss door
      rImages[4].resize(60, 60);
      image (rImages[4], 470, c[5]);
    }
  }

  //////////////////////////////////////////////////////////////////////////////////

  void info() {
    fill(200);
    rect(890, 10, 80, 40); // menu button box
    textAlign(LEFT);
    textSize(16);
    text(player[0].health + "/" + playerMax[0].health + " hp", 630, 20);
    text(player[1].health + "/" + playerMax[1].health + " hp", 630, 45);
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

    if (player[0].health >=0)
      rect(215, 7, 400 * (1.0*player[0].health/playerMax[0].health), 15);
    fill(255);
    text("Ally Health :", 200, 45);
    rect(215, 32, 400, 15);
    fill(255, 0, 0);
    if (player[1].health >=0)
      rect(215, 32, 400 * (1.0*player[1].health/playerMax[1].health), 15);
    fill(255);
    text("XP :", 200, 96);
    text("Lvl : " + level, 665, 96);
    rect (215, 82, 400, 15);
    rect(215, 82, 400 * (1.0*player[0].exper/ (50 + level* 50)), 15);
    text("Keys :", 200, 70);
    text(items.inv[4], 215, 70); 
    stroke(0);
    fill(255);
  }

  //////////////////////////////////////////////////////////////////////////////////

  void room() { // room # system working like coordinates 24 = row 2 column 4
    checkDoor();

    dp [0] = dp [1] = dp [2] = dp [3] = dp[4] = dp[5] = false;
    if (floor == 1)
    {
      switch (room)
      {

      case 11 : //end room

        dp [1] = dp [2] = dp[4] = true; 
        break;
      case 12 :
        dp [1] = dp [2] = dp [3] = true;
        break;
      case 13 :
        chest();
        dp [3] = true;
        break;
      case 14 :
        chest();
        dp [2] = true;
        break;
      case 21 :
        chest();
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
        chest();
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
      case 15 : // start room
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
        chest();
        dp [1] = true;
        break;
      case 25 :
        dp [0] = dp [3] = true;
        break;
      case 31 :
        dp [0] = dp [1] = dp[5] = true;
        break;
      case 32 :
        dp [1] = dp [3] = true;
        break;
      case 33 :
        dp [0] = dp [1] = dp [2] = dp [3] = true;
        break;
      case 34 :
        chest();
        dp [3] = true;
        break;
      case 41 : // boss room
        boss = true;
        break;
      case 43 :
        chest();
        dp [0] = true;
        break;
      default :
        background(255);
      }
    }
  }

  //////////////////////////////////////////////////////////////////////////////////

  void checkDoor() {
    if (room > 10 && room < 50)
    {
      if (dp[0]) { // left
        if (xpos >= 460 && xpos <= 520 && ypos == 120 && up) {
          room -= 10;
          ypos = 690;
          down = false;
          closed = true; //chest
        }
      }
      if (dp[1]) { // right
        if (xpos == 920 && ypos >= 380 && ypos <= 420 && right) {
          room++;
          xpos = 40;
          left = false;
          closed = true; //chest
        }
      }
      if (dp[2]) { // down
        if (xpos >= 460 && xpos <= 520 && ypos == 690 && down) {
          room += 10;
          ypos = 120;
          up = false;
          closed = true; //chest
        }
      }
      if (dp[3]) { // left
        if (xpos == 40 && ypos >= 380 && ypos <= 420 && left) {
          room--;
          xpos = 920;
          right = false;
          closed = true; //chest
        }
      }
      if (dp[4]) { // stairs down
        if (xpos >= 440 && xpos <= 520 && ypos >= 360 && ypos <= 440 && room == 11) {
          floor++;
          room = 15;
          xpos = 480;
          ypos = 440;
        }
      }
      if (dp[5]) { // boss door
        if (items.inv[5] >= 1) { // if player has boss key
          if (xpos >= 460 && xpos <= 520 && ypos == 690 && down) {
            room += 10;
          }
        } else 
        textSize(22);
        textAlign(CENTER, CENTER);
        text("Boss Key Req.", 500, 750);
        textSize(16);
        textAlign(LEFT, BOTTOM);
      }
    }
  }

  //////////////////////////////////////////////////////////////////////////////////

  void chest()
  {
    int amount = (int)random(6);
    int item; 
    int state = 7;
    if (items.inv[4] > 0) {
      if (xpos >= 440 && xpos <= 520 && ypos >= 360 && ypos <= 440) {
        if (enter) { 
          closed = false;
          if (!muteMusic) {
            Player.pause();
            Player3.play();
            Player.rewind();
            Player.play();
          }
        }
      }
      if (closed)
        state = 7;
      else {
        state = 8;
        if (empty == false) {
          for (int i = 1; i <= amount; i++) {
            item = (int)random(5);
            items.inv[item] += 1;
            empty = true;
          }
        }
      }
    }
    rImages[state].resize(50, 40);
    image(rImages[state], 475, 430);
  }





  //////////////////////////////////////////////////////////////////////////////////

  void inventory() {

    fill(170);
    rect(180, 120, 400, 400);
    textAlign(CENTER, TOP);
    textSize(30);
    fill(255);
    text("Inventory", 380, 140);
    // 0 = attack pot, 1 = defence pot, 2 = speed pot, 3 = health pot, 4 = keys, 5 = boss key
    String [] mItems = new String [6];
    mItems [0] = ("Strength Potion : " + items.inv[0]);
    mItems [1] = ("Resistance Potion : " + items.inv[1]);
    mItems [2] = ("Swiftness Potion : " + items.inv[2]);
    mItems [3] = ("Health Potion : "+ items.inv[3]);
    mItems [4] = ("Keys : " + items.inv[4]); 
    mItems [5] = ("Boss Key : " + items.inv[5]);
    textAlign(LEFT);
    textSize(20);
    strokeWeight(2);
    for (int i = 0; i < mItems.length; i++) {
      text(mItems[i], 220, 225 + 46*i);
      line (220, 230 + 46*i, 220 + textWidth(mItems[i]), 230 + 46*i);
    }
    textSize(16);
    strokeWeight(1);
    if (esc || mInventory.contains(mx, my) && mr && frameCount > mDelay)
      inventory = false;
  }

  //////////////////////////////////////////////////////////////////////////////////

  void mute() 
  {
    if (muteMusic == false && mMute.contains(mx, my) && mr && frameCount > cDelay) {
      muteMusic = true; 
      Player.pause(); 
      Player.rewind();
      cDelay = frameCount + fr/2;
    }
    if (muteMusic == true && mMute.contains(mx, my) && mr && frameCount > cDelay) {
      muteMusic = false; 
      Player.loop(); 
      cDelay = frameCount + fr/2;
    }
  }

  //////////////////////////////////////////////////////////////////////////////////

  void exit()
  {
    int [] yesx = {405, 480, 480, 405};
    int [] yesy = {370, 370, 445, 445};
    Polygon mYes = new Polygon(yesx, yesy, 4);
    int [] nox = {520, 595, 595, 520};
    int [] noy = {370, 370, 445, 445};
    Polygon mNo = new Polygon(nox, noy, 4);

    fill(234, 88, 88);
    rect(375, 300, 250, 140);
    fill(255);
    rect(405, 370, 75, 50);  
    rect(520, 370, 75, 50);

    textAlign(CENTER);
    textSize(30);
    text("Are You Sure?", 500, 350);
    fill(0);
    text("Yes", 443, 410);
    text("No", 557, 410);
    if (mr && (mExit.contains(mx, my) || mNo.contains(mx, my)) && frameCount > mDelay) 
      exit = false;
    if (mr && mYes.contains(mx, my)) {
      exit();
    }
    stroke(255);
    fill(255);
  }
}