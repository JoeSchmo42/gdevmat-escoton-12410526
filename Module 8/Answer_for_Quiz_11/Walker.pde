public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 12;
  public float scale = 15;
  public float mass = 1;
  
  public float r = 255, g = 255, b = 255, a = 255;
  
  public float gravitationalConstant = 1.0;

  public Walker()
  {
    // Random Velocity
    velocity = new PVector(random(-2, 2), random(-2, 2));
  }

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
    acceleration.mult(0); // Reset acceleration
  }

  public void render()
  {
    noStroke();
    fill(r, g, b, a);
    circle(position.x, position.y, scale);
  }

  public PVector calculateAttraction(Walker other)
  {
    PVector force = PVector.sub(this.position, other.position);
    float distance = force.mag();
    
    // So the balls don't start going crazy
    distance = constrain(distance, 8, 40);
    
    force.normalize();
    
    float strength = (this.gravitationalConstant * this.mass * other.mass) / (distance * distance);
    
    force.mult(strength);
    return force;
  }


// the walls HES IN THE WALLS
  public void checkEdges()
  {
    float halfScale = scale / 2;
    
    if (position.x > Window.right - halfScale)
    {
      position.x = Window.right - halfScale;
      velocity.x *= -0.85;
    } 
    else if (position.x < Window.left + halfScale)
    {
      position.x = Window.left + halfScale;
      velocity.x *= -0.85;
    }
    
    if (position.y > Window.top - halfScale)
    {
      position.y = Window.top - halfScale;
      velocity.y *= -0.85;
    } 
    else if (position.y < Window.bottom + halfScale)
    {
      position.y = Window.bottom + halfScale;
      velocity.y *= -0.85;
    }
  }
}
