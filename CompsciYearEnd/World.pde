//class for traversable world and main exploratory portion of game
//includes sidebars and menu pieces on basic game screeen

class World
{
  int xpos;
  int ypos;
  boolean moving = false;
  int speed;






  void display()
  {
    background(255);
    // display character  
    // display background
    // display world elements
    // display menu button
    // display health and exp
    // display
  }

  void player(int x, int y)
  {
    if (moving == true) {
    }
    // draw player gif at x,y
  }
  void move (int dir) {
    if (dir != 0) {
      if (dir == 1) //right
        xpos += speed;
      if (dir == -1) // left
        xpos -= speed;
      if (dir == 2) //down
        ypos += speed;
      if (dir == -2)
        ypos -= speed;
      moving = true;
    }
  }
}