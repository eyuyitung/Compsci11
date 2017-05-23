//<>// //<>//

class Battle
{
  int count = 0;
  int j = 0;
  boolean mr;
  PImage bpback;
  PImage [] bp = new PImage [10];
  PImage[] mobPic = new PImage [4];
  int screen = 10;
  int enhancedAtt;
  int critCount;
  int accCount;
  int blockCount;
  int runCount;
  boolean critTrigger;
  boolean willHit;
  boolean willBlock = false;
  boolean willRun = false;
  boolean isPoisoned = false;
  int critPer;
  int playerTotalspeed;
  int enemyTotalspeed;
  int [] attackx = {121, 206, 206, 121};
  int [] attacky = {568, 568, 586, 586};
  Polygon attackTab = new Polygon(attackx, attacky, 4);
  int [] oattackx = {207, 483, 483, 207};
  int [] oattacky = {317, 317, 598, 598};
  Polygon oattackTab = new Polygon(oattackx, oattacky, 4);
  int [] lightAttackx = {270, 421, 421, 270};
  int [] lightAttacky = {345, 345, 368, 368};
  Polygon lightAtab = new Polygon(lightAttackx, lightAttacky, 4);
  int[] heavyAttackx = {261, 430, 430, 261};
  int[] heavyAttacky = {428, 428, 451, 451};
  Polygon heavyAtab = new Polygon(heavyAttackx, heavyAttacky, 4);
  int[] blockTabx = {131, 195, 195, 131};
  int[] blockTaby = {670, 670, 688, 688};
  Polygon blockTab = new Polygon(blockTabx, blockTaby, 4);
  int[] runTabx = {141, 183, 183, 141};
  int[] runTaby = {720, 720, 739, 739};
  Polygon runTab = new Polygon(runTabx, runTaby, 4);
  int[] itemsTabx = {130, 194, 194, 130};
  int[] itemsTaby = {618, 618, 637, 637}; 
  Polygon itemsTab = new Polygon(itemsTabx, itemsTaby, 4);
  int[] oitemsTabx = {207, 483, 483, 207};
  int[] oitemsTaby = {335, 335, 616, 616};
  Polygon oitemsTab = new Polygon(oitemsTabx, oitemsTaby, 4);
  int[] specialAttackx = {254, 436, 436, 254};
  int[] specialAttacky = {511, 511, 534, 534};
  Polygon specialAtab = new Polygon(specialAttackx, specialAttacky, 4);
  int[] enemy1x = {860, 925, 925, 860};
  int[] enemy1y = {660, 660, 680, 680};
  Polygon enemy1 = new Polygon(enemy1x, enemy1y, 4);
  int[] enemy2x = {760, 825, 825, 760};
  int[] enemy2y = {660, 660, 680, 680};
  Polygon enemy2 = new Polygon(enemy2x, enemy2y, 4);


  Battle()
  {
    loadPics();
  }


  void loadPics()
  {
    bp[1] = loadImage("Battlephase.png");
    bp[2] = loadImage("Battlephase2.png");
    bp[3] = loadImage("BattlephaseAttack.png");
    bp[4] = loadImage("Battlephase3.png");
    bp[5] = loadImage("BattlephaseItems.png");
    bpback = loadImage("battlebackground.png");
    mobPic[0] = loadImage("goblin.png");
    mobPic[1] = loadImage("hellhound.png");
    mobPic[2] = loadImage("skeleton.png");
    mobPic[3] = loadImage("boss.png");
  }

  void defeatScreen()
  {
  }

  //Action tab
  void battleP1()
  {
    image(bp[1], 0, 0);
  }
  //HP, Stamina bar
  void battleP2()
  {
    image(bp[2], 0, 0);
    textAlign(TOP, TOP);
    textSize(20);
    text(player[0].health, 560, 560);
    text(playerMax[0].health, 612, 560);
    text(player[0].name, 860, 560);
    text(player[1].health, 560, 685);
    text(playerMax[1].health, 612, 685);
    text(player[1].name, 860, 685);
  }
  //Enemy selection UI
  void battleP3()
  {
    image(bp[4], 0, 0);
    textAlign(TOP, TOP);
    text(enemy[2].name, 860, 660);
    text(enemy[3].name, 760, 660);
    text(enemy[0].name, 860, 560);
    text(enemy[1].name, 760, 560);
  }
  //Battlephase background
  void bpbackground()
  {
    image(bpback, 0, 0);
  }
  //Different attack UI
  void battleAttack()
  {
    image(bp[3], 0, 0);
  }

  void battleItems()
  {
    image(bp[5], 0, 0);
  }
  //Checks if both the characters have selected an attack if so, animate the attacks
  void attackSelected()
  {
    if (player[0].playerSelect == true && player[1].playerSelect == true)
    {
      speedPriority();
    }
  }

