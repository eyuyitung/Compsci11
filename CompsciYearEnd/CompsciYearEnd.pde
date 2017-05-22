/*compsci year end assignment
 group Eric, Brian, Kaizen
 assignement due may 24th
 */


boolean up, down, left, right, shift, enter, back, esc;
boolean mr;
int screen = 5;
World world;
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
int statpoints = 20;
PFont startFont;
Entity player = new Entity();
Menu main;
Items items = new Items();


void setup() {
  size(1000, 800);
  frameRate(fr);
  characterS = loadImage("characterS.gif");
  cslayout = loadImage("RPG layout.png");
  startFont = createFont("Century Gothic Italic", 38);
  main = new Menu();
  world = new World();
}

void draw() 
{
  //main menu
  if (screen <= 3)
    main.display();
  //in game
  if (screen == 5)
    world.display();
  mx = mouseX;
  my = mouseY; 
  main.mr = false;
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
  main.mr = world.mr = true;
} 