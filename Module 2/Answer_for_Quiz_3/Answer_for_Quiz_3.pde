void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw() {
  // Positioning
  float x = randomGaussian() * 220 + 0;
  float y = random(-height/2, height/2);
  
  // Size of the splots
  float size = randomGaussian() * 18 + 42;
  size = constrain(size, 8, 120);
  
  // Color Randomizer
  float r = random(100, 255);
  float g = random(40, 220);
  float b = random(80, 240);
  float alpha = random(10, 90);
  
  noStroke();
  fill(r, g, b, alpha);
  circle(x, y, size);
  
  // Trusty window cleaner
  if (frameCount % 300 == 0) {
    background(0);
  }
}
