/* Class Weapon will be an object representing all of the weapons ex. sword, mace, shield etc. 
 all of the weapons (excluding shield) will have damage, accuracy, speed and critical hit multiplier/damage stats.
 The shield on the other hand will have a block chance and defence stat and all other values will be zero. 
 
 */
Class Weapon;
{
  int damage; // flat value with rng
  int accuracy; // percentage rng
  int speed; // priority 
  int critMultiplyer; //
  int critChance;
  int blockChance;
  int defence;  

  void attack (Enemy target) 
  {
    if (int crit = (int)random(10)+1 <= critChance) //?
    target.hp -= 
        
  
  
  
  
  
  }
}