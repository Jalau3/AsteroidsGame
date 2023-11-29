Spaceship blob = new Spaceship();
Star[] stars = new Star[100];
ArrayList<Asteroid>rocks = new ArrayList<Asteroid>();

public void setup(){
  size(600,600);
  background(0);
  for(int i = 0; i<stars.length; i++){
    stars[i] = new Star();
  }
  for(int i = 0; i<10; i++){
    rocks.add(new Asteroid());
    (rocks.get(i)).createCorners();
  }
}

public void draw(){
  background(0);
  blob.show();
  blob.move();
  for(int i = 0; i<stars.length; i++){
    stars[i].show();
  }
  for(int j = 0; j<rocks.size(); j++){
    (rocks.get(j)).move();
    (rocks.get(j)).show();
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
 if(key == 'h'){
   blob.hyperspace();
 }
  
}



