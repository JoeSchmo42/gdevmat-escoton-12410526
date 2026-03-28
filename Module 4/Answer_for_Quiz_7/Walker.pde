public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 8;   // slightly lower for better swarm feel
  public float scale = 15;
  
  public Walker()
  {
    // random velocity
    velocity = PVector.random2D().mult(random(1, 4));
  }
  
  public void update()
  {
    // accelerates to mouse
    PVector mousePos = new PVector(mouseX - width/2, mouseY - height/2);
    
    // Mouse tracker
    PVector direction = PVector.sub(mousePos, position);
    
    // normalizer
    if (direction.mag() > 0)
    {
      direction.normalize();
      direction.mult(0.2);
      this.acceleration = direction;
    }
    
    // updater
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }
  
  // the main thang
  public void render()
  {
    // they remind me of the bees from black mirror's hated by the nation
    strokeWeight(2);
    fill(180, 180, 180);           // light grey
    circle(position.x, position.y, scale);
  }
  
  // stay in the box NOOOO stay in the box NOOOOOO GET OUT OF MY SKIN!!!
  // i give up i dont wanna use switch case rn
  public void checkEdges()
  {
    if (this.position.x > Window.right)
    {
      this.position.x = Window.left;
    }
    else if (this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
 
    if (this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if (this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }
}
