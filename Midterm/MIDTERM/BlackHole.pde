public class BlackHole
{
  PVector position;
  float scale = 50;
  
  public BlackHole(float x, float y)
  {
    position = new PVector(x, y);
  }
  
  void render()
  {
    noStroke();
    fill(255);  // White
    circle(position.x, position.y, scale);
    
    // Why not, its an inverted blackhole, it glows now
    fill(255, 200);
    circle(position.x, position.y, scale * 1.4);
  }
}
