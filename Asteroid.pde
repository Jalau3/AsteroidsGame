class Asteroid extends Spaceship{
  private float radius, turnSpeed;
  private float [] xCorners, yCorners; 
  public Asteroid(){
    corners = (int)(Math.random()*10+1);
    xCorners = new float[corners];
    yCorners = new float[corners];
    myCenterX = Math.random()*width;
    myCenterY = Math.random()*width;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = Math.random()*2*Math.PI;
    r = 210;
    g = 52;
    b = 235;
    radius = (float)Math.random()*5;
  }
  public void createCorners(){
    for(int i = 0; i<corners; i++){
      
    }
  }
}
