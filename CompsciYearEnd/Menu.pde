class Menu
{

  boolean mr; 
  int frameDelay = 0;
  PImage pic1, pic2, pic3, pic4, pic5, pic6, pic7, pic8;
  PImage [] frames = new PImage [9];

  
  int count2 = 0;



  //Menu button hitboxes
  int[] startx = {750, 950, 950, 750};
  int[] starty = {500, 500, 550, 550};
  Polygon start = new Polygon(startx, starty, 4);
  int[] helpx = {725, 815, 815, 725};
  int[] helpy = {600, 600, 650, 650};
  Polygon help = new Polygon(helpx, helpy, 4);
  int[] configx = {700, 820, 820, 700};
  int[] configy = {700, 700, 750, 750};
  Polygon config = new Polygon(configx, configy, 4);

  //Character selection button hitboxes
  int[] csstartx = {900, 965, 965, 900};
  int[] csstarty = {760, 760, 790, 790};
  Polygon csstart = new Polygon(csstartx, csstarty, 4);
  int[] csbackx = {35, 105, 105, 35};
  int[] csbacky = {755, 755, 785, 785};
  Polygon csback = new Polygon(csbackx, csbacky, 4);

  //Shorter Character selection stats button htiboxes code
  int[] hpattdefspdsubx = {688, 667, 688};
  int[] hpattdefspdaddx = {759, 780, 759};
  int[] healthsubaddy = {272, 292, 311};
  int[] attacksubaddy = {401, 421, 440};
  int[] defencesubaddy = {530, 550, 569};
  int[] speedsubaddy = {659, 679, 698};
  Polygon healthsub = new Polygon(hpattdefspdsubx, healthsubaddy, 3);
  Polygon healthadd = new Polygon(hpattdefspdaddx, healthsubaddy, 3);
  Polygon attacksub = new Polygon(hpattdefspdsubx, attacksubaddy, 3);
  Polygon attackadd = new Polygon(hpattdefspdaddx, attacksubaddy, 3);
  Polygon defencesub = new Polygon(hpattdefspdsubx, defencesubaddy, 3);
  Polygon defenceadd = new Polygon(hpattdefspdaddx, defencesubaddy, 3);
  Polygon speedsub = new Polygon(hpattdefspdsubx, speedsubaddy, 3);
  Polygon speedadd = new Polygon(hpattdefspdaddx, speedsubaddy, 3);
  int[]weaponsSelx = {223, 223, 202};
  int[]weaponsSely = {157, 196, 177};
  Polygon weaponSel = new Polygon(weaponsSelx, weaponsSely, 3);
  int[]weaponsSelx2 = {325, 325, 346};
  int[]weaponsSely2 = {157, 196, 177};
  Polygon weaponSel2 = new Polygon(weaponsSelx2, weaponsSely2, 3);
  int[]armorSelx = {223, 223, 202};
  int[]armorSely = {235, 274, 255};
  Polygon armorSel = new Polygon(armorSelx, armorSely, 3);
  int[]armorSel2x = {325, 325, 346};
  int[]armorSel2y = {235, 274, 255};
  Polygon armorSel2 = new Polygon(armorSel2x, armorSel2y, 3);



  void loadPictures()
  {
    frames [1] = loadImage("1.gif");
    frames [2] = loadImage("2.gif");
    frames [3] = loadImage("3.gif");
    frames [4] = loadImage("4.gif");
    frames [5] = loadImage("5.gif");
    frames [6] = loadImage("6.gif");
    frames [7] = loadImage("7.gif");
    frames [8] = loadImage("8.gif");
  }


  Menu () {
    loadPictures();
  }




  //////////////////////////////////////////////////////////////////////////////////

  void display()
  {
    mouseKey();

    if (weaponCount > 4)
    {
      weaponCount = 0;
    } else if (weaponCount < 0)
    {
      weaponCount = 4;
    }
    
    if (count2 > 2)
    {
      count2 = 0;
    }
    else if (count2 < 0)
    {
      count2 = 2;
    }

    if (screen == 0) 
    {
      top();
      keyControl();
    } else if (screen == 1) {
      stats();
    } else if (screen == 2) {
      help();
    } else if (screen == 3) {
      config();
    }
  }

  ////////////////////////////////////////////////////////////////////////////////

  void mouseKey()
  {
    if (this.mr == true) 
    {
      if (screen == 0 && start.contains(mx, my))
        screen = 1;
      if (screen == 0 && help.contains(mx, my))
        screen = 2;      
      if (screen == 0 && config.contains(mx, my))
        screen = 3;
      if (screen == 1 && csstart.contains(mx, my))
      {
        player[0].attack += weaponSelection[weaponCount].attack;
        player[0].speed +=  weaponSelection[weaponCount].speed + armorSet[count2].speed;
        player[0].stamina = weaponSelection[weaponCount].stamina; 
        player[0].critChance = weaponSelection[weaponCount].critChance;
        player[0].critMult = weaponSelection[weaponCount].critMultiplyer;
        player[0].accuracy = weaponSelection[weaponCount].accuracy + armorSet[count2].accuracy;
        player[0].blockChance = weaponSelection[weaponCount].blockChance;
        player[0].health += armorSet[count2].health;
        
        if(weaponCount >= 0 && weaponCount <= 2)
        {
          player[0].defence += shield[0].defence;
          player[0].blockChance += shield[0].blockChance;
        }
        
        if(armorSet[count2].setNumber == 0)
        {
          player[0].runChance += 10;
        }
        else if(armorSet[count2].setNumber == 1)
        {
          player[0].attack = round(player[0].attack * 1.15); 
        }
        else if(armorSet[count2].setNumber == 2)
        {
          player[0].defence = round(player[0].defence * 1.5);
        }
        

        screen = 5;

        for (int j = 0; j < player.length; j++)
        {
          playerMax[j] = player[j];
         
        }
        
        screen = 5;
        
      }
      if (screen == 1 && csback.contains(mx, my))
      {
        screen = 0;
        maxstat = 30;
        statpoints = 30;

        player[0].health = 50;
        player[0].attack = 5;
        player[0].defence = 5;
        player[0].speed = 5;
      }
      if (screen == 1 && weaponSel.contains(mx, my))
      {
        weaponCount--;
      } else if (screen == 1 && weaponSel2.contains(mx, my))
      {
        weaponCount++;
      }
      if(screen == 1 && armorSel.contains(mx, my))
      {
        count2--;
      }
      else if(screen == 1 && armorSel2.contains(mx, my))
      {
        count2++;
      }
    }
    //allowing menu selecion by keyboard controls
    if (enter == true) {
      if (screen == 0) 
      {
        if (selection == 1)
          screen = 1;
        else if (selection == 2)
          screen = 2;
        else if (selection == 3)
          screen = 3;
      }
      else if (screen == 1 && statpoints == 0)
      {
        screen = 5;         
      }
    }
    if (back == true)
    {
      if (screen == 1)
        screen = 0;
      if (screen == 2)
        screen = 0;
      if (screen == 3)
        screen = 0;
    }
  }

  //////////////////////////////////////////////////////////////////////////////////

  void top()
  {

    // if (frameCount % (fr/8) == 0)
    image(frames[(frameCount / (fr/8)) % (frames.length - 1) + 1 ], 0, 0);

    textFont(startFont);
    textAlign(TOP, TOP);
    //fill(0, 102, 153, 51);
    text("Start Game", 750, 500);
    strokeWeight(2);
    stroke(255);
    line(725, 550, width, 550);
    text("Help", 725, 600);
    line(700, 650, width, 650);
    text("Config", 700, 700);
    line(675, 750, width, 750);
    line(675, 750, width, 750);
  }

  //////////////////////////////////////////////////////////////////////////////////

  void keyControl()
  {
    // triangle pointer for keyboard controls
    beginShape();
    vertex(x1, y1);
    vertex(x2, y2);
    vertex(x3, y3);
    endShape();

    if (selection == 1 && down == true && frameCount > frameDelay)
    {
      x1 -= 25;
      x2 -= 25;
      x3 -= 25;
      y1 += 100;
      y2 += 100;
      y3 += 100;
      selection = 2;
      frameDelay = frameCount + fr/4;
    } else if (selection == 2 && down == true && frameCount > frameDelay)
    {
      x1 -= 25;
      x2 -= 25;
      x3 -= 25;
      y1 += 100;
      y2 += 100;
      y3 += 100;
      selection = 3;
      frameDelay = frameCount + fr/4;
    } else if (selection == 3 && up == true && frameCount > frameDelay)
    {
      x1 += 25;
      x2 += 25;
      x3 += 25;
      y1 -= 100;
      y2 -= 100;
      y3 -= 100;
      selection = 2;
      frameDelay = frameCount + fr/4;
    } else if (selection == 2 && up == true && frameCount > frameDelay)
    {
      x1 += 25;
      x2 += 25;
      x3 += 25;
      y1 -= 100;
      y2 -= 100;
      y3 -= 100;
      selection = 1;
      frameDelay = frameCount + fr/4;
    }
  }

  //////////////////////////////////////////////////////////////////////////////////

  void stats()
  {
    image(characterS, 0, 0);
    image(cslayout, 0, 0);
    textFont(startFont);
    textAlign(TOP, TOP);
    textSize(15);
    text(weaponSelection[weaponCount].name, 234, 168);
    text(armorSet[count2].name, 234, 245);
    textSize(30);
    stroke(255);
    text("Back", 35, 755);
    line(0, 790, 125, 790);
    text("Start", 900, 755);
    line(875, 790, width, 790);

    textAlign(CENTER, CENTER);
    text(player[0].health, 727, 291);
    text(player[0].attack, 726, 420);
    text(player[0].defence, 726, 549);
    text(player[0].speed, 726, 678);
    textSize(17);
    text(statpoints, 925, 131);

    if (this.mr == true)
    {
      //stat changing
      if (statpoints <= maxstat)
      {
        if (screen == 1 && healthsub.contains(mx, my) && player[0].health > 50)
        {
          player[0].health -= 1;
          statpoints += 1;
        }
        if (screen == 1 && attacksub.contains(mx, my) && player[0].attack > 10)
        {
          player[0].attack -= 1;
          statpoints +=1;
        } 
        if (screen == 1 && defencesub.contains(mx, my) && player[0].defence > 5)
        {
          player[0].defence -= 1;
          statpoints +=1;
        }
        if (screen == 1 && speedsub.contains(mx, my) && player[0].speed > 5)
        {
          player[0].speed -= 1;
          statpoints += 1;
        } else if (statpoints > 0)
        {
          if (screen ==1 && healthadd.contains(mx, my))
          {
            player[0].health += 1;
            statpoints -= 1;
          }
          if (screen == 1 && attackadd.contains(mx, my))
          {
            player[0].attack += 1;
            statpoints-= 1;
          }
          if (screen == 1 && defenceadd.contains(mx, my))
          {
            player[0].defence += 1;
            statpoints-= 1;
          }
          if (screen == 1 && speedadd.contains(mx, my))
          {
            player[0].speed += 1;
            statpoints-= 1;
          }
        }
      }
    }
  }
  void help()
  {
    background(21);
  }
  void config()
  {
    background(81);
  }
}