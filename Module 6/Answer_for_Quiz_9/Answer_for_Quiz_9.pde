Walker[] walkers = new Walker[8];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  resetWalkers();
}

void resetWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    
    //the line of horses lol (traits of each ball small to big yeah yeah you get it)
    walkers[i].mass = walkers.length - i;
    walkers[i].scale = walkers[i].mass * 15;
    
    // random colors go!!
    walkers[i].setColor(color(random(100, 255), random(100, 255), random(100, 255)));
    
    // Positioning
    float spacing = Window.windowHeight * 2.0 / (walkers.length + 1);
    walkers[i].position.set(Window.left + walkers[i].scale/2 + 50, spacing * (i + 1) - Window.windowHeight);
    
    // Start with zero velocity and acceleration
    walkers[i].velocity.set(0, 0);
    walkers[i].acceleration.set(0, 0);
    
  }
}

void draw()
{
  background(200);  // it was too painful to make it white
  
  // speed bump lol
  stroke(0, 0, 0);
  strokeWeight(4);
  line(0, Window.bottom + 30, 0, Window.top - 30);
  noStroke();
  
  PVector constantAccel = new PVector(0.2, 0);   // Constant push to the right
  
  for (Walker w : walkers)
  {
    //friction
    float mew = (w.position.x > 0) ? 0.4f : 0.01f;
    float normal = 1.0;
    
    //copies current velocity
    PVector friction = w.velocity.copy();
    
    if (friction.mag() > 0.001)
    {
      friction.mult(-1);
      friction.normalize();
      friction.mult(mew * normal);
      w.applyForce(friction);
    }
    
    w.applyForce(constantAccel);
    w.update();
    w.checkEdges();
    w.render();
    
  }
}

// hold your horses (resets the balls)
void mousePressed()
{
  resetWalkers();
}
