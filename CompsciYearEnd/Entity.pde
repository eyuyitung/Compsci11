

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
  boolean dead;


  //constructor for a new entity
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

  Entity (int a, int d, int s, int h, int sta, int acc, int bC, int rC, String n, int cc, float cm, int am, int et, int en, boolean ps, int mn, int exp, int x1, int y1, boolean state, int xp)
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
    dead = state;
    exper = xp;
  }




  Entity (String na, int l, int en, int mn, int x, int y, boolean state)
  {
    this(l*15, l*5, l*50, l*20, 0, 100, 0, 0, na, 0, 1.5, 0, 0, en, true, mn, l*20, x, y, state, 50*l);
  }


  Entity (int l, int en) //player

  {
    this(l*30, l*25, l*25, l*125, 5, 100, 15, 50, "", 0, 1.0, 0, 0, en, false, 0, 0);
  }


  Entity () //player
  {  
    this(0, 0, 0, 0, 0, 0, 0, 0, "", 0, 0, 0, 0, 0, false, 0, 0);
  }


  //copies status 
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

  
}