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

  // base level constructor for weapon objects
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

  // more concise constructor for normal weapons (excluding shield)
  Weapon (int dm, int ac, int s, int cM, int cC)
  {
    this (dm, ac, s, cM, cC, 0, 0);
  }

  // concise contructor for shields
  Weapon (int bC, int df)
  {
    this (0, 0, 0, 0, 0, bC, df);
  }


  void attack (Entity target) 
  {
    int attack = damage;
    int j = (int)random(100);
    int num = (int)random(100);
    for (int i = 1; i >= critChance || j == num; i++)
      j = (int)random(100);
    if (j==num)         
      attack = attack * critMultiplyer;  
    target.health -= attack;
  }
}