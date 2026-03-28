Walker[] walkers = new Walker[10];
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // creates walkers and spaces them
  float spacing = Window.right * 1.8f / 9;
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    
    // Positions balls
    walkers[i].position.x = Window.left + spacing * i + spacing/2;
    walkers[i].position.y = Window.top + 50;
    // Random colors
    walkers[i].r = random(50, 255);
    walkers[i].g = random(50, 255);
    walkers[i].b = random(50, 255);
    
    // Randomize Mass
    walkers[i].mass = random(2, 8);
    
    // Scales according to walker mass
    walkers[i].scale = walkers[i].mass * 10;
  }
}

void draw()
{
  background(255);
 
  ocean.render();
 
  for (Walker w : walkers)
  {
    // Wind
    PVector wind = new PVector(0.1, 0);
    w.applyForce(wind);
   
    // Gravity
    PVector gravity = new PVector(0, -0.15f * w.mass);
    w.applyForce(gravity);
   
    // Friction
    float c = 0.15f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = w.velocity.copy();
    // F= -uNv
    w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
   
    // Drag Force
    if (ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
   
    w.update();
    w.render();
   
    //keeps the balls in
    if (w.position.x < Window.left + w.scale/2)
    {
      w.position.x = Window.left + w.scale/2;
      w.velocity.x *= -0.8;
    }
    else if (w.position.x > Window.right - w.scale/2)
    {
      w.position.x = Window.right - w.scale/2;
      w.velocity.x *= -0.8;
    }
    
    
    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -0.8;
    }
    
    if (w.position.y > Window.top)
    {
      w.position.y = Window.top;
      w.velocity.y *= -0.5;
    }
  }
}
