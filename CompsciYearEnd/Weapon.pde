/* Class Weapon will be an object representing all of the weapons ex. sword, mace, shield etc. 
 all of the weapons (excluding shield) will have damage, accuracy, speed and critical hit multiplier/damage stats.
 The shield on the other hand will have a block chance and defence stat and all other values will be zero. 
 
 */
class Weapon
{
  int damage; // flat value with rng
  int accuracy; // percentage rng
  int speed; // priority 
  int critMultiplyer; //
  int critChance;
  int blockChance;
  int defence;  

  Weapon (int dm, int ac, int s, int cM, int cC, int bC, int df)
  {
    damage = dm;
    accuracy = ac;
    speed = s;
    critMultiplyer = cM;
    critChance = cC;
    blockChance = bC;
    defence = df;   
  }
  
  
  
  
  
  
  void attack (Enemy target) 
  {
     int attack = damage;
     int j;
     int num = (int)random(100);
     for (int i = 1; i >= critChance || j == num ; i++)
       j = (int)random(100);
     if (j==num)         
       attack = attack * critMultiplyer;  
     target.health -= attack;
  }
}