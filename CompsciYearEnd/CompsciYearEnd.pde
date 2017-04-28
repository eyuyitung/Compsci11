/*compsci year end assignment
 group Eric, Brian, Kaizen
 assignement due may 24th
 */


int pw = 40; // player width
int ph = 40; // player height
int s = 27; // player speed
boolean up,down,left,right;
int screen = 0;
PImage startScreen;
PImage characterS;
PImage cslayout;
int x = -1;
int y = -1;
import java.awt.*;
PFont startFont;
int[] startx = {750, 950, 950, 750};
int[] starty = {500, 500, 550, 550};
Polygon start = new Polygon(startx, starty, 4);
int[] helpx = {725, 815, 815, 725};
int[] helpy = {600, 600, 650, 650};
Polygon help = new Polygon(helpx, helpy, 4);
int[] configx = {700, 820, 820, 700};
int[] configy = {700, 700, 750, 750};
Polygon config = new Polygon(configx, configy, 4);
int[] csstartx = {900, 965, 965, 900};
int[] csstarty = {760,760, 790, 790};
Polygon csstart = new Polygon(csstartx, csstarty, 4);

void setup() {
  size(1000, 800);
  startScreen = loadImage("startscreen.gif");
  characterS = loadImage("characterS.gif");
  cslayout = loadImage("RPG layout.png");
  startFont = createFont("Century Gothic Italic",38);
}

void draw() {
 //Start screen
  if(screen == 0)
  {
    image(startScreen, 0,0);
    textFont(startFont);
    textAlign(TOP,TOP);
    //fill(0, 102, 153, 51);
    text("Start Game", 750, 500);
    strokeWeight(2);
    stroke(255);
    line(725,550,width,550);
    text("Help", 725, 600);
    line(700,650,width,650);
    text("Config", 700, 700);
    line(675,750,width,750);
  }
  //Character Selection
  if(screen == 1)
  {
    image(characterS, 0,0);
    image(cslayout, 0,0);
    textFont(startFont);
    textAlign(TOP, TOP);
    textSize(30);
    stroke(255);
    text("Start", 900,755);
    line(875, 790, width, 790);
  }
  //Help
  if(screen == 2)
  {
   background(21); 
  }
  //Config
  if(screen == 3)
  {
   background(81); 
  }
  //Battle
  if(screen == 10)
  {
   background(105); 
  }
  x = mouseX;
  y = mouseY; 
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
}

void mouseReleased()
{
 
  if (screen == 0 && start.contains(x, y))
    screen = 1;
  if (screen == 0 && help.contains(x, y))
    screen = 2;
  if (screen == 0 && config.contains(x,y))
    screen = 3;
  if (screen == 1 && csstart.contains(x,y))
    screen = 10;
  
} 