  void entityDeath()
  {
    if (player[0].health < 0 && player[1].health < 0)
    {
      screen = 6;
    }


    for (int i = 0; i < enemy.length; i++)
    {
      if (enemy[i].health < 0)
      {
        j++;
        player[0].exper += enemy[i].exper;
      }
    }
    if (j == enemy.length)
    {
      screen = 10;
      world.gracePeriod = true;
      encounter = false;
      j = 0;
    }
  }

  void spawn()
  {

    image(mobPic[enemy[0].mobNumber], 690, 235);
    image(mobPic[enemy[2].mobNumber], 690, 350);
    image(mobPic[enemy[1].mobNumber], 570, 235);
    image(mobPic[enemy[3].mobNumber], 570, 350);
  }

  void isCrit()
  {
    critCount = (int)random(0, 100);
    if (critCount < player[j].critChance)
    {
      critTrigger = true;
    }
  }

  void accHit()
  {
    accCount = (int)random(0, 100);
    if (accCount < player[j].accuracy)
    {
      willHit = true;
    }
  }

  void isBlock()
  {
    blockCount = (int)random(0, 100);
    if (blockCount < player[j].blockChance)
    {
      willBlock = true;
    }
  }

  void isRun()
  {
    runCount = (int)random(0, 100);
    if (runCount < player[0].runChance)
    {
      willRun = true;
    }
  }

  void switchTarget()
  {
    for (int i = 0; i <player.length; i++)
    {
      if (player[0].health < 0)
      {
        enemy[i].enemyTarget = player[1].entityNumber;
      } else if (player[1].health <0)
      {
        enemy[i].enemyTarget = player[0].entityNumber;
      }
    }
  }

  void daggerSpecial()
  {
    if (isPoisoned == true)
    {
      enemy[0].health -= (round(player[0].attack * 0.25));
      enemy[1].health -= (round(player[0].attack * 0.25));
      enemy[2].health -= (round(player[0].attack * 0.25));
      enemy[3].health -= (round(player[0].attack * 0.25));
    }
  }

  void enemyAttack()
  {
    for (int i = 0; i < enemy.length; i++)
    {
      int ran1 = (int)random(2)+10;
      int ran2 = (int)random(2)+1;
      enemy[i].attackmove = ran2;
      enemy[i].enemyTarget = ran1;
    }

    for (int j = 0; j < enemy.length; j++)
    {
      for (int i = 0; i < player.length; i++)
      {
        switchTarget();
        if (enemy[j].enemyTarget == player[i].entityNumber)
        {
          if (enemy[j].attackmove == 1)
          {
            if (willBlock == true)
            {
              willBlock = false;
            } else
            {
              player[i].health = (player[i].health - (enemy[j].attack - player[i].defence));
            }
          }

          if (enemy[j].attackmove == 2)
          {
            if (willBlock == true)
            {
              willBlock = false;
            } else
            {
              player[i].health = (player[i].health - (round(enemy[j].attack * 1.5) - player[i].defence));
            }
          }
        }
      }
    }
  }


  void battleAnimations()
  {
    for (j = 0; j < player.length; j++)
    {
      for (int i = 0; i < enemy.length; i++)
      {
        if (player[j].enemyTarget == enemy[i].entityNumber)
        {
          isCrit();
          accHit();
          daggerSpecial();
          if (player[0].attackmove == 3)
          {
            if (weaponCount == 0)
            {
              isPoisoned = true;
            } else if (weaponCount == 1)
            {
              enemy[i].health -= player[j].attack * 5;
            } else if (weaponCount == 2)
            {
              player[0].critChance += 10;
              player[1].critChance += 10;
            } else if (weaponCount == 3)
            {
              for (int k = 0; k <enemy.length; k++)
              {
                enemy[k].defence -= round(enemy[k].defence * 0.2);
              }
            } else if (weaponCount == 4)
            {
              for (int k = 0; k < player.length; k++)
              {
                player[k].attack += 20;
              }
            }
          }

          if (willHit == true)
          {
            if (player[j].attackmove == 1 && critTrigger == false)
            {
              enemy[i].health = (enemy[i].health - (player[j].attack - enemy[i].defence)); 
                willHit = false;
            } else if (player[j].attackmove == 1 && critTrigger == true)
            {
              enemy[i].health = (enemy[i].health - (round(player[j].attack * player[j].critMult) - enemy[i].defence)); 
                critTrigger = false; 
                willHit = false;
            } else if (player[j].attackmove == 2 && critTrigger == false)
            {
              player[j].stamina -= 2; 
                enhancedAtt = (round(player[j].attack * 1.5)); 
                enemy[i].health = (enemy[i].health - (enhancedAtt - enemy[i].defence)); 
                willHit = false;
            } else if (player[j].attackmove == 2 && critTrigger == true)
            {
              player[j].stamina -=2; 
                enhancedAtt = (round((player[j].attack * 1.5)*player[j].critMult)); 
                enemy[i].health = (enemy[i].health - (enhancedAtt - enemy[i].defence)); 
                critTrigger = false; 
                willHit = false;
            }
          } else
          {
            //missed text
          }
          if (player[j].attackmove == 3)
          {
            isBlock();
          }
        }
      }
    }

    for (int i = 0; i < player.length; i++)
    {
      if (player[i].stamina < 7 && player[i].attackmove != 3)
      {
        player[i].stamina++;
      } else if (player[i].attackmove == 3)
      {
        player[i].stamina += 2;
      }
    }
  }

