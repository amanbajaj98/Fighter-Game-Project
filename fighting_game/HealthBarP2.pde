class HealthBarP2 extends HealthBarP1
{
  int x2;
  int y2;
  HealthBarP2()
  {
    super.c = color(70,150,120);
    super.w = 500;
    super.h = 50;
    x2 = 0;
    y2 = 25;
    super.damage = int(random(1,10));
  }
  public void DrawHealthBar2()
  {
    noStroke();
    fill(c,200);
    rect(x2,y2,w,h);
    fill(0,0,0,0.5);
    stroke(255);
    rect(0,25,500,50);
  }
  public void health2()
  {
    if(keyPressed == true)
    {
      if(key == 'd')
      {
        w -= damage;
        print("hello");
      }
      if (w > 450)
      {
        c = color(0,255,0);
      }
      if (w < 450 && w > 300)
      {
        c = color(242,255,0);
      }
      if (w < 300 && w > 200)
      {
        c = color(242,255,0);
      }
      if (w < 200 && w > 125)
      {
        c = color(255,187,0);
      }
      if (w < 125 && w > 0)
      {
        c = color(255,0,0);
      }
      if (w < 0)
      {
        c = color(0,0,0);
      }
    }
  }
  
}