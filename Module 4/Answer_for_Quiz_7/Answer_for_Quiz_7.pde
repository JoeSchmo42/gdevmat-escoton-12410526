Walker[] walkers = new Walker[100];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // last man standing to survive 100 bees gets 1000 dollars!!! (create 100 walkers)
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    
    // random position for walkers
    walkers[i].position.x = random(Window.left, Window.right);
    walkers[i].position.y = random(Window.bottom, Window.top);
    
    // random size for walkers
    walkers[i].scale = random(8, 35);
  }
}

void draw()
{
  background(80);
  
  // updates and render
  for (Walker w : walkers) //thank you renpy and sql for reminding me of these shortcuts
  {
    w.update();
    w.render();
    w.checkEdges();
  }
}
