Alien theAliens[];
Player thePlayer;
Bullet theBullet;
PImage normalImg, explodeImg;
final int SCREENX=400;
final int SCREENY=400;
final int GAP=10;
final int ALIEN_ALIVE=0;
final int ALIEN_DEAD=6;
final int FORWARD=0;
final int BACKWARD=1;
final int PLAYERHEIGHT = 60;
final int MARGIN = 10;
final int PLAYERWIDTH = 20;
ArrayList<Bullet> bullets;

void settings(){ size(SCREENX, SCREENY);
}
void setup(){
  normalImg= loadImage("invader.GIF");
  explodeImg = loadImage("exploding.GIF");
  theAliens = new Alien[10];
  theBullet = null;
  thePlayer = new Player(SCREENX/2, SCREENY- PLAYERHEIGHT-
  MARGIN, PLAYERWIDTH, PLAYERHEIGHT); 
  init_aliens(theAliens,normalImg, explodeImg);
  bullets = new ArrayList<Bullet>();
}

void draw(){
  background(0);
  thePlayer.move(mouseX);
  thePlayer.draw();
  /*if(theBullet != null){
    theBullet.move();
    theBullet.collide(theAliens);
    theBullet.draw();
  }*/
  if(bullets.size() != 0){
    for(int i=0;i<bullets.size();i++){
      bullets.get(i).move();
      bullets.get(i).collide(theAliens);
      bullets.get(i).draw();
    }
  }
  for(int i=0; i<theAliens.length; i++){
    theAliens[i].move();
    theAliens[i].draw();
  }
}

void init_aliens(Alien theArray[], PImage normalImg, PImage explodeImg){
  int xd =0;
  for(int i=0; i<theArray.length; i++){
    theArray[i] = new Alien(int(0-xd), int(0), normalImg, explodeImg);
    xd += 50;
  }
}

void mousePressed(){
  //theBullet= new Bullet(thePlayer.x()+thePlayer.width()/2, thePlayer.y());
  bullets.add(new Bullet(thePlayer.x()+thePlayer.width()/2, thePlayer.y()));
}
