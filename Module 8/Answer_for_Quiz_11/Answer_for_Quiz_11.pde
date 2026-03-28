Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    
    // Random Position
    walkers[i].position = new PVector(
      random(Window.left + 50, Window.right - 50),
      random(Window.bottom + 50, Window.top - 50)
    );
    
    // Random Mass
    walkers[i].mass = random(5, 35);
    
    // Scales Balls
    walkers[i].scale = walkers[i].mass * 8;
    
    // Random ahh colors
    walkers[i].r = random(100, 255);
    walkers[i].g = random(100, 255);
    walkers[i].b = random(100, 255);
    walkers[i].a = 220;

  }
}

void draw()
{
  background(200);
  
  // Dear god, all the walkers are polyamorous
  for (int i = 0; i < walkers.length; i++)
  {
    for (int j = 0; j < walkers.length; j++)
    {
      if (i != j) {
        PVector force = walkers[j].calculateAttraction(walkers[i]);
        walkers[i].applyForce(force);
      }
    }
  }
  
  // Update and render
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].update();
    walkers[i].checkEdges();
    walkers[i].render();
  }
}
