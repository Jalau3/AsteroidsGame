Spaceship blob = new Spaceship();

void setup(){
  size(500,500);
  background(0);
}

void draw(){
  background(0);
  blob.show();
  blob.move();
}

void keyPressed(){
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


