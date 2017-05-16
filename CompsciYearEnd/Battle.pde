 void playerEncounter() //<>//
{
  encounter = true;
}

class Battle
{
  boolean mr;
  boolean player1Select;
  boolean player2Select;
  PImage bpback, bp1, bp2, bp3, bp4;
  int screen = 10;
  int [] attackx = {121, 206, 206, 121};
  int [] attacky = {568, 568, 586, 586};
  Polygon attackTab = new Polygon(attackx, attacky, 4);
  int [] oattackx = {207, 483, 483, 207};
  int [] oattacky = {317, 317, 598, 598};
  Polygon oattackTab = new Polygon(oattackx, oattacky, 4);
  int [] lightAttackx = {270, 421, 421, 270};
  int [] lightAttacky = {345, 345, 368, 368};
  Polygon lightAtab = new Polygon(lightAttackx, lightAttacky, 4);
  
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
  }
//Enemy selection UI
  void battleP3()
  {
    image(bp4, 0, 0);
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
    if(player1Select == true && player2Select == true)
      {
        //add if player[i].enemyTarget = enemy[i].entityNumber
        battleAnimations();
      }
  }
  
  void enemySelection()
  {
    //if mouse or key activate the hitboxes on the enemy selection UI screen
    //then player[i].enemyTarget will be that of the selected enemy entity code
    //then make that character's player[number]Select == true
    
    
  }
  
  void battleAnimations()
  {
    
    
  }



  void display()
  {
    mouseKey();


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
      rect(270, 345, 151, 23);
    } else if (screen == 12)
    {
      bpbackground();
      battleP1();
      battleP3();
    }
  }


  void mouseKey()
  {
    if (this.mr == true)
    {
      if (screen == 10 && attackTab.contains(mx, my))
      {
        screen = 11;
      } else if (screen == 11 && oattackTab.contains(mx, my) == false)
      {
        screen = 10;
      } else if (screen == 11 && lightAtab.contains(mx, my));
      {
        player[0].attackmove = 1;
        screen = 12;
        enemySelection();
      }
    }
  }
}