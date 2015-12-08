import processing.serial.*;
Serial myPort;
String val;
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
  String portName = Serial.list()[7]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600); 
  myPort.bufferUntil('\n');
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
  playerOne.flip(playerTwo);
  playerOne.punch();
  playerTwo.punch();
  image(p1,200,650,50,50);
  image(p2,1000,50,50,50);
}

void keyReleased()
{
  if(keyCode == LEFT)
  {
    playerOne.left = false;
  }
  if(keyCode == RIGHT)
  {
    playerOne.right = false;
  }
  if(key == 'a' || key == 'A')
  {
    playerTwo.left = false;
  }
  if(key == 'd' || key == 'D')
  {
    playerTwo.right = false;
  }
}

void serialEvent(Serial myPort)
{
  String inString = myPort.readStringUntil('\n');
  
  if(inString != null)
  {
    inString = trim(inString);
    float[] vals = float(split(inString,","));
  
    float forceP1 = map(vals[0],0,1023,0,3);
    float forceP2 = map(vals[1],0,1023,0,3);
    println("" + forceP1);
    if(forceP1 > 0.1)
    {
      playerOne.healthBar.damage = forceP1;
      playerOne.punch = true;
    }
    else
    {
      playerOne.healthBar.damage = 0;
      playerOne.punch = false;
    }
    
    if(forceP2 > 0.1)
    {
      playerTwo.healthBar.damage = forceP2;
      playerTwo.punch = true;
    }
    else
    {
      playerTwo.healthBar.damage = 0;
      playerTwo.punch = false;
    }
  }
}