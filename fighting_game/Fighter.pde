class Fighter
{
  PVector[] body = new PVector(6);
  PVector headPos = new PVector();
  PVector torsoPos = new PVector();
  PVector leftLegPos = new PVector();
  PVector rightLegPos = new PVector();
  PVector leftHandPos = new PVector();
  PVector rightHandPos = new PVector();
  float[] bodySize = {25,10,75,7.5,50};
  
  Fighter(float hX,float hY)
  {
    headPos = (hX,hY);
  }
  
  public void drawFighter()
  {
    torsoPos.x = headPos.x;
    torsoPos.y = headPos.y + bodySize[0]/2 + bodySize[2]/2;
    leftLegPos.x = torsoPos.x - bodySize[1]/2;
    leftLegPos.y = torsoPos.y - bodySize[2];
    rightLegPos.x = torsoPos.x + bodySize[1]/2;
    rightLegPos.y = torsoPos.y - bodySize[2];
    body[0] = headPos;
    body[1] = torsoPos;
    body[2] = leftLegPos;
    body[3] = rightLegPos;
    body[4] = leftHandPos;
    body[5] = rightHandPos;
    ellipse(headPos.x,headPos.y,bodySize[0],bodySize[0]);
    ellipse(torsoPos.x,torsoPos.y,bodySize[1],bodySize[2]);
    ellipseMode(RIGHT);
    pushMatrix();
    rotate(-PI/4);
    ellipse(leftLegPos.x,leftLegPos.y,bodySize[3],bodySize[4]);
    popMatrix();
    pushMatrix();
    rotate(PI/4);
    ellipse(rightLegPos.x,rightLegPos.y,bodySize[3],bodySize[4]);
    popMatrix();
    
  }
}