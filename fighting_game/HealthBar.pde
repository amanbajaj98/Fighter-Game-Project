class HealthBar
{
  boolean playerOne;
  int x;
  int y;
  float w;
  int h;
  color c;
  float damage;
  String s = "Player 1: Ryu";
  String s2 = "Player 2: Guile";
  String hlth;
  
 HealthBar(boolean P1)
  {
    if(P1 == true)
    {
      c = color(70,150,120);
      w = 500;
      h = 50;
      x = 775;
      y = 650;
      damage = 2;
      playerOne = true;
    }
    
    else
    {
      c = color(70,150,120);
      w = 500;
      h = 50;
      x = 0;
      y = 50;
      damage = 2;
      playerOne = false;
    }
  }
  public void DrawHealthBar()
  {
    if(playerOne)
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
    
    else
    {
      noStroke();
      fill(c,200);
      rect(x,y,w,h);
      fill(0,0,0,0.5);
      stroke(255);
      rect(0,50,500,50);
      fill(255);
      textSize(32);
      text(s2, 0, 0, 2100, 100);
    }
  }
  
  public void health()
  {
    if(w == 500)
    {
      hlth = "Player Health Level Full";
      fill(c);
      textSize(32);
      text(hlth, 275, 650, 2100, 100);
    }
    if (w < 500 && w > 450)
    {
      hlth = "Player Health Level High";
      fill(c);
      textSize(32);
      text(hlth, 275, 650, 2100, 100);
    }
    if (w < 450 && w > 300)
    {
      hlth = "Player Health Level Medium";
      fill(c);
      textSize(32);
      text(hlth, 275, 650, 2100, 100);
    }
    if (w < 300 && w > 200)
    {
      hlth = "Player Health Level Getting Low";
      fill(c);
      textSize(32);
      text(hlth, 275, 650, 2100, 100);
    }
    if (w < 200 && w > 125)
    {
      hlth = "Player Health Level Low";
      fill(c);
      textSize(32);
      text(hlth, 275, 650, 2100, 100);
    }
    if (w < 125 && w > 0)
    {
      hlth = "Player Health Level Critical";
      fill(c);
      textSize(32);
      text(hlth, 275, 650, 2100, 100);
    }
    if (w < 0)
    {
      hlth = "Player Health Level Fainted";
      fill(255);
      textSize(32);
      text(hlth, 275, 650, 2100, 100);
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
  
  public void damageMe()
  {
    if(w > -1)
    {
      w -= damage;
    }
  }
}