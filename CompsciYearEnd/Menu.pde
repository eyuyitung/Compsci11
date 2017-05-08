// moving all menu elements into this class to streamline main code
// will do all logic in here and output to a display method within the class



//class of all menu elements in game. character builder works into entity class of player




class Menu
{
  int screen;
  boolean mr; 
  PImage pic1, pic2, pic3, pic4, pic5, pic6, pic7, pic8;
  pic1 = loadImage("1.gif");
  pic2 = loadImage("2.gif");
  pic3 = loadImage("3.gif");
  pic4 = loadImage("4.gif");
  pic5 = loadImage("5.gif");
  pic6 = loadImage("6.gif");
  pic7 = loadImage("7.gif");
  pic8 = loadImage("8.gif");  
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

  Menu (int s)
  {
    int screen = s;
  }
  void display()
  {
  }

  int switchScreen()
  {
    int select;
    if (mr == true) 
    {
      if (screen == 0 && start.contains(mx, my))
      {
        screen = 1;
      }
      if (screen == 0 && help.contains(mx, my))
        screen = 2;
      if (screen == 0 && config.contains(mx, my))
        screen = 3;
      if (screen == 1 && csstart.contains(mx, my))


        if (sc && start.contains(mx, my))
          screen = 1;
        else if (screen == 0 && help.contains(mx, my))
          screen = 2;
        else if (screen == 0 && config.contains(mx, my))
          screen = 3;
        else if (screen == 1 && csstart.contains(mx, my))
        }
        screen = 10;
    if (screen == 1 && csback.contains(mx, my))
    {
      screen = 0;
      player.health = 50;
      player.attack = 5;
      player.defence = 5;
      player.speed = 5;
    }
    //stat changing
    if (statpoints <= 20)
    {
      if (screen == 1 && healthsub.contains(mx, my) && player.health > 50)
      {
        player.health -= 1;
        statpoints += 1;
      }
      if (screen == 1 && attacksub.contains(mx, my) && player.attack > 5)
      {
        player.attack -= 1;
        statpoints +=1;
      } 
      if (screen == 1 && defencesub.contains(mx, my) && player.defence > 5)
      {
        player.defence -= 1;
        statpoints +=1;
      }
      if (screen == 1 && speedsub.contains(mx, my) && player.speed > 5)
      {
        player.speed -= 1;
        statpoints += 1;
      } else if (statpoints > 0)
      {
        if (screen ==1 && healthadd.contains(mx, my))
        {
          player.health += 1;
          statpoints -= 1;
        }
        if (screen == 1 && attackadd.contains(mx, my))
        {
          player.attack += 1;
          statpoints -= 1;
        }
        if (screen == 1 && defenceadd.contains(mx, my))
        {
          player.defence += 1;
          statpoints -= 1;
        }
        if (screen == 1 && speedadd.contains(mx, my))
        {
          player.speed += 1;
          statpoints -= 1;
        }
      }
    }
  }
  return select;

  void background();
  {
  }
}