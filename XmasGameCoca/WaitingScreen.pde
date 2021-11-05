PImage BackTop;
PImage Bottles[];
int sizeFactor=4;

void setup(){
  size(1080/sizeFactor,1920/sizeFactor);  ////1080/4,1920/4
  background(229,30,42);
  for(int i=0; i<=26;i++){
    String bottle="";
    if(i<10){bottle="Bottle0"+i+".png";}
    else{bottle="Bottle"+i+".png";}
    println(bottle);
    Bottles[i]=loadImage(bottle);  
  }
  BackTop=loadImage("BackTop.png");
}

void draw(){
background(229,30,42);
imageMode(CENTER);

imageMode(CORNER);
image(BackTop,0,0);
}
