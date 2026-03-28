public class Walker
{
  PVector position;
  PVector velocity;
  float scale;
  color col;
  
  public Walker()
  {
    resetPositionGaussian();
    velocity = new PVector(0, 0);
    
    // Random scale and color
    scale = random(4, 18);
    col = color(random(100, 255), random(100, 255), random(150, 255));
  }
  
  // reset
  void resetPositionGaussian()
  {
    float stdDevX = Window.windowWidth / 4.0;
    float stdDevY = Window.windowHeight / 4.0;
    
    position = new PVector(
      randomGaussian() * stdDevX,
      randomGaussian() * stdDevY
    );
    
    // so my balls stay in place (they stay inside the window)
    position.x = constrain(position.x, Window.left * 0.95, Window.right * 0.95);
    position.y = constrain(position.y, Window.bottom * 0.95, Window.top * 0.95);
  }
  
  void update(BlackHole bh)
  {
    // Goes in the blackhole
    PVector direction = PVector.sub(bh.position, position);
    
    // makes it less wonky
    direction.normalize();
    
    // Speed I am speed kchowww vrvrvvrvrvrvrvrvrvvrvrvrrrr
    float speed = 5;
    velocity = PVector.mult(direction, speed);
    
    // Move
    position.add(velocity);
    
  }
  
  void render()
  {
    noStroke();
    fill(col);
    circle(position.x, position.y, scale);
  }
}
