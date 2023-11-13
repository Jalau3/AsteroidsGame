class Spaceship extends Floater{
  protected int r,g,b;
  public Spaceship(){
    corners = 3;
    xCorners = new int[]{-8,-8,16};
    yCorners = new int[]{8,-8,0};
    myCenterX = 250;
    myCenterY = 250;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = -90;
    r = 210;
    g = 52;
    b = 235;
  }
    public void show ()  //Draws the floater at the current position  
  {             
    stroke(r,g,b);    
    noFill();
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
}
