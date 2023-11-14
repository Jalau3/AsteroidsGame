class Star {
  private float x, y, size;
  public Star(){
    x = (float)(Math.random()*width);
    y = (float)(Math.random()*width);
    size = (float)(Math.random());
  }
  public void show(){
    stroke(255);
    fill(255);
    ellipse(x,y,size,size);
  }
}
