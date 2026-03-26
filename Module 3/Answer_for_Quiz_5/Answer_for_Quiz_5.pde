void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker();

void draw()
{
  
  myWalker.randomWalk();
  myWalker.moveAndBounce();
  myWalker.render();
}
