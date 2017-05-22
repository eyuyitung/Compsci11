/*compsci year end assignment
 group Eric, Brian, Kaizen
 assignement due may 24th
 */


boolean encounter = false;
boolean up, down, left, right, shift, enter, back, esc;
int screen = 0;
World world = new World();

PImage characterS;
PImage cslayout;
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
Entity[] enemy = new Entity[2];
Weapon[] weapons = new Weapon[5];
Weapon[] weaponSelection = new Weapon[5];
Menu main;
Items items = new Items();

Battle battlephase;

void setup() {
  size(1000, 800);
  frameRate(fr);
  characterS = loadImage("characterS.gif");
  cslayout = loadImage("RPG layout.png");
  startFont = createFont("Century Gothic Italic", 38);
  player[0] = new Entity();
  player[0].name = "Adam";
  player[1] = new Entity();
  player[1].name = "Someguy";
  weapons[0] = new Weapon("Dagger", 9, 2, 90, 50, 2.5, 80);
  weapons[1] = new Weapon("Longsword", 6, 5, 80, 25, 1.5, 30);
  weapons[2] = new Weapon("Rapier", 6, 3, 90, 40, 2.0, 75);
  weapons[3] = new Weapon("Mace", 4, 10, 75, 15, 1.2, 20);
  weapons[4] = new Weapon("Greatsword", 4, 15, 65, 20, 1.1, 15);
  for(int i = 0; i < weaponSelection.length; i++)
  {
    weaponSelection[i] = weapons[i];
  }
  
  
  main = new Menu();

  battlephase = new Battle();
  playerEncounter();
}

void playerEncounter()
{
  encounter = true;

  for (int i = 0; i < enemy.length; i++)
  {
    enemy[i] = new Entity(1, i);
  }


void draw() 
{
  //main menu
  if (screen <= 3)
    main.display();
  //in game
  if (screen == 5)
    world.display();
  if (screen == 5 && encounter == true)
    battlephase.display();
  mx = mouseX;
  my = mouseY; 
  main.mr = false;

  battlephase.mr = false;
  //println("Screen is " + screen + " + "+ battlephase.screen);
   println(mx +" "+ my);
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
  }
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
void mouseReleased()
{
  main.mr = world.mr = battlephase.mr = true;
} 