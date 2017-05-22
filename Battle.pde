//<>// //<>//

class Battle
{
  int count = 0;
  boolean mr;
  PImage bpback, bp1, bp2, bp3, bp4;
  int screen = 10;
  int enhancedAtt;
  int critCount = (int)random(0, 100);
  int accCount = (int)random(0, 100);
  int blockCount = (int)random(0, 100);
  boolean critTrigger;
  boolean willHit;
  boolean willBlock;
  int critPer;
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
    bp1 = loadImage("Battlephase.png");
    bp2 = loadImage("Battlephase2.png");
    bp3 = loadImage("BattlephaseAttack.png");
    bp4 = loadImage("Battlephase3.png");
    bpback = loadImage("battlebackground.png");
  }

  void defeatScreen()
  {
  }

  //Action tab
  void battleP1()
  {
    image(bp1, 0, 0);
  }
  //HP, Stamina bar
  void battleP2()
  {
    image(bp2, 0, 0);
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
    image(bp4, 0, 0);
    text(enemy[0].name, 860, 660);
    text(enemy[1].name, 760, 660);
  }
  //Battlephase background
  void bpbackground()
  {
    image(bpback, 0, 0);
  }
  //Different attack UI
  void battleAttack()
  {
    image(bp3, 0, 0);
  }
  //Checks if both the characters have selected an attack if so, animate the attacks
  void attackSelected()
  {
    if (player[0].playerSelect == true && player[1].playerSelect == true)
    {
      battleAnimations();
    }
  }

  void entityDeath()
  {
    if (player[0].health == 0 && player[1].health == 0)
    {
      screen = 6;
    }


    for (int i = 0, j = 0; i < enemy.length; i++)
    {
      if (enemy[i].health <= 0)
      {
        j++;
      }
      if (j == enemy.length)
      {
        screen = 10;
        world.gracePeriod = true;
        encounter = false;
      }
    }
  }

  void isCrit()
  {
    if (critCount < player[j].critChance)
    {
      critTrigger = true;
    }
  }

  void accHit()
  {
    if (accCount < player[j].accuracy)
    {
      willHit = true;
    }
  }

  void isBlock()
  {
    if (blockCount < player[j].blockChance)
    {
      willBlock = true;
    }
  }

  void switchTarget()
  {
    for (int i = 0; i <player.length; i++)
    {
      if (player[0].health < 0)
      {
        enemy[i].enemyTarget = player[1].entityNumber;
      }
      else if(player[1].health <0)
      {
       enemy[i].enemyTarget = player[0].entityNumber; 
      }
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
            player[i].health = (player[i].health - enemy[j].attack);
          }
          if (enemy[j].attackmove == 2)
          {
            player[i].health = (player[i].health - round(enemy[j].attack * 1.5));
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
        isBlock();
        if (player[j].enemyTarget == enemy[i].entityNumber)
        {
          isCrit();
          accHit();
          isBlock();
          if (willHit == true)
          {
            if (player[j].attackmove == 1 && critTrigger == false)
            {
              enemy[i].health = (enemy[i].health - player[j].attack);
              willHit = false;
            } else if (player[j].attackmove == 1 && critTrigger == true)
            {
              enemy[i].health = enemy[i].health - round(player[j].attack * player[j].critMult);
              critTrigger = false;
              willHit = false;
            } else if (player[j].attackmove == 2 && critTrigger == false)
            {
              player[j].stamina -= 2;
              enhancedAtt = (round(player[j].attack * 1.5));
              enemy[i].health = (enemy[i].health - enhancedAtt);
              willHit = false;
            } else if (player[j].attackmove == 2 && critTrigger == true)
            {
              player[j].stamina -=2;
              enhancedAtt = (round((player[j].attack * 1.5)*player[j].critMult));
              enemy[i].health = (enemy[i].health - enhancedAtt);
              critTrigger = false;
              willHit = false;
            }
          } else
          {
            //missed text
          }
          if (player[j].attackmove == 3 && willBlock == true)
          {
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
    enemyAttack();
  }



  void display()
  {
    screenSwitch();
    attackHitbox();
    entityDeath();
    println("enemy1hp = " + enemy[0].health);
    println("enemy2hp = " + enemy[1].health);
    println(enemy[0].enemyTarget);
    println(enemy[1].enemyTarget);
    println(enemy[0].attackmove);
    println(enemy[1].attackmove);


    if (count == 2)
    {
      count = 0;
      player[0].playerSelect = false;
      player[1].playerSelect = false;
    }
    if (screen == 6)
    {
      bpbackground();
      battleP1();
      battleP2();
      defeatScreen();
    }




    if (screen == 10)
    {
      bpbackground();
      battleP1();
      battleP2();
    } else if (screen == 11)
    {
      bpbackground();
      battleP1();
      battleP2();
      battleAttack();
    } else if (screen == 12)
    {
      bpbackground();
      battleP1();
      battleP3();
    }
  }


  void screenSwitch()
  {
    if (this.mr == true)
    {
      if (screen == 10 && attackTab.contains(mx, my))
      {
        screen = 11;
      } else if (screen == 11 && oattackTab.contains(mx, my) == false)
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
      } else if (screen == 10 && blockTab.contains(mx, my))
      {
        player[count].attackmove = 3;
        player[count].playerSelect = true;
        count++;
        attackSelected();
      } else if (screen == 11 && heavyAtab.contains(mx, my) && player[count].stamina < 2)
      {
        //make a popout saying that the current character doesnt have enough stamina
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