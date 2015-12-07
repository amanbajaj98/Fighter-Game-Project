import processing.serial.*;

Fighter playerOne;
Fighter playerTwo;


PImage background;
PImage p1;
PImage p2;

import ddf.minim.*;

AudioPlayer player;
Minim minim; 

void setup()
{
  size(1280,720);
  playerOne = new Fighter(600,280,"ryu.png",true,true);
  playerTwo = new Fighter(200,280,"guile.png",false,false);
  background = loadImage("Background.jpg");
  p1 = loadImage("Ryu.jpg");
  p2 = loadImage("Guile.jpg");
  minim = new Minim(this);
  player = minim.loadFile("Theme.mp3", 2048);
  player.play();
}

void draw()
{
  background(82,212,255);
  image(background,0,0);
  playerOne.drawFighter();
  playerOne.animatePlayer();
  playerTwo.drawFighter();
  playerTwo.animatePlayer();
  playerOne.collision(playerTwo);
  playerTwo.collision(playerOne);
<<<<<<< HEAD
  playerOne.flip(playerTwo);
  playerOne.punch();
  playerTwo.punch();
}

public void keyReleased()
{
  if(keyCode == LEFT)
  {
    playerOne.left = false;
  }
  if(keyCode == RIGHT)
  {
    playerOne.right = false;
  }
  if(keyCode == SHIFT)
  {
    playerOne.punch = false;
  }
  if(key == 'a' || key == 'A')
  {
    playerTwo.left = false;
  }
  if(key == 'd' || key == 'D')
  {
    playerTwo.right = false;
  }
  if(key == 'q' || key == 'Q')
  {
    playerTwo.punch = false;
  }
=======
  image(p1,200,650,50,50);
  image(p2,1000,50,50,50);
>>>>>>> origin/master
}