
MD[] Pixels;
int r = 10;

void setup() {
  size(640, 480);
  String[] cameras = Capture.list();
  camera = new Capture(this, cameras[0]);
  camera.start();
  camera.loadPixels();
  frameRate(30);
  
  smooth();
  noStroke();
  rectMode(CENTER);
  Pixels = new MD[width/r * height/r];
  int i = 0;
  for(int y = r/2; y < height; y += r){
    for(int x = r/2; x < width; x += r){
      Pixels[i] = new MD(x,y,camera.pixels[y*width + x]);
      i++;
    }
  }
}

void draw(){
  background(0);
  camera.loadPixels();
  int cnt = 0;
  for(int i = 0; i < Pixels.length; i++){
    if(Pixels[i].Mjudge()){
      cnt++;
    }
  }
  if(cnt >= 500){
    println(1);
  }else{
    println(0);
  }
  image(camera, 0, 0);
  int i = 0;
  for(int y = r/2; y < height; y += r){
    for(int x = r/2; x < width; x += r){
      Pixels[i].update(camera.pixels[y*width+x]);
      Pixels[i].judge();
      Pixels[i].display();
      i++;
    }
  }
}

void captureEvent(Capture camera) {
  camera.read();
}
