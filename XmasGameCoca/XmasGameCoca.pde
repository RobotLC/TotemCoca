
Timer ShowingTimer;
Timer GameTimer;

PImage backgroundImage;

void setup(){
  size(200,200);
  ShowingTimer = new Timer(50000); 
  ShowingTimer.start();
  backgroundImage=loadImage("Cocabg.png");
  backgroundImage.resize(width,height);
}

void draw(){
  background(backgroundImage);
  text(ShowingTimer.ellapsedTime(),width/2,height/2);
}


void mousePressed(){
  ShowingTimer.start();

}
