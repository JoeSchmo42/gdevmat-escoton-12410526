ArrayList<Walker> walkers = new ArrayList<Walker>();
BlackHole blackHole;

int resetInterval = 300;  // frames before the program resets
int frameCounter = 0;

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Sets up walker value idk
  for (int i = 0; i < 150; i++) 
  {
    walkers.add(new Walker());
  }
  
  resetSimulation();
}

void draw()
{
  background(0);
  
  
  // Renders the walkers
  for (Walker w : walkers)
  {
    w.update(blackHole);
    w.render();
  }
  
  blackHole.render();
  
  frameCounter++;
  
  // Reset EVERYTHING NOW!!!
  if (frameCounter >= resetInterval)
  {
    resetSimulation();
  }
}

// Reset the blackhole and balls
void resetSimulation()
{
  // Spawn black hole randomly within screen bounds
  float bhX = random(Window.left, Window.right);
  float bhY = random(Window.bottom, Window.top);
  blackHole = new BlackHole(bhX, bhY);
  
  // Spawn da balls
  for (Walker w : walkers)
  {
    w.resetPositionGaussian();
  }
  
  frameCounter = 0;
}
