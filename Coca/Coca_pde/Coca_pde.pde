import processing.video.*;

Movie VideoIntro00;
Movie VideoIntro01;
Movie VideoIntro02;

PImage IntroBack;
PImage GameBack;
PImage InstruccionesBack;
PImage PostalBack;
PImage CameraBack;
PImage texture;
int screen=0;

void setup(){
  //size(1080,1920);
  size(540,960,P3D);
  IntroBack=loadImage("IntroBack.png");
  GameBack=loadImage("GameBack.png");
  InstruccionesBack=loadImage("InstruccionesBack.png");
  PostalBack=loadImage("PostalBack.png");
  CameraBack=loadImage("CameraBack.png");
  IntroBack.resize(width,height);
  GameBack.resize(width,height);
  InstruccionesBack.resize(width,height);
  PostalBack.resize(width,height);
  CameraBack.resize(width,height);
  texture=loadImage("videoimg.png");
  VideoIntro00 = new Movie(this, "Video.mp4");
  VideoIntro02 = new Movie(this, "DEMO1.mp4");
  VideoIntro01 = new Movie(this, "Video2.mp4");
  VideoIntro00.play();
  VideoIntro01.play();VideoIntro01.pause();
  VideoIntro02.play();VideoIntro02.pause();
}

void draw(){
  switch(screen){
    case 1:
      instrucciones();
      break;
    case 2:
      game();
      break;
    case 3:
      cameraScreen();
      break;
    case 4:
      postal();
      break;
    default:
      intro();
      break;
  }
}
void game(){
  background(GameBack);

}

void cameraScreen(){
  background(CameraBack);

}
void postal(){
  background(PostalBack);


}


void intro(){
  background(IntroBack);
  //image(VideoIntro00, 12, 0, width-width*.05, height);
  VideoVertex();
  VideoChanger();  
}

void instrucciones(){
  background(InstruccionesBack);
}


void VideoVertex(){
  imageMode(CORNER);
  noStroke();
  beginShape(QUAD);
  texture(texture);
  /*
  vertex(12, 358, 506, 315);
  vertex(506, 315, 533, 666);
  vertex(533, 666, 35, 704);
  vertex(35, 704, 12, 360);
  vertex(12, 358, 506, 322);
  */
  int X0=12;int X1=506;int X2=533;int X3=35;
  int Y0=358;int Y1=320;int Y2=666;int Y3=704;
  vertex(X0, Y0, 120, 0);
  vertex(X1, Y1, texture.width-120, 0);
  vertex(X2, Y2, texture.width-120, texture.height);
  vertex(X3, Y3, 120, texture.height);
  endShape();
}

////X0=12,Y0=360,X1=506,Y1=322,X2=40,Y2=704,X4=533,Y4=666

void movieEvent(Movie m) {
  m.read();
  texture=m;
}

void VideoChanger(){
  println("Videos");
  println(int(VideoIntro00.time()*100)+" vs "+ int(VideoIntro00.duration()*100));
  println(int(VideoIntro01.time()*100)+" vs "+ int(VideoIntro01.duration()*100));
  println(int(VideoIntro02.time()*100)+" vs "+ int(VideoIntro02.duration()*100));
  if(int(VideoIntro00.time()*100)>=int(VideoIntro00.duration()*100)){
    VideoIntro00.jump(0.01);
    VideoIntro00.pause();
    VideoIntro01.play();
    println("Video00 ended");
  }
  if(int(VideoIntro01.time()*100)>=int(VideoIntro01.duration()*100)){
    VideoIntro01.jump(0.01);
    VideoIntro01.pause();
    VideoIntro02.play();
    println("Video01 ended");
  }
  if(int(VideoIntro02.time()*100)>=int(VideoIntro02.duration()*100)){
    VideoIntro02.jump(0.01);
    VideoIntro02.pause();
    VideoIntro00.play();
    println("Video02 ended");
  }
  
}

void keyPressed(){
  screen=0;
  if(key=='1'){
    screen=1;
  }
  if(key=='2'){
    screen=2;
  }
  if(key=='3'){
    screen=3;
  }
  if(key=='4'){
    screen=4;
  }
  
}
