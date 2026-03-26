class Walker
{
  PVector position = new PVector();
  PVector speed = new PVector(5, 8);
  
  void render()
  {
    
    //color switcharoo
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(50, 100);
    
    // the walker
    noStroke();
    fill(r, g, b, a);
    circle(position.x, position.y, 30);
    
    //speed
    position.add(speed);
  }
  
  void randomWalk()
  {
    // REMINDER: it only does 7, why does coding language work like this, who the hell counts starting at 0
    int choice = int(random(8));
    
    // To make the Walker look less weird (BIG STEP!!! WALK!!)
    float step = 5;
    
    // I refuse to go down the yansim way, I am NOT writing 6 if elses
    switch(choice)
    {
      case 0:           position.y += step;      break;  // down
      case 1:  position.x += step; position.y += step;    break;  // down-right
      case 2:  position.x += step;               break;  // right
      case 3:  position.x += step; position.y -= step;    break;  // up-right
      case 4:           position.y -= step;      break;  // up
      case 5:  position.x -= step; position.y -= step;    break;  // up-left
      case 6:  position.x -= step;               break;  // left
      case 7:  position.x -= step; position.y += step;    break;  // down-left
    }
  }
  //im too lazy to take those notes out
  //im gonna be honest sir, idk if you wanted me to keep the color changing but it gives character
  void moveAndBounce()
  {
    if((position.x > Window.right) || (position.x < Window.left))
  {
    speed.x *= -1;
  }
  if((position.y > Window.top) || (position.y < Window.bottom))
  {
    speed.y *= -1;
  }
  }
}
