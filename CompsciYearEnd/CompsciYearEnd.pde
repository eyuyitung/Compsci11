/*compsci year end assignment
 group Eric, Brian, Kaizen
 assignement due may 24th
 
 */
int x=200, y = 200;
int pw = 40; // player width
int ph = 40; // player height
int s = 27; // player speed


void setup() {
  size(1000, 800);
}

void draw() {
  background(255);
  rect(x, y, pw, ph);
  println(x + " " + y);
}

void keyReleased() {
  if (key == CODED && keyCode == UP || key == 'w') {
    if (y - s <= 0)
      y = 0;
    else if (y >= 0) 
      y-=s;
  }
  if (key == CODED && keyCode == DOWN || key == 's') {
    if (y + s >= height - ph)
      y= height - ph;
    else if (y <= height)
      y+=s;
  }

  if (key == CODED && keyCode == LEFT || key == 'a') {
    if (x-s <=0)
      x=0;
    else if (x >= 0)
      x-=s;
  }

  if (key == CODED && keyCode == RIGHT || key == 'd') {
    if (x + s >=width-pw)
      x = width - pw;
    else if (x <= width - pw)
      x+=s;
  }
}