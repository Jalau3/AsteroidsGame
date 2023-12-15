class Bullet extends Spaceship {
  Bullet(Spaceship ship) {
    myCenterX = ship.getX();
    myCenterY = ship.getY();
    myXspeed = ship.getXspeed();
    myYspeed = ship.getYspeed();
    myPointDirection = blob.getDirection();
    r = 210;
    g = 52;
    b = 235;
  }
  public void show() {
    stroke(r, g, b);
    fill(r, g, b);
    ellipse((float)myCenterX, (float)myCenterY, 5, 5);
  }
}
