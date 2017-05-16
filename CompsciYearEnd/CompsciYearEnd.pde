/*compsci year end assignment
 group Eric, Brian, Kaizen
 assignement due may 24th
 */

boolean encounter = false;
boolean up, down, left, right, enter, back;
int screen = 10;
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
Entity[] enemy = new Entity[1];

Menu main;

Battle battlephase;

void setup() {
  size(1000, 800);
  frameRate(fr);
  characterS = loadImage("characterS.gif");
  cslayout = loadImage("RPG layout.png");
 
  startFont = createFont("Century Gothic Italic", 38);
  player[0] = new Entity();
  player[1] = new Entity();
  enemy[0] = new Entity();
  main = new Menu();
  battlephase = new Battle();
  playerEncounter();
}


void draw() 
{
  //main menu
  if (screen <= 3)
    main.display();
  //in game
  if (screen == 5)
    world.display();
  if (/*screen == 5 &&*/ encounter == true)

    battlephase.display();

  mx = mouseX;
  my = mouseY; 
  main.mr = false;
  battlephase.mr = false;
  println("Screen is " + screen + " + "+ battlephase.screen);
}

void keyPressed() {
  if (key == CODED && keyCode == UP || key == 'w') {
    up = true;
  }
  if (key == CODED && keyCode == DOWN || key == 's') {
    down = true;
  }
  if (key == CODED && keyCode == LEFT || key == 'a') {
    left = true;
  }
  if (key == CODED && keyCode == RIGHT || key == 'd') {
    right = true;
  }
  if (key == ENTER || key == RETURN) {
    enter = true;
  }
  if (key == BACKSPACE) {
    back = true;
  }
}
void keyReleased() {
  if (key == CODED && keyCode == UP || key == 'w') {
    up = false;
  }
  if (key == CODED && keyCode == DOWN || key == 's') {
    down = false;
  }
  if (key == CODED && keyCode == LEFT || key == 'a') {
    left = false;
  }
  if (key == CODED && keyCode == RIGHT || key == 'd') {
    right = false;
  } 
  if (key  == ENTER || key == RETURN) {
    enter = false;
  }
  if (key == BACKSPACE) {
    back = false;
  }
}
void mouseReleased()
{
  main.mr = true;
  battlephase.mr = true;
} 