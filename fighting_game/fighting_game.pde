Fighter playerOne;
Fighter playerTwo;

void setup()
{
  size(800,720);
  playerOne = new Fighter(600,420,"ryu.png",true);
  playerTwo = new Fighter(200,420,"guile.png",false);
}

void draw()
{
  background(0);
  playerOne.drawFighter();
  playerOne.animatePlayer();
  playerTwo.drawFighter();
  playerTwo.animatePlayer();
}