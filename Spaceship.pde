class Spaceship extends Floater {
  protected int r, g, b;
  public Spaceship() {
    corners = 4;
    xCorners = new int[]{-8, -3, -8, 16};
    yCorners = new int[]{8, 0, -8, 0};
    myCenterX = 300;
    myCenterY = 300;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = -90;
    r = 210;
    g = 52;
    b = 235;
  }
  public Spaceship(int x) {
    corners = 4;
    xCorners = new int[]{-5, 0, -5, 10};
    yCorners = new int[]{5, 0, -5, 0};
    myCenterX = x;
    myCenterY = 25;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = -90;
    r = 210;
    g = 52;
    b = 235;
  }
  public void show ()  //Draws the floater at the current position  
  {             
    stroke(r, g, b);    
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
  public double getX() {
    return myCenterX;
  }
  public double getY() {
    return myCenterY;
  }
  public double getXspeed() {
    return myXspeed;
  }
  public double getYspeed() {
    return myYspeed;
  }
  public double getDirection() {
    return myPointDirection;
  }
  public void hyperspace() {
    myCenterX = Math.random()*width;
    myCenterY = Math.random()*width;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = Math.random()*360;
  }
}
