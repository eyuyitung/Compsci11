/*compsci year end assignment
 group Eric, Brian, Kaizen
 assignement due may 24th
 */


int pw = 40; // player width
int ph = 40; // player height
int s = 27; // player speed
boolean up, down, left, right;
int screen = 0;
PImage pic1, pic2, pic3, pic4, pic5, pic6, pic7, pic8;
PImage characterS;
PImage cslayout;
int x = -1;
int y = -1;
import java.awt.*;
int statpoints = 20;
PFont startFont;


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

/*Character selection stats button hitboxes
 int[] healthsubx = {688, 667, 688};
 int[] healthsuby = {272, 292, 311};
 Polygon healthsub = new Polygon(healthsubx, healthsuby, 3);
 int[] healthaddx = {759, 780, 759};
 int[] healthaddy = {272, 292, 311};
 Polygon healthadd = new Polygon(healthaddx, healthaddy, 3);
 int[] attacksubx = {688, 667, 688};
 int[] attacksuby = {401, 421, 440};
 Polygon attacksub = new Polygon(attacksubx, attacksuby, 3);
 int[] attackaddx = {759, 780, 759};
 int[] attackaddy = {401, 421, 440};
 Polygon attackadd = new Polygon(attackaddx, attackaddy, 3);
 int[] defencesubx = {688, 667, 688}; 
 int[] defencesuby = {530, 550, 569};
 Polygon defencesub = new Polygon(defencesubx, defencesuby, 3);
 int[] defenceaddx = {759, 780, 759};
 int[] defenceaddy = {530, 550, 569};
 Polygon defenceadd = new Polygon(defenceaddx, defenceaddy, 3);
 int[] speedsubx = {688, 667, 688};
 int[] speedsuby = {659, 679, 698};
 Polygon speedsub = new Polygon(speedsubx, speedsuby, 3);
 int[] speedaddx = {759, 780, 759};
 int[] speedaddy = {659, 679, 698};
 Polygon speedadd = new Polygon(speedaddx, speedaddy, 3);
 */

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











Entity character1 = new Entity();




void setup() {
  size(1000, 800);
  pic1 = loadImage("1.gif");
  pic2 = loadImage("2.gif");
  pic3 = loadImage("3.gif");
  pic4 = loadImage("4.gif");
  pic5 = loadImage("5.gif");
  pic6 = loadImage("6.gif");
  pic7 = loadImage("7.gif");
  pic8 = loadImage("8.gif");
  frameRate(5);
  characterS = loadImage("characterS.gif");
  cslayout = loadImage("RPG layout.png");
  startFont = createFont("Century Gothic Italic", 38);
}

void draw() {
  //Start screen
  if (screen == 0)
  {
    if (frameCount % 8 == 0)
    {
      image(pic1, 0, 0);
    }
    if (frameCount % 8 == 1)
    {
      image(pic2, 0, 0);
    }
    if (frameCount % 8 == 2)
    {
      image(pic3, 0, 0);
    }
    if (frameCount % 8 == 3)
    {
      image(pic4, 0, 0);
    }
    if (frameCount % 8 == 4)
    {
      image(pic5, 0, 0);
    }
    if (frameCount % 8 == 5)
    {
      image(pic6, 0, 0);
    }
    if (frameCount % 8 == 6)
    {
      image(pic7, 0, 0);
    }
    if (frameCount % 8 == 7)
    {
      image(pic8, 0, 0);
    } 
    textFont(startFont);
    textAlign(TOP, TOP);
    //fill(0, 102, 153, 51);
    text("Start Game", 750, 500);
    strokeWeight(2);
    stroke(255);
    line(725, 550, width, 550);
    text("Help", 725, 600);
    line(700, 650, width, 650);
    text("Config", 700, 700);
    line(675, 750, width, 750);
  }
  //Character Selection
  if (screen == 1)
  {
    
    image(characterS, 0, 0);
    image(cslayout, 0, 0);
    textFont(startFont);
    textAlign(TOP, TOP);
    textSize(30);
    stroke(255);
    text("Back", 35, 755);
    line(0, 790, 125, 790);
    text("Start", 900, 755);
    line(875, 790, width, 790);

    textAlign(CENTER, CENTER);
    text(character1.health, 727, 291);
    text(character1.attack, 726, 420);
    text(character1.defence, 726, 549);
    text(character1.speed, 726, 678);
    textSize(17);
    text(statpoints, 925, 131);
  }
  //Help
  if (screen == 2)
  {
    background(21);
  }
  //Config
  if (screen == 3)
  {
    background(81);
  }
  //Battle
  if (screen == 10)
  {
    background(105);
  }
  x = mouseX;
  y = mouseY; 
  println("x = " + x);
  println("y = " + y);
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
  //Screenswitching
  if (screen == 0 && start.contains(x, y))
  {
    screen = 1;
    frameRate(60);
  }
  if (screen == 0 && help.contains(x, y))
    screen = 2;
  if (screen == 0 && config.contains(x, y))
    screen = 3;
  if (screen == 1 && csstart.contains(x, y))
    screen = 10;
  if (screen == 1 && csback.contains(x, y))
  {
    screen = 0;
    character1.health = 50;
    character1.attack = 5;
    character1.defence = 5;
    character1.speed = 5;
    frameRate(6);
  }
  //stat changing
  if (statpoints <= 20)
  {
    if (screen == 1 && healthsub.contains(x, y) && character1.health > 50)
    {
      character1.health -= 1;
      statpoints += 1;
    }
    if (screen == 1 && attacksub.contains(x, y) && character1.attack > 5)
    {
      character1.attack -= 1;
      statpoints +=1;
    } 
    if (screen == 1 && defencesub.contains(x, y) && character1.defence > 5)
    {
      character1.defence -= 1;
      statpoints +=1;
    }
    if (screen == 1 && speedsub.contains(x, y) && character1.speed > 5)
    {
      character1.speed -= 1;
      statpoints += 1;
    } else if (statpoints > 0)
    {
      if (screen ==1 && healthadd.contains(x, y))
      {
        character1.health += 1;
        statpoints -= 1;
      }
      if (screen == 1 && attackadd.contains(x, y))
      {
        character1.attack += 1;
        statpoints -= 1;
      }
      if (screen == 1 && defenceadd.contains(x, y))
      {
        character1.defence += 1;
        statpoints -= 1;
      }
      if (screen == 1 && speedadd.contains(x, y))
      {
        character1.speed += 1;
        statpoints -= 1;
      }
    }
  }
} 