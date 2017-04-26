/*compsci year end assignment
 group Eric, Brian, Kaizen
 assignement due may 24th
 */

int x=200, y = 200;
int pw = 40; // player width
int ph = 40; // player height
int s = 27; // player speed
boolean up,down,left,right;

void setup() {
  size(1000, 800);
}

void draw() {
  background(255);
  rect(x, y, pw, ph);
  println(x + " " + y);
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