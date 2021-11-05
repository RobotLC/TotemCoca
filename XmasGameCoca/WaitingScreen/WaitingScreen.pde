PImage BackTop;
PImage Bottles[];
int sizeFactorBottles=8;
int sizeFactor=4;
float BH[] = new float[6];
  
void setup(){
  size(270,480);  ////1080/4,1920/4
  background(229,30,42);
  Bottles = new PImage[27];
  for(int i=0; i<=26;i++){
    String bottle="";
    if(i<10){bottle="Bottle0"+i+".png";}
    else{bottle="Bottle"+i+".png";}
    Bottles[i]=loadImage(bottle);
    Bottles[i].resize(Bottles[i].width/sizeFactorBottles,Bottles[i].width/sizeFactorBottles);
  }
  BackTop=loadImage("BackTop.png");
  BackTop.resize(BackTop.width/sizeFactor,BackTop.height/sizeFactor);
}

void draw(){
background(229,30,42);
imageMode(CENTER);
AnimationAbrazo();

imageMode(CORNER);
image(BackTop,0,0);
}

void AnimationAbrazo(){
  float marginX=width*.10;  //////10 %
  float marginY=height*.25; ///////25%
  int BX=Bottles[0].width;
  float Separation=(width-marginX*2)/6;
  for (int i=0; i<6; i++){
    BH[i]=BH[i]+random(0,50);
    if(BH[i]>height-marginY-Bottles[0].height){
      BH[i]=height-marginY-Bottles[0].height;
    }
    println(BH[i]);
  }
  /////////////////ABRAZO
  image(Bottles[0],marginX/2+Separation,BH[0]);
  image(Bottles[1],marginX/2+Separation*2,BH[1]);
  image(Bottles[18],marginX/2+Separation*3,BH[2]);
  image(Bottles[0],marginX/2+Separation*4,BH[3]);
  image(Bottles[26],marginX/2+Separation*5,BH[4]);
  image(Bottles[15],marginX/2+Separation*6,BH[5]);


}

void PlaceAbrazo(){
  float marginX=width*.10;  //////10 %
  float marginY=height*.25; ///////25%
  int BX=Bottles[0].width;
  float Separation=(width-marginX*2)/6;
  /////////////////ABRAZO
  image(Bottles[0],marginX/2+Separation,height-marginY-Bottles[0].height);
  image(Bottles[1],marginX/2+Separation*2,height-marginY-Bottles[0].height);
  image(Bottles[18],marginX/2+Separation*3,height-marginY-Bottles[0].height);
  image(Bottles[0],marginX/2+Separation*4,height-marginY-Bottles[0].height);
  image(Bottles[26],marginX/2+Separation*5,height-marginY-Bottles[0].height);
  image(Bottles[15],marginX/2+Separation*6,height-marginY-Bottles[0].height);
}
