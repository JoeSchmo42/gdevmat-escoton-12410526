class Walker
{
  float x = 0;
  float y = 0;
  
  void render()
  {
    
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(50, 100);
    
    noStroke();
    fill(r, g, b, a);
    circle(x, y, 30);
  }
  
  void randomWalk()
  {
    // REMINDER: it only does 7, why does coding language work like this, who the hell counts starting at 0
    int choice = int(random(8));
    
    // To make the Walker look less weird (BIG STEP!!! WALK!!)
    float step = 10;
    
    // I refuse to go down the yansim way, I am NOT writing 6 if elses
    switch(choice)
    {
      case 0:           y += step;      break;  // down
      case 1:  x += step; y += step;    break;  // down-right
      case 2:  x += step;               break;  // right
      case 3:  x += step; y -= step;    break;  // up-right
      case 4:           y -= step;      break;  // up
      case 5:  x -= step; y -= step;    break;  // up-left
      case 6:  x -= step;               break;  // left
      case 7:  x -= step; y += step;    break;  // down-left
    }
  }
  
  void randomWalkBiased()
  {
    // 40% right
    // 20% left
    // 20% up
    // 20% down
    float r = random(1);
    
    float step = 10;
    
    if      (r < 0.40) { x += step; }          // right
    else if (r < 0.60) { x -= step; }          // left
    else if (r < 0.80) { y -= step; }          // up
    else               { y += step; }          // down
  }
}
