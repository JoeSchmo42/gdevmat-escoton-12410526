public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 15;
  public float scale = 15;
  public float mass = 1;
  
  private color col = color(255);
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  public void update()
  {
    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    position.add(velocity);
    
    // resets acceleration
    acceleration.mult(0);
  }
  
  public void render()
  {
    fill(col);
    circle(position.x, position.y, scale);
  }
  
  public void setColor(color c)
  {
    this.col = c;
  }
  
  public void checkEdges()
  {

    if (position.x > Window.right - scale/2)
    {
      position.x = Window.right - scale/2;
      velocity.x *= -0.8;
    }

    else if (position.x < Window.left + scale/2)
    {
      position.x = Window.left + scale/2;
      velocity.x *= -0.8;
    }

    if (position.y > Window.top - scale/2)
    {
      position.y = Window.top - scale/2;
      velocity.y = 0;
    }

    else if (position.y < Window.bottom + scale/2)
    {
      position.y = Window.bottom + scale/2;
      velocity.y = 0;
    }
  }
}
