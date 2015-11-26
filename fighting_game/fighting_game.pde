Fighter gohan;

void setup()
{
  size(800,720);
  gohan = new Fighter(600,420);
}

void draw()
{
  background(0);
  gohan.drawFighter();
}