class Entity
{
  int attack;
  int defence;
  int speed;
  int health;
  int accuracy;
  
  Entity (int a, int d, int s, int h)
  {
    attack=a;
    defence=d;
    speed=s;
    health=h;
  }
  
  


  Entity[] characterStats = new Entity[8]; 
{
  // for player
  characterStats[0] = Entity(5,5,5,50);
  // for basic enemies
  characterStats[1] = Entity(
  characterStats[2] = Entity(
  characterStats[3] = Entity(
  // for mini bosses
  characterStats[4] = Entity(
  characterStats[5] = Entity(
  characterStats[6] = Entity(
  // for final boss
  characterStats[7] = Entity(
  
}