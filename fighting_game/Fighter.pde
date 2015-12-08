class Fighter
{
  private PImage image;
  private PVector pos = new PVector();
  private boolean jumped = false;
  boolean right = false;
  boolean left = false;
  private float jumpPowa = 5;
  private float grav = 0.1;
  private PVector size = new PVector(150,300);
  private float speed = 3;
  private boolean playerOne;
  private HealthBar healthBar;
  private boolean flipped;
  private boolean punch;
  private String imageLocation;  
  PImage GIDLERIGHT;
  PImage GIDLELEFT;
  PImage GWALKINGRIGHT;
  PImage GWALKINGLEFT;
  PImage GJUMPINGRIGHT;
  PImage GJUMPINGLEFT;
  PImage GCROUCHINGRIGHT;
  PImage GCROUCHINGLEFT;
  PImage GATTACKINGRIGHT;
  PImage GATTACKINGLEFT;
  PImage RIDLERIGHT;
  PImage RIDLELEFT;
  PImage RWALKINGRIGHT;
  PImage RWALKINGLEFT;
  PImage RJUMPINGRIGHT;
  PImage RJUMPINGLEFT;
  PImage RCROUCHINGRIGHT;
  PImage RCROUCHINGLEFT;
  PImage RATTACKINGRIGHT;
  PImage RATTACKINGLEFT;
  
  Fighter(float _x,float _y,String imgLoc,boolean player,boolean hbb)
  {
    healthBar = new HealthBar(hbb);
    pos.x = _x;
    pos.y = _y;
    playerOne = player;
    imageLocation = imgLoc;
  }
  
  public void LoadImage()
  {
    GIDLERIGHT = loadImage("GIdle.png");
    GIDLELEFT = loadImage("GIdleL.png");
    GWALKINGRIGHT = loadImage("GWalk.png");
    GWALKINGLEFT = loadImage("GWalkL.png");
    GJUMPINGRIGHT = loadImage("GJump.png");
    GJUMPINGLEFT = loadImage("GJumpL.png");
    GCROUCHINGRIGHT = loadImage("GCrouch.png");
    GCROUCHINGLEFT = loadImage("GCrouchL.png");
    GATTACKINGRIGHT = loadImage("GPunchR.png");
    GATTACKINGLEFT = loadImage("GPunch.png");
    RIDLERIGHT = loadImage("RIdle.png");
    RIDLELEFT = loadImage("RIdleL.png");
    RWALKINGRIGHT = loadImage("RWalkRight.png");
    RWALKINGLEFT = loadImage("RWalkLeft.png");
    RJUMPINGRIGHT = loadImage("RJumpRIGHT.png");
    RJUMPINGLEFT = loadImage("RJumpLeft.png");
    RCROUCHINGRIGHT = loadImage("RCrouchRIGHT.png");
    RCROUCHINGLEFT = loadImage("RCrouchLeft.png");
    RATTACKINGRIGHT = loadImage("RPunchRIGHT.png");
    RATTACKINGLEFT = loadImage("RPunchLeft.png");
  }
  public void drawFighter()
  {
    image = loadImage(imageLocation);
    if(flipped)
    {
      pushMatrix();
      scale(-1,1);
      image(image,-pos.x,pos.y,size.x,size.y);
      popMatrix();
    }
    else
    {
      pushMatrix();
      image(image,pos.x-size.x,pos.y,size.x,size.y);
      popMatrix();
    }
    healthBar.DrawHealthBar();
    healthBar.health();
  }
  
  public void animatePlayer()
  {
    if(keyPressed)
    {
      if(!playerOne)
      {
        if(key == 'd' || key == 'D')
        {
          right = true; 
          imageLocation = "GWalk.png";
        }
        if(key == 'a' || key == 'A')
        {
          left = true;
        }
        if(key == 'w' || key == 'W')
        {
          jumped = true;
        }
      }
        if(playerOne && key == CODED)
        {
          if(keyCode == RIGHT)
          {
            right = true;
          }
          if(keyCode == LEFT)
          {
            left = true;
          }
          if(keyCode == UP)
          {
            jumped = true;
          }
        }
    }
    if(jumped)
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
    if(right)
    {
      pos.x += speed;
    }
    if(left)
    {
      pos.x -= speed;
    }
    
  }
  
  public void collision(Fighter other)
  {
    if(punch)
    {
      if(!playerOne)
      {
        if(!flipped)
        {
          if(pos.x + size.x >= other.pos.x && pos.x <= other.pos.x + other.size.x)
          {
            other.healthBar.damageMe();
          }
        }
        else
        {
          if(pos.x <= other.pos.x + size.x && pos.x >= other.pos.x)
          {
            other.healthBar.damageMe();
          }
        }
      }
      if(playerOne)
      {
        if(flipped)
        {
          if(pos.x + size.x >= other.pos.x && pos.x <= other.pos.x + other.size.x)
          {
            other.healthBar.damageMe();
          }
        }
        else
        {
          if(pos.x <= other.pos.x + size.x && pos.x >= other.pos.x)
          {
            other.healthBar.damageMe();
          }
        }
      }
    }
  }
  
  public void flip(Fighter other)
  {
    if(playerOne)
    {
      if(pos.x < other.pos.x)
      {
        flipped = true;
        other.flipped = true;
      }
      else
      {
        flipped = false;
        other.flipped = false;
      }
    }
  }
  
  public void punch()
  {
    if(playerOne)
    {
      if(keyPressed)
      {
        if(keyCode == SHIFT)
        {
          punch = true;
        }
      }
      if(punch)
      {
        imageLocation = "RPunchLeft.png";
      }
      else
      {
        imageLocation = "RIdleL.png";
      }
    }
    if(!playerOne)
    {
      if(keyPressed)
      {
        if(key == 'q' || key == 'Q')
        {
          punch = true;
        }
      }
      if(punch)
      {
        imageLocation = "GPunchR.png";
      }
      else
      {
        imageLocation = "GIdle.png";
      }
    }
  }
  
}