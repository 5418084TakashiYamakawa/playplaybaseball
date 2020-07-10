
int r = 10;
Camera_Imput imput;

void setup() {
  size(640, 480);
  String[] cameras = Capture.list();
  camera = new Capture(this, cameras[0]);
  imput = new Camera_Imput(width,height,r,camera);
  frameRate(30);
  
  smooth();
  noStroke();
  rectMode(CENTER);
}

void draw(){
  background(0);
  imput.update();
  if(imput.judge()){
    println(0);
  }else{
    println(1);
  }
}
