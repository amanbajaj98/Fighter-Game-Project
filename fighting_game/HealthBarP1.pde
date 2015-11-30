class HealthBarP1
{
  int x;
  int y;
  int w;
  int h;
  color c;
  int damage;
  String s = "Player 1: Ryu";
  String hlth = "Player Health Level Full";
  
 HealthBarP1()
  {
    c = color(70,150,120);
    w = 500;
    h = 50;
    x = 775;
    y = 650;
    damage = int(random(1,10));
  }
  public void DrawHealthBar1()
  {
    noStroke();
    fill(c,200);
    rect(x,y,w,h);
    fill(0,0,0,0.5);
    stroke(255);
    rect(775,650,500,50);
    fill(255);
    textSize(32);
    text(s, 775, 600, 2100, 100);    
  }
  public void health()
  {
    if(w == 500)
    {
      fill(c);
      textSize(32);
      text(hlth, 275, 650, 2100, 100);
    }
    if (w < 500 && w > 450)
    {
      String hlth = "Player Health Level High";
      fill(c);
      textSize(32);
      text(hlth, 275, 650, 2100, 100);
    }
    if (w < 450 && w > 300)
    {
      String hlth = "Player Health Level Medium";
      fill(c);
      textSize(32);
      text(hlth, 275, 650, 2100, 100);
    }
    if (w < 300 && w > 200)
    {
      String hlth = "Player Health Level Getting Low";
      fill(c);
      textSize(32);
      text(hlth, 275, 650, 2100, 100);
    }
    if (w < 200 && w > 125)
    {
      String hlth = "Player Health Level Low";
      fill(c);
      textSize(32);
      text(hlth, 275, 650, 2100, 100);
    }
    if (w < 125 && w > 0)
    {
      String hlth = "Player Health Level Critical";
      fill(c);
      textSize(32);
      text(hlth, 275, 650, 2100, 100);
    }
    if (w < 0)
    {
      String hlth = "Player Health Level Fainted";
      fill(255);
      textSize(32);
      text(hlth, 275, 650, 2100, 100);
    }
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