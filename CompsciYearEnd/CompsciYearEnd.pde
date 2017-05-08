/*compsci year end assignment
 group Eric, Brian, Kaizen
 assignement due may 24th
 */


boolean up, down, left, right, enter, back;
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
int statpoints = 20;
PFont startFont;
Entity player = new Entity();
Menu main; 


//Menu button hitboxes
int[] startx = {750, 950, 950, 750};
int[] starty = {500, 500, 550, 550};
Polygon start = new Polygon(startx, starty, 4);
int[] helpx = {725, 815, 815, 725};
int[] helpy = {600, 600, 650, 650};
Polygon help = new Polygon(helpx, helpy, 4);
int[] configx = {700, 820, 820, 700};
int[] configy = {700, 700, 750, 750};
Polygon config = new Polygon(configx, configy, 4);

//Character selection button hitboxes
int[] csstartx = {900, 965, 965, 900};
int[] csstarty = {760, 760, 790, 790};
Polygon csstart = new Polygon(csstartx, csstarty, 4);
int[] csbackx = {35, 105, 105, 35};
int[] csbacky = {755, 755, 785, 785};
Polygon csback = new Polygon(csbackx, csbacky, 4);

//Shorter Character selection stats button htiboxes code
int[] hpattdefspdsubx = {688, 667, 688};
int[] hpattdefspdaddx = {759, 780, 759};
int[] healthsubaddy = {272, 292, 311};
int[] attacksubaddy = {401, 421, 440};
int[] defencesubaddy = {530, 550, 569};
int[] speedsubaddy = {659, 679, 698};
Polygon healthsub = new Polygon(hpattdefspdsubx, healthsubaddy, 3);
Polygon healthadd = new Polygon(hpattdefspdaddx, healthsubaddy, 3);
Polygon attacksub = new Polygon(hpattdefspdsubx, attacksubaddy, 3);
Polygon attackadd = new Polygon(hpattdefspdaddx, attacksubaddy, 3);
Polygon defencesub = new Polygon(hpattdefspdsubx, defencesubaddy, 3);
Polygon defenceadd = new Polygon(hpattdefspdaddx, defencesubaddy, 3);
Polygon speedsub = new Polygon(hpattdefspdsubx, speedsubaddy, 3);
Polygon speedadd = new Polygon(hpattdefspdaddx, speedsubaddy, 3);

void setup() {
  size(1000, 800);
  frameRate(fr);
  characterS = loadImage("characterS.gif");
  cslayout = loadImage("RPG layout.png");
  startFont = createFont("Century Gothic Italic", 38);

  main = new Menu(0);
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
  println(screen);
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
} 