public class Walker
{
  public float x;
  public float y;
  private float tx = 0, ty = 10000;
  private float tsize = 5000;
  
  void render()
  {
    
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(50, 100);
    float d = map(noise(tsize), 0, 1, 8, 120);
    
    noStroke();
    fill(r, g, b, a);
    circle(x, y, d);
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y =  map(noise(ty), 0, 1, -360, 360);
    
    tx += 0.01f;
    ty += 0.01f;
    
    tsize += 0.007f;
  }
}
