Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // RELEASE THE BALLS!!
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    
    walkers[i].mass = i + 1;                    // mass from 1 to 10
    walkers[i].scale = walkers[i].mass * 15;    // scale = mass * 15
    
    // random colors cause i give up trying to color code em
    walkers[i].setColor(color(random(255), random(255), random(255)));
    
    // they are positioned in the same place
    walkers[i].position.set(-500, 200);
  }
}

void draw()
{
  background(80);
  
  for (Walker w : walkers)
  {
    w.update();
    w.applyForce(wind);
    w.applyForce(gravity);
    w.checkEdges();
    
    w.render();
  }
}
