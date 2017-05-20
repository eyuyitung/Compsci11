 //<>//

class Battle
{
  int count = 0;
  boolean mr;
  PImage bpback, bp1, bp2, bp3, bp4;
  int screen = 10;
  int enhancedAtt;
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
    text(player[0].name, 860, 560);
    text(player[1].health, 560, 685);
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
      screen = 5;
    }
    }
  }


  void battleAnimations()
  {
    for (int j = 0; j < player.length; j++)
    {
      for (int i = 0; i < player.length; i++)
      {
        if (player[j].enemyTarget == enemy[i].entityNumber)
        {
          if (player[i].attackmove == 1)
          {
            enemy[i].health = enemy[i].health - player[i].attack;
            if(player[i].stamina < 7)
            {
              player[i].stamina++;
              
            }
          } else if (player[i].attackmove == 2)
          {
            player[i].stamina -= 2;
            enhancedAtt = (player[i].attack + round(player[i].attack * 0.5));
            enemy[i].health = (enemy[i].health - enhancedAtt);
          }
        }
      }
    }
  }



  void display()
  {
    screenSwitch();
    attackHitbox();
    entityDeath();
    println("enemy1hp = " + enemy[0].health);
    println("enemy2hp = " + enemy[1].health);
    println(count);
    println(player[0].playerSelect);
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
      } else if (screen == 11 && heavyAtab.contains(mx, my))

      {
        player[count].attackmove = 2; 
        screen = 12;
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