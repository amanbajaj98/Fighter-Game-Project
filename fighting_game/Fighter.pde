class Fighter
{
  private PImage image;
  private PVector pos = new PVector();
  private boolean jumped = false;
  private float jumpPowa = 5;
  private float grav = 0.1;
  private PVector size = new PVector(150,300);
  private float speed = 3;
  private boolean playerOne = false;
  private HealthBar healthBar;
  
  Fighter(float _x,float _y,String imgLoc,boolean player,boolean hbb)
  {
    healthBar = new HealthBar(hbb);
    image = loadImage(imgLoc);
    pos.x = _x;
    pos.y = _y;
    playerOne = player;
  }
  
  public void drawFighter()
  {
    image(image,pos.x,pos.y,size.x,size.y);
    healthBar.DrawHealthBar();
    healthBar.health();
  }
  
  public void animatePlayer()
  {
    if(keyPressed)
    {
      if(!playerOne)
      {
        if(key == 'd')
        {
          pos.x += speed;
        }
        if(key == 'a')
        {
          pos.x -= speed;
        }
        if(key == 'w')
        {
          jumped = true;
        }
      }
        if(playerOne && key == CODED)
        {
          if(keyCode == RIGHT)
          {
            pos.x += speed;
          }
          if(keyCode == LEFT)
          {
            pos.x -= speed;
          }
          if(keyCode == UP)
          {
            jumped = true;
          }
        }
    }
    
    if(jumped == true)
    {
      pos.y -= jumpPowa;
        jumpPowa -= grav;
        if(pos.y > 580 - size.y)
        {
          pos.y = 580 - size.y;
          jumpPowa = 5;
          jumped = false;
        }
    }
  }
  
  public void collision(Fighter other)
  {
    if(dist(pos.x,pos.y,other.pos.x,other.pos.y) <= 0.5)
    {
      
    }
  }
}