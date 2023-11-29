class Asteroid extends Floater{
  private float radius, rotSpeed;
  private float[] xCorners, yCorners;
  public Asteroid(){
    corners = (int)(Math.random()*5)+5;
    xCorners = new float[corners];
    yCorners = new float[corners];
    myCenterX = Math.random()*width;
    myCenterY = Math.random()*width;
    myXspeed = (Math.random()*3-1)*0.5;
    myYspeed = (Math.random()*3-1)*0.5;
    myPointDirection = Math.random()*2*Math.PI;
    myColor = 255;
    radius = (float)(Math.random()*20)+5;
    rotSpeed = (float)Math.random()+0.5;
  }
  public void createCorners(){
    for(int i = 0; i<corners; i++){
      float section = (2*PI*(i+1)/corners)+((float)Math.random()-0.5);
      float addRadius = (float)Math.random()*9-4;
      xCorners[i] = cos(section)*(radius+addRadius);
      yCorners[i] = sin(section)*(radius+addRadius);
    }
  }
  public void move(){
    turn(rotSpeed);
    super.move();
  }
   public void show()  //Draws the floater at the current position  
  {             
    stroke(myColor);    
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