  void speedPriority()
  {
    for (int i = 0; i < player.length; i++)
    {
      playerTotalspeed += player[i].speed;
    }
    for (int i = 0; i < enemy.length; i++)
    {
      enemyTotalspeed += enemy[i].speed;
    }

    if (playerTotalspeed > enemyTotalspeed)
    {
      battleAnimations(); 
        delay(1000); 
        enemyAttack();
    } else
    {
      enemyAttack(); 
        delay(1000); 
        battleAnimations();
    }
  }



  void display()
  {
    screenSwitch(); 
      attackHitbox(); 
      entityDeath(); 
      println("enemy1hp = " + enemy[0].health); 
      println("enemy2hp = " + enemy[1].health); 
      println(critCount); 


      if (count == 2)
    {
      count = 0; 
        player[0].playerSelect = false; 
        player[1].playerSelect = false;
    }
    if (screen == 6)
    {
      bpbackground(); 
        defeatScreen();
    }




    if (screen == 10)
    {


      bpbackground(); 
        battleP1(); 
        battleP2(); 
        spawn();
    } else if (screen == 11)
    {

      bpbackground(); 
        battleP1(); 
        battleP2(); 
        battleAttack(); 
        spawn();
    } else if (screen == 12)
    {

      bpbackground(); 
        battleP1(); 
        battleP3(); 
        spawn();
    } else if (screen == 13)
    { 

      bpbackground(); 
        battleP1(); 
        battleP2(); 
        battleItems(); 
        spawn();
    }
  }


  void screenSwitch()
  {
    if (this.mr == true)
    {
      if (screen == 10 && attackTab.contains(mx, my))
      {
        screen = 11;
      } else if (screen == 10 && itemsTab.contains(mx, my))
      {
        screen = 13;
      } else if (screen == 10 && blockTab.contains(mx, my))
      {
        player[count].attackmove = 3; 
          player[count].playerSelect = true; 
          count++; 
          attackSelected();
      } else if (screen == 10 && runTab.contains(mx, my))
      {
        isRun(); 
          if (willRun == true)
        {
          screen = 5; 
            willRun = false;
        } else if (willRun == false)
        {
          player[count].playerSelect = true; 
            count++; 
            attackSelected();
        }
      } else if (screen == 11 && oattackTab.contains(mx, my) == false)
      {
        screen = 10;
      } else if (screen == 13 && oitemsTab.contains(mx, my) == false)
      {
        screen = 10;
      }
    }
  }

  void attackHitbox()
  {

    if (this.mr == true)
    {

      if (screen == 11 && lightAtab.contains(mx, my))
      {
        player[count].attackmove = 1; 
          screen = 12;
      } else if (screen == 11 && heavyAtab.contains(mx, my) && player[count].stamina > 2)

      {
        player[count].attackmove = 2; 
          screen = 12;
      } else if (screen == 11 && heavyAtab.contains(mx, my) && player[count].stamina < 2)
      {
        //make a popout saying that the current character doesnt have enough stamina
      } else if (count == 0 && screen == 11 && specialAtab.contains(mx, my) && player[count].stamina == playerMax[count].stamina)
      {
        player[count].attackmove = 3; 
          screen = 12;
      } else if (count == 0 && screen == 11 && specialAtab.contains(mx, my) && player[count].stamina < playerMax[count].stamina)
      {
        // make a popout saying that the current character doesnt have enough stamina
      } else if (screen == 12 && enemy1.contains(mx, my))
      {
        player[count].enemyTarget = enemy[0].entityNumber; 
          player[count].playerSelect = true; 
          screen = 10; 
          count++; 
          attackSelected();
      } else if (screen == 12 && enemy2.contains(mx, my))
      {
        player[count].enemyTarget = enemy[1].entityNumber; 
          player[count].playerSelect = true; 
          screen = 10; 
          count++; 
          attackSelected();
      }
    }
  }
}