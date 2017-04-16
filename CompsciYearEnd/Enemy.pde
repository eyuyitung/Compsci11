Class Enemy;
{
 int attack;
 int defence;
 int speed;
 int hp;
 int accuracy;
   
  
}

Enemy (int a, int d, int s, int h)
{
 attack=a;
 defence=d;
 speed=s;
 hp=h;
}

Enemy[] enemyBasic = new Enemy[3]; //

enemyBasic[0]=Enemy(