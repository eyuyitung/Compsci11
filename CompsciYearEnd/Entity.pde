class Entity
{
  int attack;
  int defence;
  int speed;
  int health;
  int accuracy;
  int level;
  int Exp;
  int maxExp;

  Entity (int a, int d, int s, int h)
  {
    attack=a;
    defence=d;
    speed=s;
    health=h;
    level = 1;
    Exp = 0;
    maxExp = 100;
  }


  Entity[] characterStats = new Entity[8]; 
{
  /*
  // for player
  characterStats[0] = new Entity(5,5,5,50);
  // for basic enemies
  characterStats[1] = new Entity(
  characterStats[2] = new Entity(
  characterStats[3] = new Entity(
  // for mini bosses
  characterStats[4] = new Entity(
  characterStats[5] = new Entity(
  characterStats[6] = new Entity(
  // for final boss
  characterStats[7] = new Entity(
  */
}  

}