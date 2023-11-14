Spaceship blob = new Spaceship();
Star[] stars = new Star[100];

public void setup(){
  size(600,600);
  background(0);
  for(int i = 0; i<stars.length; i++){
    stars[i] = new Star();
  }
}

public void draw(){
  background(0);
  blob.show();
  blob.move();
  for(int i = 0; i<stars.length; i++){
    stars[i].show();
  }
}

public void keyPressed(){
 if(key == 'w'){
   blob.accelerate(0.5);
 }
 if(key == 'a'){
   blob.turn(-5);
 }
 if(key == 'd'){
   blob.turn(5);
 }
 if(key == 's'){
   blob.accelerate(-0.5);
 }
  
}



