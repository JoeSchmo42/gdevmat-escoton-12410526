void setup()
{
  size(1280, 720, P3D); // set window size to 1280 x 720, P3D makes the environment 3D
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0); // Centers the camera
}

Walker myWalker = new Walker(); // creates an instance of our walker class here in sketch
Walker biasedWalker = new Walker(); // this cheeky guy

void draw()
{
  
  //up = 0
  //down = 1
  //right = 2
  //left = 3
  
  //NOTE: float has decimals, int contains whole numbers only
  
  myWalker.randomWalk();
  myWalker.render();
  
  biasedWalker.randomWalkBiased();
  biasedWalker.render();
}
