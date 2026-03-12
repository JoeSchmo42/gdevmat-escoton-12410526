void setup()
{
  size(1280, 720, P3D); // set window size to 1280 x 720, P3D makes the environment 3D
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0); // Centers the camera
}
void draw()
{
  background(0);
  drawCartesianPlane();
  drawQuadraticFunction();
  drawLinearFunction();
  drawSineWave();
}
void drawCartesianPlane()
{
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  for (int i = -300; i <= 300; i += 10) // loop
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}
void drawQuadraticFunction()
{
  /*
  f(x) = x^2 - 15x-3
  (0, -3);
  */
  color yellow = color(255, 255, 0);
  fill(yellow);
  noStroke();
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x * 10, (x * x) - (15 * x - 3), 5);
  }
}
void drawLinearFunction()
{
  color purple = color(200, 0, 255);
  fill(purple);
  noStroke();
  for (float x = -30; x <= 30; x += 0.01f)
  {
    circle(x * 10, (-5 * x) + 30, 5);
  }
}
void drawSineWave()
{
  color cyan = color(0, 220, 255);
  fill(cyan);
  noStroke();
  
  float amplitude = 50;
  float frequency = 1;     // → ~5× more waves than original
  
  for (float x = -30; x <= 30; x += 0.01f)
  {
    circle(x * 10, amplitude * sin(x * frequency), 5);
  }
}
