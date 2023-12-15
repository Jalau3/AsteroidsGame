Spaceship blob = new Spaceship();
Star[] stars = new Star[100];
ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
ArrayList <Spaceship> showLives = new ArrayList<Spaceship>();
int countB, score, lives, highscore;
float countH;
boolean play;

public void setup() {
  size(600, 600);
  countB = 0;
  countH = 0;
  lives = 0; 
  score = 0;
  highscore = 0;
  play = false;
  background(0);
  for (int i = 0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  for (int i = 0; i<10; i++) {
    rocks.add(new Asteroid());
  }
  for (int i = 0; i<lives; i++) {
    showLives.add(new Spaceship(width-i*20-15));
  }
}

public void draw() {
  background(0);
  if (countB>0)
    countB--;
  if(countH > 0)
    countH = countH-0.3;
  if (lives>0) {
    blob.show();
    blob.move();
    for (int i = 0; i<lives; i++) {
      showLives.get(i).show();
    }
    for (int i = 0; i<stars.length; i++) {
      stars[i].show();
    }
    for (int i = 0; i<rocks.size(); i++) {
      Asteroid rock = rocks.get(i);
      rock.move();
      float d = dist((float)blob.getX(), (float)blob.getY(), (float)rock.getX(), (float)rock.getY());
      if (d<rock.getRadius()+5) {
        rocks.remove(rock);
        spawnAsteroid();
        lives--;
      }
      rock.show();
    }
    for (int i = 0; i<bullets.size(); i++) {
      Bullet bullet = bullets.get(i);
      bullet.move();
      if (bullet.getX() == width || bullet.getX() == 0)
      {     
        bullets.remove(bullet);
      } 
      if (bullet.getY() == height || bullet.getY() == 0)
      {     
        bullets.remove(bullet);
      }
      bullet.show();
      for (int j = 0; j<rocks.size(); j++) {
        Asteroid rock = rocks.get(j);
        float db = dist((float)bullet.getX(), (float)bullet.getY(), (float)rock.getX(), (float)rock.getY());
        if (db<rock.getRadius()+5) {
          bullets.remove(bullet);
          rocks.remove(rock);
          score+=10;
          spawnAsteroid();
          if (Math.random()<0.25)
            spawnAsteroid();
        }
      }
    }
    //hyperspace button
    textSize(10); 
    textAlign(RIGHT);
    fill(255);
    text("Hyperspace",width-10, 50);
    //score
    fill(255);
    textSize(20);
    fill(210,52,235);
    textAlign(LEFT);
    text(score, 15, 50);
    //hyperspace load bar
    noFill();
    stroke(255);
    rect(width-112, 55, 102, 10);
    fill(210,52,235);
    noStroke();
    rect(width-11-(100-countH),56,100-countH,8);
  } else {
    if (score>highscore)
      highscore = score;
    for (int i = 0; i<stars.length; i++) {
      stars[i].show();
    }
    for (int i = 0; i<rocks.size(); i++) {
      rocks.get(i).show();
    }
    textAlign(CENTER);
    fill(235, 219, 52);
    if (play==true) {
      blob.show();
      textSize(20);
      text("Game Over", width/2, height/2);
      text("Press Space to restart", width/2, height/2+30);
    } else {
      textSize(50);
      text("Asteroids", width/2, width/2);
      textSize(20);
      text("Press Space to start", width/2, width/2+40);
    }
  }
    fill(255);
    textSize(20);
    textAlign(LEFT);
    text("HI: "+highscore, 15, 25);
}

public void spawnAsteroid() {
  rocks.add(new Asteroid());
  rocks.get(rocks.size()-1).spawn(Math.random());
}
public void keyPressed() {
  if (key == 'w') {
    blob.accelerate(0.5);
  }
  if (key == 'a') {
    blob.turn(-10);
  }
  if (key == 'd') {
    blob.turn(10);
  }
  if (key == 's') 

    blob.accelerate(-0.5);

  if (key == 'h') {
    if(countH == 0){
      blob.hyperspace();
      countH = 100;
    }
  }
  if (key == 32) {
    if (lives>0) {
      if (countB == 0) {
        bullets.add(new Bullet(blob));
        bullets.get(bullets.size()-1).accelerate(2);
        countB = 10;
      }
    } else {
      newGame();
    }
  }
}

public void newGame() {
  play = true;
  blob = new Spaceship();
  Star[] stars = new Star[100];
  rocks = new ArrayList <Asteroid>();
  bullets = new ArrayList <Bullet>();
  showLives = new ArrayList<Spaceship>();
  lives=5;
  score = 0;
  for (int i = 0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  for (int i = 0; i<10; i++) {
    rocks.add(new Asteroid());
  }
  for (int i = 0; i<lives; i++) {
    showLives.add(new Spaceship(width-i*(20)-15));
  }
}

