Fighter playerOne;
Fighter playerTwo;

PImage background;
PImage p1;
PImage p2;
import ddf.minim.*;

AudioPlayer player;
Minim minim; 

HealthBarP1 p1Health;
HealthBarP2 p2Health;

void setup()
{
  size(800,720);
  playerOne = new Fighter(600,420,"ryu.png",true);
  playerTwo = new Fighter(200,420,"guile.png",false);
  background = loadImage("Background.jpg");
  p1 = loadImage("Ryu.jpg");
  p2 = loadImage("Guile.jpg");
  minim = new Minim(this);
  player = minim.loadFile("Theme.mp3", 2048);
  player.play();
  p1Health = new HealthBarP1();
  p2Health = new HealthBarP2();
}

void draw()
{
  background(82,212,255);
  image(background,0,0);
  p1Health.health();
  p1Health.DrawHealthBar1();
  p2Health.DrawHealthBar2();
  p2Health.health2();
  image(p1,100,650,50,50);
  image(p2,650,100,50,50);
  playerOne.drawFighter();
  playerOne.animatePlayer();
  playerTwo.drawFighter();
  playerTwo.animatePlayer();
}