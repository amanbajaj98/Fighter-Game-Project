class Fighter
{
  private PImage ryu;
  private PVector pos = new PVector();
  float jumpPowa = 5;
  float grav = -1;
  Fighter(float _x,float _y)
  {
    ryu = loadImage("ryu.png");
    pos.x = _x;
    pos.y = _y;
  }
  
  public void drawFighter()
  {
    image(ryu,pos.x,pos.y,150,300);
  }
  
  public void animateCharacter()
  {
    if(keyPressed)
    {
      if(key == 'd')
      {
        pos.x += 1;
      }
      if(key == 'a')
      {
        pos.x -= 1;
      }
      if(key == 'w')
      {
        pos.y += jumpPowa;
        jumpPowa += grav;
        if(pos.y >= 720);
        {
          pos.y = 720;
        }
      }
    }
  }
}