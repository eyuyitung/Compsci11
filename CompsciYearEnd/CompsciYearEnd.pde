
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

/*compsci year end assignment
 group Eric, Brian, Kaizen
 assignement due may 24th
 */

Minim minim;
AudioPlayer Player, Player2, Player3;

boolean encounter;
boolean up, down, left, right, shift, enter, back, esc;
boolean muteMusic = true;
int screen = 0;
World world;
float encounterPer;
PImage characterS;
PImage cslayout;
int weaponCount = 0;
int enemyCount;
String[] mobName = {"Goblin", "Hellhound", "Skeleton"};
int index;
int level = 1;
int j;
int fr = 64; //frame rate of main menu, must be multiple of 8
int mx = -1;
int my = -1;
int x1 = 715;
int x2 = 715;
int x3 = 745;
int y1 = 515;
int y2 = 535;
int y3 = 525;
int selection = 1; //selection on main menu 1= start 0= help -1= config
import java.awt.*;
int statpoints = 30;
int maxstat = 30;

PFont startFont;
Entity[] player = new Entity[2];
Entity[] playerMax = new Entity[2];
Entity[] enemy = new Entity[4];
Weapon[] weapons = new Weapon[5];
Weapon[] weaponSelection = new Weapon[5];
Weapon[] shield = new Weapon[1];
Armor[] armorSet = new Armor[3];
Menu main;
Items items = new Items();
Battle battlephase;

void setup() {
  size(1000, 800);  
  frameRate(fr);

  minim = new Minim(this);
  Player = minim.loadFile("lavender.mp3");
  Player2 = minim.loadFile("battle.mp3");
  Player3 = minim.loadFile("chest.mp3");
  Player.loop();

 

  characterS = loadImage("characterS.gif");
  cslayout = loadImage("RPG layout.png");
  startFont = createFont("Century Gothic Italic", 38);

  player[0] = new Entity(level, 10);
  player[0].name = "Adam";
  player[1] = new Entity(level, 11);

  player[1].name = "Someguy";
  playerMax[0] = new Entity();
  playerMax[1] = new Entity();
  for (int i = 0; i < 5; i++)
    items.inv[i]++;

  //Name, stamina, attack, accuracy, speed, critMult, crit%
  weapons[0] = new Weapon("Dagger", 9, 2, 90, 50, 2.5, 80);
  weapons[1] = new Weapon("Longsword", 6, 5, 80, 25, 1.5, 25);
  weapons[2] = new Weapon("Rapier", 6, 3, 90, 40, 2.0, 50);
  weapons[3] = new Weapon("Mace", 4, 10, 75, 15, 1.2, 20);
  weapons[4] = new Weapon("Greatsword", 4, 15, 70, 20, 1.1, 10);
  shield[0] = new Weapon("Shield", 0, 0, 0, 0, 0, 0, 20, 10);
  //Name, health, speed, accuracy, setNumber
  armorSet[0] = new Armor("Leather", 10, 20, 5, 0, "+ 10% Run Rate");
  armorSet[1] = new Armor("Chainmail", 20, 10, 0, 1, "+ 15% Attack");
  armorSet[2] = new Armor("Steel", 35, 0, 0, 2, "+ 50% Defence");

  for (int i = 0; i < weaponSelection.length; i++)
  {
    weaponSelection[i] = weapons[i];
  }

  main = new Menu();
  battlephase = new Battle();
  world = new World();
}



void draw() 
{
 //player[0].health = player[1].health = 70; ////////////////// MAKES PLAYER INVINCIBLE REMOVE WHEN DONE ///////////////////////////

  //main menu
  if (screen <= 3)
    main.display();
  //in game
  else if (screen == 5)
    world.display();
  if (encounter == true) 
    battlephase.display();
  if (muteMusic) {
    Player.pause();

  }
  mx = mouseX;
  my = mouseY; 


  main.mr = battlephase.mr = false;
}




void keyPressed() {
  world.kp = true;

  if (key == CODED && keyCode == UP || key == 'w') {
    up = true;
    world.mKey = true;
  }
  if (key == CODED && keyCode == DOWN || key == 's') {
    down = true;
    world.mKey = true;
  }
  if (key == CODED && keyCode == LEFT || key == 'a') {
    left = true;
    world.mKey = true;
  }
  if (key == CODED && keyCode == RIGHT || key == 'd') {
    right = true;
    world.mKey = true;
  }
  if (key == CODED && keyCode == SHIFT) {
    shift = true;
  }
  if (key == ENTER || key == RETURN) {
    enter = true;
  }
  if (key == BACKSPACE) {
    back = true;
  }
  if (key == ESC) {
    key =  0;
  }
  if (key == 0) {
    esc = true;
  }
}
void keyReleased() {
  world.kp = false;
  if (key == CODED && keyCode == UP || key == 'w') {
    up = false;
    world.mKey = false;
  }
  if (key == CODED && keyCode == DOWN || key == 's') {
    down = false;
    world.mKey = false;
  }
  if (key == CODED && keyCode == LEFT || key == 'a') {
    left = false;
    world.mKey = false;
  }
  if (key == CODED && keyCode == RIGHT || key == 'd') {
    right = false;
    world.mKey = false;
  }
  if (key == CODED && keyCode == SHIFT) {
    shift = false;
  }
  if (key  == ENTER || key == RETURN) {
    enter = false;
  }
  if (key == BACKSPACE) {
    back = false;
  }
  if (key == ESC) {
    key =  0;
  }
  if (key == 0) {
    esc = false;
  }
}

void mouseClicked() ////////////////////////////////////////////////////////////////////////
 {
 
 println(mx +" " + my); 
 }
 
void mouseReleased()
{
  main.mr = world.mr = battlephase.mr = true;
} 