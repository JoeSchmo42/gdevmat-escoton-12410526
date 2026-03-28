public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  
  public float mass = 1;
  
  public float r = 255, g = 255, b = 255, a = 255;
  
  public Walker ()
  {
    
  }
  //Newton Second Law
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); //force accumulation
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void render()
  {
    fill (r, g, b, a);
    circle(position.x, position.y, scale);
  }
}
