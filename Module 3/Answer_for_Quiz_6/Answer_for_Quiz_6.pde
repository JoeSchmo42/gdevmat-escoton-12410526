void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}

void draw()
{
  background(130);
 
  PVector mouse = mousePos();
  mouse.normalize().mult(300); // length of the lightsaber
 
  // The Glow
  strokeWeight(42);
  stroke(255, 0, 0, 90);
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);
 
  // Main blade
  strokeWeight(22);
  stroke(255, 40, 40); // brighter red core
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);
 
  // White part
  strokeWeight(8);
  stroke(255, 255, 255, 220);
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);
 
  // Handle
  strokeWeight(22);
  stroke(30, 30, 35);
  line(-mouse.x * 0.3, -mouse.y * 0.3, mouse.x * 0.3, mouse.y * 0.3);

  // Print magnitude to console using println()
  float magnitude = mouse.mag();
  println("One side magnitude: " + nf(magnitude, 0, 1) + " px");
}
