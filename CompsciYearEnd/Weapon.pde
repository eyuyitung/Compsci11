/* Class Weapon will be an object representing all of the weapons ex. sword, mace, shield etc. 
 all of the weapons (excluding shield) will have damage, accuracy, speed and critical hit multiplier/damage stats.
 The shield on the other hand will have a block chance and defence stat and all other values will be zero. 
 
 */
class Weapon
{
  String name;
  int stamina;
  int attack; 
  int accuracy; // percentage rng
  int speed; // priority 
  float critMultiplyer; //
  int critChance;
  int blockChance;
  int defence;  

  // base level constructor for weapon objects
  Weapon (String na, int sta, int dm, int ac, int s, float cM, int cC, int bC, int df)
  {
    name = na;
    stamina = sta;
    attack = dm;
    accuracy = ac;
    speed = s;
    critMultiplyer = cM;
    critChance = cC;
    blockChance = bC;
    defence = df;
  }

  Weapon (String na, int sta, int dm, int ac, int s, float cM, int cC)
  {
    name = na;
    stamina = sta;
    attack = dm;
    accuracy = ac;
    speed = s;
    critMultiplyer = cM;
    critChance = cC;
  }
  
  
  
    
  
  

  /*void attack (Entity target) 
   {
   int attack = damage;
   int j = (int)random(100);
   int num = (int)random(100);
   for (int i = 1; i >= critChance || j == num; i++)
   j = (int)random(100);
   if (j==num)         
   attack = attack * critMultiplyer;  
   target.health -= attack;
   }*/
}