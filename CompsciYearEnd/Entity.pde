
class Entity
{
  String name;
  int attack;
  int defence;
  int speed;
  int health;
  int critChance;
  float critMult;
  int stamina;
  int attackmove;
  int enemyTarget;
  int entityNumber;
  boolean playerSelect;
  int accuracy;
  int blockChance;



  Entity (int a, int d, int s, int h, int sta, int acc, int bC, String n, int cc, float cm, int am, int et, int en, boolean ps)
  {
    attack=a;
    defence=d;
    speed=s;
    health=h;
    stamina = sta;
    accuracy = acc;
    blockChance = bC;
    name = n;
    critChance = cc;
    critMult = cm;
    attackmove = am;
    enemyTarget = et;
    entityNumber = en;
    playerSelect = ps;
  }




  Entity (int l, int en)
  {
    this(l*5, l*5, l*5, l*50, 0, 100, 0, "Goblin", 0, 1.5, 0, 0, en, true);
  }

  Entity (int en) //enemy/player
  {  
    this(5, 5, 5, 50, 5, 100, 15, "", 0, 1.0, 0, 0, en, false);
  }


  /*
 // used to correspond the stats with the stats of the player
   Entity (Entity[] player, float acc)
   { // for all the stats, a base stat value is needed to be added to the player's % stats
   attack=(player.attack)*(0.3);
   defence=(player.defence)*(0.3);
   speed=(player.speed)*(0.3);
   accuracy=acc;
   }
   
   //exclusive for player
   Entity[] characterStats = new Entity[1]; 
   {
   characterStats[0] = new Entity(5, 5, 5, 50, 100);
   }
   
   
   
   Entity[] characterStats = new Entity[8]; 
   {
   
   // for player
   characterStats[0] = new Entity(5, 5, 5, 50);
   
   //exclusive for enemy entities
   Entity[] enemyStats = new Entity[7];
   {
   
   // for basic enemies
   characterStats[0] = new Entity(characterStats[0], 100);
   characterStats[1] = new Entity(characterStats[0], 100);
   characterStats[2] = new Entity(characterStats[0], 100);
   // for mini bosses
   characterStats[3] = new Entity();
   characterStats[4] = new Entity();
   characterStats[5] = new Entity();
   // for final boss
   
   characterStats[7] = new Entity();
   
   
   characterStats[6] = new Entity();
   }
   }
   */
}