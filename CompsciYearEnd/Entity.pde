

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
  int runChance;
  int blockChance;
  int mobNumber;
  int exper;
  int x;
  int y;
  boolean alive;



  Entity (int a, int d, int s, int h, int sta, int acc, int bC, int rC, String n, int cc, float cm, int am, int et, int en, boolean ps, int mn, int exp)
  {
    attack=a;
    defence=d;
    speed=s;
    health=h;
    stamina = sta;
    accuracy = acc;
    blockChance = bC;
    runChance = rC;
    name = n;
    critChance = cc;
    critMult = cm;
    attackmove = am;
    enemyTarget = et;
    entityNumber = en;
    playerSelect = ps;
    mobNumber = mn;
    exper = exp;
  }
  
   Entity (int a, int d, int s, int h, int sta, int acc, int bC, int rC, String n, int cc, float cm, int am, int et, int en, boolean ps, int mn, int exp, int x1 , int y1, boolean live)
  {
    attack=a;
    defence=d;
    speed=s;
    health=h;
    stamina = sta;
    accuracy = acc;
    blockChance = bC;
    runChance = rC;
    name = n;
    critChance = cc;
    critMult = cm;
    attackmove = am;
    enemyTarget = et;
    entityNumber = en;
    playerSelect = ps;
    mobNumber = mn;
    exper = exp;
    x = x1;
    y = y1;
    alive = live;
  }




  Entity (String na, int l, int en, int mn, int x, int y, boolean live)
  {
    this(l*15, l*5, l*50, l*50, 0, 100, 0, 0, na, 0, 1.5, 0, 0, en, true, mn, l*20,x ,y, live);
  }


  Entity (int l, int en) //player
  {  
    this(l*10, l*5, l*5, l*60, 5, 100, 15, 50, "", 0, 1.0, 0, 0, en, false, 0, 0);
  }

  Entity () //player
  {  
    this(0, 0, 0, 0, 0, 0, 0, 0, "", 0, 0, 0, 0, 0, false, 0, 0);
  }




  void copyInto (Entity n){
    attack= n.attack;
    defence= n.defence;
    speed= n.speed;
    health=n.health;
    stamina = n.stamina;
    accuracy = n.accuracy;
    blockChance = n.blockChance;
    runChance = n.runChance;
    name = n.name;
    critChance = n.critChance;
    critMult = n.critMult;
    attackmove = n.attackmove;
    enemyTarget = n.enemyTarget;
    entityNumber = n.entityNumber;
    playerSelect = n.playerSelect;
    mobNumber = n.mobNumber;
    exper = n.exper;
    
    
    
    
    
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