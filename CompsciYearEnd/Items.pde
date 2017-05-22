// includes all potions, armor, loot and keys



class Items
{
  int potion; //0 = attack, 1 = defence, 2 = speed, 3 = health
  int[] inv = new int [6]; // 0 = attack pot, 1 = defence pot, 2 = speed pot, 3 = health pot, 4 = keys, 5 = boss key




  void use(int potion, int n) { // 1st is potion type, 2nd is entity it will be used on 0 = player 1 = ally
    if (potion == 0)
      player[n].attack *= 1.25;
    else if (potion == 1)
      player[n].defence *= 1.25;
    else if (potion == 2)
      player[n].speed *= 1.25;
    else if (potion == 3)
      player[n].health += playerMax[n].health * 0.5;
      
      
  }
} 